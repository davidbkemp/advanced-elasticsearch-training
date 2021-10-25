# Percolator Exercises

Perform the following to create an index for holding queries to find child care centres.

Note the field names, types, and declared analysers.

```
PUT /childcare-queries
{
  "mappings": {
    "properties": {
      "saved_query": {
        "type": "percolator"
      },
      "name": {
        "type": "text",
        "analyzer": "english"
      },
      "contact_ph": {
        "type": "keyword"
      },
      "geocode": {
        "type": "geo_point"
      }
    }
  }
}
```

Save some queries as follows:

```
# Childcare centres whose name includes the word "goat"
PUT /childcare-queries/_doc/1
{
  "saved_query": {
    "match": {
      "name": "goat"
    }
  }
}

# Childcare centres whose name includes the word "goodstart"
PUT /childcare-queries/_doc/2
{
  "saved_query": {
    "match": {
      "name": "goodstart"
    }
  }
}

# Childcare centres whose name includes the word "goodstart"
# OR is within 40km of the location 38 South, 145 East
PUT /childcare-queries/_doc/3
{
  "saved_query": {
    "bool": {
      "should": [
        {
          "match": {
            "name": "goodstart"
          }
        },
        {
          "geo_distance": {
            "distance": "40km",
            "geocode": {
              "lat": -38,
              "lon": 145
            }
          }
        }
      ]
    }
  }
}

```


Use a `percolate` query to find those saved queries that match this document:


```json
{
  "name": "Billy Goat's Child Care",
  "contact_ph": "03 9999 2222",
  "geocode": {
    "lat": -37.80932522,
    "lon": 144.96026152
  }
}
```


It should look a bit like this....

```
GET /childcare-queries/_search
{
  "query": {
    "percolate": {
      ....
  }
}
```
