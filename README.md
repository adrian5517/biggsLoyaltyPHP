
# Biggs PMS Registration

This project is a Dockerized PHP + PostgreSQL backend for a registration system, including API endpoints and database schema for Biggs PMS.

## Features
- REST API endpoints (PHP, Apache)

# Biggs PMS Registration System

This project is a Dockerized PHP + PostgreSQL backend for Biggs PMS registration. It provides REST API endpoints for user registration, menu and branch lookup, and user statistics.

## What This Code Does

- Lets users register with a unique Tag ID, phone number, date of birth, favorite menu (multiple allowed), and preferred branch.
- Saves user info in the `users` table and their favorite menu choices in the `user_favorite_menu` table.
- Returns clear error messages (e.g., if Tag ID already exists).
- Provides endpoints to fetch menu items, branch locations, and user count.
- All endpoints are CORS-enabled for easy frontend integration.

## Database Structure

- **users**: Main user registration info (tag_id, phone_number, date_of_birth, frequented_biggs_location_id, etc.)
- **user_favorite_menu**: Stores each user's favorite menu selections (user_tag_id, menu_id)
- **menu**: Menu items
- **biggs_branches**: Branch/location info

See `biggsPmsRegistration.sql` for full schema and seed data.

## API Endpoints (All JSON)

### Register User
**POST** `/api/register.php`

**Request Body:**
```
{
  "tag_id": "string",                // required, unique
  "phone_number": "string",          // required
  "date_of_birth": "YYYY-MM-DD",     // required
  "favorite_menu": [1, 2, 3],         // array of menu IDs (multiple allowed)
  "frequented_biggs_location_id": 15, // required, branch ID
  "interested_in_events": true,       // optional
  "interested_in_franchise": false    // optional
}
```
**Success:**
```
{ "success": true, "message": "User registered successfully" }
```
**Duplicate Tag ID:**
```
{ "error": "Tag ID already exists. Please use a different Tag ID." }
```

### Get Menu List
**GET** `/api/menu_list.php`

**Response:**
```
[ { "m_id": 1, "m_title": "Baby Back Ribs" }, ... ]
```

### Get Branches
**GET** `/api/branches.php`

**Response:**
```
{
  "success": true,
  "data": [
    {
      "id": 15,
      "title": "BIGGS IRIGA",
      "description": "...",
      "images": ["image1.png", "image2.png"],
      "contact": "0907-904-1992",
      "latitude": 13.4213,
      "longitude": 123.4121,
      "has_venue_hall": true
    },
    ...
  ]
}
```

### Get User Count
**GET** `/api/user_count.php`

**Response:**
```
{ "success": true, "count": 123 }
```

## Quick Start

1. **Clone the repository and ensure you have:**
   - `docker-compose.yml`, `.env`, `biggsPmsRegistration.sql`, and PHP source files in `src/`
2. **Edit `.env` with your DB credentials.**
3. **Build and start containers:**
   ```sh
   docker-compose up --build
   ```
4. **Initialize the database schema:**
   ```sh
   docker-compose exec db psql -U <DB_USER> -d <DB_NAME> -f /biggsPmsRegistration.sql
   ```
5. **Test the API using Postman, curl, or your frontend.**

## Troubleshooting

- If you get `relation does not exist`, make sure you loaded the SQL schema after the database container started.
- Always restart containers after changing `.env` or `docker-compose.yml`.
- Check logs with `docker-compose logs` for errors.

## Contribution

1. Fork and clone the repo
2. Create a feature branch
3. Commit with clear messages
4. Open a pull request

## License

MIT
