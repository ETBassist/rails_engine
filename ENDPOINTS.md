# Endpoints

* [ReST Endpoints](#rest-endpoints)
  * [Index of a Resouce](#see-index-of-specified-resource)
  * [See Single Record](#show-single-record)
  * [Create Record](#create-a-record)
  * [Update Record](#update-a-record)
  * [Delete Record](#delete-record)
* [Relationship Endpoints](#relationship-endpoints)
* [Finder Endpoints](#find-endpoints)
  * [Find a Single Resource](#find-single-resource)
  * [Find Multiple of a Resource](#find-multiple-of-a-resource)
* [Business Intelligence Endpoints](#business-intelligence-endpoints)
  * [Merchants with Most Revenue](#merchants-with-most-revenue)
  * [Merchants with Most Items Sold](#merchants-with-most-items-sold)
  * [Revenue in Date Range](#revenue-across-date-range)
  * [Revenue for a Merchant](#revenue-for-a-merchant)

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

## Relationship Endpoints

`GET /api/v1/merchants/:id/items` OR `GET /api/v1/items/:id/merchants`

Will return information formatted similary to the [index endpoints](#see-index-of-specified-resource)

## Find Endpoints

#### Find Single Resource

`GET /api/v1/<resource>/find?<attribute>=<value>`

Should work for any attribute on the corresponding resource including `updated_at` and `created_at` timestamps.\
Will try to find partial matches and be case insensitive for attributes stored as a string.\
Example response for `GET /api/v1/merchants/find?name=ring`
```json
{
  "data": {
    "id": 4,
    "type": "merchant",
    "attributes": {
      "name": "Ring World"
    }
  }
}
```

#### Find Multiple of a Resource

`GET /api/v1/<resource>/find_all?<attribute>=<value>`

Should work for any attribute on the corresponding resource including `updated_at` and `created_at` timestamps.\
Will try to find partial matches and be case insensitive for attributes stored as a string.\
Example response for `GET /api/v1/merchants/find_all?name=ring`
```json
{
  "data": [
    {
      "id": "4",
      "type": "merchant",
      "attributes": {
        "name": "Ring World"
      }
    },
    {
      "id": "1",
      "type": "merchant",
      "attributes": {
        "name": "Turing School"
      }
    }
  ]
}
```

## Business Intelligence Endpoints

#### Merchants with Most Revenue

`GET /api/v1/merchants/most_revenue?quantity=x`

Will return `x` number of merchants ordered by revenue that merchant has earned\
Example response for `GET /api/v1/merchant/most_revenue?quantity=2`
```json
{
  "data": [
    {
      "id": "1",
      "type": "merchant",
      "attributes": {
        "name": "Turing School"
      }
    },
    {
      "id": "4",
      "type": "merchant",
      "attributes": {
        "name": "Ring World"
      }
    }
  ]
}
```

#### Merchants with Most Items Sold

`GET /api/v1/merchants/most_items?quantity=x`

Will return `x` number of merchants ordered by the number of items that merchant has sold\
Example response for `GET /api/v1/merchants/most_items?quantity=2`
```json
{
    "data": [
        {
            "id": "89",
            "type": "merchant",
            "attributes": {
                "name": "Kassulke, O'Hara and Quitzon"
            }
        },
        {
            "id": "12",
            "type": "merchant",
            "attributes": {
                "name": "Kozey Group"
            }
        },
        {
            "id": "22",
            "type": "merchant",
            "attributes": {
                "name": "Thiel Inc"
            }
        }
    ]
}
```

#### Revenue Across Date Range

`GET /api/v1/revenue?start=<start_date>&end=<end_date>`

Returns the sum of all revenue made by all merchants between the given dates\
Revenue is only counted if an associated transaction is successful and an invoice has a status of 'shipped'
Example response for `GET /api/v1/revenue?start=2012-03-09&end=2012-03-24`
```json
{
    "data": {
        "id": null,
        "type": "revenue",
        "attributes": {
            "revenue": 43201227.80000031
        }
    }
}
```

#### Revenue for a Merchant

`GET /api/v1/merchants/:id/revenue`

Returns the sum of all revenue made by a specified merchant\
As with the previous query, revenue is only considered if it is part of a successful transaction and has been shipped.
Example response for `GET /api/v1/merchants/4/revenue`
```json
{
    "data": {
        "id": null,
        "type": "revenue",
        "attributes": {
            "revenue": 558055.22
        }
    }
}
```
