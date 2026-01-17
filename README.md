# Movies API

Movies API is a RESTful web API built with Ruby on Rails.  
The application provides functionality for managing movies, people (actors and directors), castings, reviews, users, and authentication sessions.

This project was developed as part of a diploma thesis.

---

## Technologies Used

- Ruby 3.3.x
- Ruby on Rails 7
- SQLite

---

## Setup and Installation

### Clone the repository

```
git clone https://github.com/ivanak7899/movies_api.git
cd movies_api
```

### Install dependencies

```
bundle install
```

### Set up the database

```
rails db:create
rails db:migrate
rails db:seed
```

### Start the server

```
rails server
```

The API will be available at:  
http://localhost:3000

---

## Default Users (Seed Data)

After running `rails db:seed`, the following users are available for testing:

| Role       | Username   | Email                  | Password    |
|------------|------------|------------------------|-------------|
| admin      | admin      | admin@example.com      | admin_pass  |
| moderator  | moderator  | moderator@example.com  | mod_pass    |
| user       | john       | john@example.com       | john_pass   |
| user       | jane       | jane@example.com       | jane_pass   |

---

## API Endpoints

All endpoints return JSON responses.  
Endpoints marked with 🔒 require authentication (Authorization token).

### Authentication

| Method | Endpoint        | Description |
|------|-----------------|-------------|
| POST | /session        | Login (create session) |
| DELETE | /session 🔒   | Logout (destroy session) |

---

### Users

| Method | Endpoint | Description |
|------|---------|-------------|
| GET | /users 🔒 | List users (admin only) |
| GET | /users/:id 🔒 | Show user (self or admin) |
| POST | /users | Create user |
| PATCH | /users/:id 🔒 | Update user (self or admin) |
| DELETE | /users/:id 🔒 | Delete user (self or admin) |

---

### Movies

| Method | Endpoint | Description |
|------|---------|-------------|
| GET | /movies 🔒 | List movies |
| GET | /movies/:id 🔒 | Show movie |
| POST | /movies 🔒 | Create movie (admin, moderator) |
| PATCH | /movies/:id 🔒 | Update movie (admin, moderator) |
| DELETE | /movies/:id 🔒 | Delete movie (admin, moderator) |

---

### People (Actors / Directors)

| Method | Endpoint | Description |
|------|---------|-------------|
| GET | /people 🔒 | List people |
| GET | /people/:id 🔒 | Show person |
| POST | /people 🔒 | Create person (admin, moderator) |
| PATCH | /people/:id 🔒 | Update person (admin, moderator) |
| DELETE | /people/:id 🔒 | Delete person (admin, moderator) |

---

### Castings

| Method | Endpoint | Description |
|------|---------|-------------|
| GET | /castings 🔒 | List castings |
| GET | /castings/:id 🔒 | Show casting |
| POST | /castings 🔒 | Create casting (admin, moderator) |
| PATCH | /castings/:id 🔒 | Update casting (admin, moderator) |
| DELETE | /castings/:id 🔒 | Delete casting (admin, moderator) |

---

### Reviews

| Method | Endpoint | Description |
|------|---------|-------------|
| GET | /reviews 🔒 | List reviews |
| GET | /reviews/:id 🔒 | Show review |
| POST | /reviews 🔒 | Create review |
| PATCH | /reviews/:id 🔒 | Update own review |
| DELETE | /reviews/:id 🔒 | Delete own review (admin/moderator: any) |

---

## Login (Create Session)

Authentication is implemented using token-based sessions.

After a successful login, the server returns a unique token.  
This token must be included in the `Authorization` header for all authenticated requests.

Example login request:

```
curl -X POST http://localhost:3000/session \
-H "Content-Type: application/json" \
-d '{
  "session": {
    "email": "admin@example.com",
    "password": "admin_pass"
  }
}'
```

---

## Authenticated Requests

Example request using the token:

```
curl http://localhost:3000/movies \
-H "Authorization: YOUR_AUTH_TOKEN"
```

---

## Logout

```
curl -X DELETE http://localhost:3000/session \
-H "Authorization: YOUR_AUTH_TOKEN"
```

---

## Testing

The project uses RSpec for automated testing.

Tests include:
- model specs
- request specs
- policy specs
- serializer specs

Run the test suite with:

```
bundle exec rspec
```

---
