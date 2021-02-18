# Elasticsearch Hands On Part 2 Exercises

Try the following query (assuming you still have the data from ./childcare-centres)

**Note: don't expect to get any matches**

```
GET /childcare-centres/_search
{
  "query": {
    "match": {
      "name": {
        "query": "Powlet Reserve Center",
        "operator": "and"
      }
    }
  }
}
```

Add a "suggest" section to provide alternative spellings.


