#!/usr/bin/env bash
#
# Read-only health checks for the private cloud host.
# Run from the repository or any directory:
#   bash scripts/check-status.sh
#
# This script does not change system configuration or restart services.

set -u

PASS=0
WARN=0

check_command() {
  local label="$1"
  local command_name="$2"

  if command -v "$command_name" >/dev/null 2>&1; then
    printf '[OK]   %s is available\n' "$label"
    PASS=$((PASS + 1))
  else
    printf '[WARN] %s is not installed or not in PATH\n' "$label"
    WARN=$((WARN + 1))
  fi
}

check_mount() {
  local label="$1"
  local path="$2"

  if mountpoint -q "$path"; then
    printf '[OK]   %s is mounted\n' "$label"
    PASS=$((PASS + 1))
  else
    printf '[WARN] %s is not mounted (%s)\n' "$label" "$path"
    WARN=$((WARN + 1))
  fi
}

check_service() {
  local label="$1"
  local service="$2"

  if systemctl is-active --quiet "$service"; then
    printf '[OK]   %s is active\n' "$label"
    PASS=$((PASS + 1))
  else
    printf '[WARN] %s is not active\n' "$label"
    WARN=$((WARN + 1))
  fi
}

echo "Private Cloud - Basic Health Check"
echo "----------------------------------"

check_command "Docker" docker
check_command "Docker Compose" docker
check_command "Tailscale" tailscale
check_command "mountpoint" mountpoint

if command -v docker >/dev/null 2>&1; then
  if docker compose version >/dev/null 2>&1; then
    printf '[OK]   Docker Compose plugin is available\n'
    PASS=$((PASS + 1))
  else
    printf '[WARN] Docker Compose plugin is unavailable\n'
    WARN=$((WARN + 1))
  fi

  if docker info >/dev/null 2>&1; then
    printf '[OK]   Docker daemon is reachable\n'
    PASS=$((PASS + 1))
  else
    printf '[WARN] Docker daemon is not reachable (try running with sudo)\n'
    WARN=$((WARN + 1))
  fi
fi

check_mount "Immich data volume" "/mnt/immich-data"
check_mount "Database backup volume" "/mnt/cloud-backup"
check_service "Immich database backup timer" "immich-backup.timer"

if command -v tailscale >/dev/null 2>&1; then
  if tailscale status >/dev/null 2>&1; then
    printf '[OK]   Tailscale command completed successfully\n'
    PASS=$((PASS + 1))
  else
    printf '[WARN] Tailscale is not connected or status is unavailable\n'
    WARN=$((WARN + 1))
  fi
fi

echo "----------------------------------"
printf 'Checks passed: %s | Warnings: %s\n' "$PASS" "$WARN"
echo "This is a basic check, not a full security or backup-restore test."
