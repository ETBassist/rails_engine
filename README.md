# Rails Engine
Rails Engine is a Ruby on Rails API built to serve as the backend for [Rails Driver](https://github.com/ETBassist/rails_driver)  

## Endpoints

#### Index of Resource
`GET /api/v1/merchants` OR `GET /api/v1/items`\

Returns a JSON response of all records of the requested resource\
Example Response:
```json
{
  "data": [
    {
      "id": "1",
      "type": "merchant",
      "attributes": {
        "name": "Jack's Beanstalk Bizarre"
      }
    },
    {
      "id": "3"
      "type": "merchant",
      "attributes": {
        "name": "Season's Eatings"
      }
    }
  ]
}
```

#### Show Single Record
`GET /api/v1/item/:id` OR `GET /api/v1/merchants/:id`\

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
## Schema
![rails_engine_schema](https://user-images.githubusercontent.com/45305677/101933479-1bf0e180-3b91-11eb-921c-bcb23d8b14c6.png)
