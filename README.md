
# Biggs PMS Registration

This project is a Dockerized PHP + PostgreSQL backend for a registration system, including API endpoints and database schema for Biggs PMS.

## Features
- REST API endpoints (PHP, Apache)
- PostgreSQL database with schema and seed data
- Docker Compose for easy setup
- Example SQL schema: `biggsPmsRegistration.sql`

## Prerequisites
- Docker
- Docker Compose

## Quick Start

1. **Clone the repository and place your files:**
  - Ensure you have the following files in your project root:
    - `docker-compose.yml`
    - `.env`
    - `biggsPmsRegistration.sql`
    - PHP source files in `src/`

2. **Configure environment variables:**
  - Edit `.env`:
    ```
    DB_HOST=db
    DB_NAME=biggspmsregistration
    DB_USER=blkgrn14
    DB_PASSWORD=yourpassword
    ```

3. **Build and start the containers:**
  ```sh
  docker-compose up --build
  ```

4. **Initialize the database schema:**
  - After the containers are running, load the schema:
    ```sh
    docker-compose exec db psql -U blkgrn14 -d biggspmsregistration -f /biggsPmsRegistration.sql
    ```
    If the file is not yet in the container, copy it first:
    ```sh
    docker cp biggsPmsRegistration.sql biggspmsregitration-db-1:/biggsPmsRegistration.sql
    docker-compose exec db psql -U blkgrn14 -d biggspmsregistration -f /biggsPmsRegistration.sql
    ```

5. **Test the API:**
  - Use Postman or curl to test endpoints (e.g., `POST /api/register.php`).

## Database Schema

See `biggsPmsRegistration.sql` for full schema and seed data. Example tables:
- `users`: Stores registration info
- `biggs_locations`: Reference locations
- `biggs_branches`: Branch info

## Example: biggsPmsRegistration.sql

```
-- biggsPmsRegistration.sql


```

## Troubleshooting
- If you get `relation does not exist`, make sure you loaded the SQL schema after the database container started.
- Always restart containers after changing `.env` or `docker-compose.yml`.
- Check logs with `docker-compose logs` for errors.

## License
MIT

---

## How to Contribute

1. Fork and clone the repo
2. Create a feature branch
3. Commit with clear messages
4. Open a pull request

---

## License

MIT
