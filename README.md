# Asset Tracking

##### by Adrian Carlson

Portfolio Project for NuCamp SQL with Python Course. Using PostgreSQL and Flask to create and Asset Tracking database and API endpoints to access the data.

## API Reference Table

| HTTP Verb | Path                                    | Used for                                                                     |
| --------- | --------------------------------------- | ---------------------------------------------------------------------------- |
| GET       | [/devices](/devices)                    | Display list of devices and their attributes                                 |
| GET       | [/devices/:id](/devices/:id)            | Display a specified device by id and its attributes                          |
| POST      | [/devices](/devices)                    | Create a new device                                                          |
| DELETE    | [/devices/:id](/devices/:id)            | Delete a specific device by id                                               |
| PUT       | [/devices/:id](/devices/:id)            | Update a specific device by id (serial_number is required)                   |
| GET       | [/schools](/schools)                    | Display list of schools and their attributes                                 |
| GET       | [/schools/:id](/schools/:id)            | Display a specified school by id and its attributes                          |
| POST      | [/schools](/schools)                    | Create a new school                                                          |
| DELETE    | [/schools/:id](/schools/:id)            | Delete a specific school by id                                               |
| PUT       | [/schools/:id](/schools/:id)            | Update a specific school by id (serial_number is required)                   |
| GET       | [/users](/users)                        | Display list of ss and their attributes                                      |
| GET       | [/ss/:id](/users/:id)                   | Display a specified user by id and its attributes                            |
| POST      | [/users](/users)                        | Create a new user                                                            |
| DELETE    | [/users/:id](/users/:id)                | Delete a specific user by id                                                 |
| PUT       | [/users/:id](/users/:id)                | Update a specific user by id (first_name and last_name are required)         |
| GET       | [/usersaccounts](/useraccounts)         | Display list of users accounts and their attributes                          |
| GET       | [/usersaccounts/:id](/useraccounts/:id) | Display a specified user account by id and its attributes                    |
| POST      | [/usersaccounts](/useraccounts)         | Create a new user account                                                    |
| DELETE    | [/usersaccounts/:id](/useraccounts/:id) | Delete a specific user account by id                                         |
| PUT       | [/usersaccounts/:id](/useraccounts/:id) | Update a specific user account by id (first_name and last_name are required) |

## Retrospective

1. How did the project's design evolve over time?
   - My perspective of this project evolved over time as my knowledged of SQL and Flask increased.
   - Initially, I created many mistakes in the setup of my database and my API calls.
     - For example: I have since gone back and corrected foreign keys and DateTime datatypes
1. Did you choose to use an ORM or raw SQL? Why?
   - This was a hard choice for me and I kept going back and forth. I initially wanted to go with the raw SQL approach. I am very comfortable with SQL and using Raw SQL made more sense to me. But I finally decided to go with ORM. I wanted to challenge myself and learn the Python backend process more.
1. What future improvements are in store, if any?
   - Ideally, this would be added to a front end interface so that someone can check out items to individual users.
   - Also with respect to normalization the type field on the Users table should be split off to a students and a teachers table. Type field should be converted to hold the id of the teacher or student
     - I did not have time to implement this change.
