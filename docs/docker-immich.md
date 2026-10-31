# Docker and Immich

## What are Docker and Immich?

Docker runs applications in containers. Docker Compose manages the related containers together.

Immich is the self-hosted photo and video application used in this private cloud.

## Current deployment

Immich is deployed on Ubuntu Server using Docker Compose. Its stack includes:

- Immich application
- Machine-learning service
- PostgreSQL database
- Redis

The application library is stored on the separate Immich data volume. The database files are kept in the application deployment directory.

## Useful commands

Go to the Immich Compose directory:

```bash
cd ~/immich-app
```

Show container status:

```bash
sudo docker compose ps
```

View recent logs:

```bash
sudo docker compose logs --tail=100
```

Follow logs for a service:

```bash
sudo docker compose logs -f
```

Pull updated images:

```bash
sudo docker compose pull
```

Apply updates:

```bash
sudo docker compose up -d
```

Check Docker disk usage:

```bash
sudo docker system df
```

## Important notes

- Keep the Compose file and environment configuration backed up securely.
- Never commit the `.env` file, passwords, tokens or private configuration.
- Review release notes before updating Immich.
- Back up the database and photo/video library.
- Verify that the application works after updates.
