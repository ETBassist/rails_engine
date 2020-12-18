# Rails Engine
## Table of Contents

* [About](#about)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Setup and Installation](#setup-and-installation)
* [Schema](#schema)
* [API Endpoints](#endpoints)

## About
Rails Engine is a Ruby on Rails API built to serve as the backend for [Rails Driver](https://github.com/ETBassist/rails_driver)  

## Getting Started
To run Rails Engine locally, you can fork this repo and clone it, or clone this repo with:  
`git clone https://github.com/ETBassist/rails_engine.git`

### Prerequisites
* Ruby 2.5.3
* Ruby on Rails 5.2.4.4

### Setup and Installation
From the Command Line, after cloning this repo:
1. `cd rails_engine` to go into the rails_engine directory
1. Run `bundle install` to install dependencies
1. Run `bundle exec rake data:import` to create database and import data (Note: You will see a warning when running this command that data may be deleted. This is fine unless you've already added data to the database)
1. You should now be able to run `bundle exec rspec` to see 58 passing tests
1. Run `rails s` to start up the Rails Server

You should now be able to visit any of the endpoints below by prefacing them with localhost:3000 to see the raw JSON response, or by using a client like Postman.\
You may also clone [Rails Driver](https://github.com/ETBassist/rails_driver) into the same parent directory and see the front end in action.

## Schema
![rails_engine_schema](https://user-images.githubusercontent.com/45305677/101933479-1bf0e180-3b91-11eb-921c-bcb23d8b14c6.png)

## Endpoints

### ReST Endpoints

For example responses and more details on each of these endpoints see [ENDPOINTS.md](ENDPOINTS.md)

Available resources: `merchants` or `items`
#### Index of Resource

>`GET /api/v1/<resource>`
>
>Returns a JSON response of all records of the requested resource

#### Show Single Record

>`GET /api/v1/<resource>/:id`
>
>Returns a JSON response of a single record matching the given id\

#### Create a Record

>`POST /api/v1/<resource>`
>
>Creates a new record of the specified resource

#### Update a Record

>`PATCH /api/v1/<resource>/:id`
>
>Updates the value of the specified resource and returns a JSON response containing the new attributes

#### Delete Record

>`DELETE /api/v1/<resource>/:id`
>
>Deletes the resource with a matching id. Will only return a status of 204 (No Content)

### Relationship Endpoints

>`GET /api/v1/merchants/:id/items` OR `GET /api/v1/items/:id/merchants`
>
>Same return as index of a resource, but will return records associated with the merchant or item matching the given id

### Find Endpoints

#### Single Finders

>`GET /api/v1/<resource>/find?<attribute>=<value>`
>
>Search for a particular resource with an attribute containing the value given; will attempt to find partial and case-insensitive matches if the attribute supplied is stored as a string.

#### Multi-Finders

>`GET /api/v1/<resource>/find_all?<attribute>=<value>`
>
>Search for multiples of a particular resource with an attribute containing the value given; will attempt to find partial and case-insensitive matches if the attribute supplied is stored as a string.

### Business Intelligence Endpoints

#### Merchants with Most Revenue

>`GET /api/v1/merchants/most_revenue?quantity=x`
>
>Will return `x` number of merchants ordered by revenue that merchant has earned.

#### Merchants with Most Items Sold

>`GET /api/v1/merchants/most_items?quantity=x`
>
>Will return `x` number of merchants ordered by items that merchant has sold.

#### Revenue Across Date Range

>`GET /api/v1/revenue?start=<start_date>&end=<end_date>`
>
>Returns the sum of all revenue made between the specified dates.

#### Revenue for a Merchant

>`GET /api/v1/merchants/:id/revenue`
>
>Returns the sum of all revenue a particular merchant with an id matching the one given has made.

