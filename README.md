# Rails Engine
## Table of Contents

* [About](#about)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Setup and Installation](#setup-and-installation)
* [API Endpoints](#endpoints)
* [Schema](#schema)

## About
Rails Engine is a Ruby on Rails API built to serve as the backend for [Rails Driver](https://github.com/ETBassist/rails_driver)  

## Getting Started
To run Rails Engine locally, you can fork this repo and clone it, or clone this repo with `git clone https://github.com/ETBassist/rails_engine.git`

### Prerequisites
* Ruby 2.5.3
* Ruby on Rails 5.2.4.4

### Setup and Installation
From the Command Line, after cloning this repo:
1. `cd rails_engine` to go into the rails_engine directory
1. Run `bundle install` to install dependencies
1. Run `bundle exec rake data:import` to create database and import data (Note: You will see a warning when running this command that data may be deleted. This is fine unless you've already added data to the database)
1. You should now be able to run `bundle exec rspec` to see 49 passing tests
1. Run `rails s` to start up the Rails Server

You should now be able to visit any of the endpoints below by prefacing them with localhost:3000 to see the raw JSON response, or by using a client like Postman.\
You may also clone [Rails Driver](https://github.com/ETBassist/rails_driver) into the same parent directory and see the front end in action.

## Endpoints

### ReST Endpoints

#### Index of Resource
`GET /api/v1/merchants` OR `GET /api/v1/items`

Returns a JSON response of all records of the requested resource\
Example Response:
```json
{
  "data": [
    {
      "id": "1",
      "type": "merchant",
      "attributes": {
        "name": "Jack's Beanstalk Bazaar"
      }
    },
    {
      "id": "3",
      "type": "merchant",
      "attributes": {
        "name": "Season's Eatings"
      }
    }
  ]
}
```

#### Show Single Record
`GET /api/v1/items/:id` OR `GET /api/v1/merchants/:id`

Returns a JSON response of a single record matching the given id\
Example Response:
```json
{
  "data": {
    "id": "1",
    "type": "item",
    "attributes": {
      "name": "Morning Symphone Blend",
      "description": "Bright, watery, green-tea, bergamont, green grape",
      "unit_price": 39.84,
      "merchant_id": 10316
    }
  }
}
```

#### Create a Record
`POST /api/v1/items` OR `POST /api/v1/merchants`

Creates a new record of the specified resource\
The body should be formatted as:
```json
{
  "attribute1": "value1",
  "attribute2": "value2"
}
```
Example Response:
```json
{
  "data": {
    "id": "1",
    "type": "merchant",
    "attributes": {
      "name": "Unicornucopia"
    }
  }
}
```

#### Update a Record
`PATCH /api/v1/items/:id` OR `PATCH /api/v1/merchants/:id`

Updates a pre-existing record\
The body should be formatted as:
```json
{
  "attribute1": "value1",
  "attribute2": "value2"
}
```
Example Response:
```json
{
  "data": {
    "id": "1",
    "type": "merchant",
    "attributes": {
      "name": "Season's Eatings"
    }
  }
}
```
## Schema
![rails_engine_schema](https://user-images.githubusercontent.com/45305677/101933479-1bf0e180-3b91-11eb-921c-bcb23d8b14c6.png)
