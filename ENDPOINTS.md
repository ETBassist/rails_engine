## ReST Endpoints

#### See Index of Specified Resource

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

#### Delete Record

`DELETE /api/v1/merchants/:id` OR `DELETE /api/v1/items/:id`

Will delete the resource matching the given id; will only return an HTTP status code of 204 (no content)
