# Elasticsearch Hands On Part 2 Exercises

**NOTE: You will not actually need to use logstash for this!!**

Modify the mapping you used for the child care centres index so that

- the name field uses the English analyser
- add a `query` field of type `percolator`.

Save a query for percolation that will match any document that
has the word "goat" in its name.

**Remember to use `match` instead of `term` when matching against the name.**

It should match a percolation query like this one:

```
GET /childcare-centres/_search
{
  "query": {
    "percolate": {
      "field": "query",
      "document": {
        "name": "Billy Goat's Child Care",
        "contact_ph": "03 9999 2222",
        "geocode": {
          "lat": -37.80932522,
          "lon": 144.96026152
        }
      }
    }
  }
}
```
