# Proxmox VE

## What is Proxmox?

Proxmox VE is the software installed on the physical server. It lets one computer run virtual machines.

In this project, Proxmox runs on the Lenovo ThinkCentre M720s and hosts an Ubuntu Server virtual machine.

## Current setup

- Proxmox VE is installed on the physical machine.
- The server is managed through the Proxmox web interface.
- Ubuntu Server runs as a virtual machine.
- The VM uses virtual disks for its operating system and attached storage.

## Startup and shutdown

The physical computer starts Proxmox when it powers on. Automatic startup of the Ubuntu VM should be checked in the VM settings before it is documented as enabled.

For a safe shutdown, shut down the guest operating system cleanly before powering off the physical host, unless using Proxmox's supported shutdown controls.

## Useful administration tasks

- Check VM status in the Proxmox web interface.
- Review CPU, memory, disk and network usage.
- Take and manage VM backups before major changes.
- Keep Proxmox updated and restrict access to its management interface.

## Next steps

- Confirm whether Ubuntu VM automatic startup is enabled.
- Document the VM's CPU, memory and disk allocation.
- Plan and test a Proxmox VM backup and restore.
