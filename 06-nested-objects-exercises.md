# Elasticsearch Hands On Part 2 Exercises

Try the following:

```
DELETE /agencies

POST /agencies/_doc/1
{
  "name": "Nelson Alexander",
  "agents": [
     {"firstName": "Mary", "lastName": "Smith"},
     {"firstName": "Joe", "lastName": "Blogs"}
    ]
}


POST /agencies/_doc/2
{
  "name": "MacGrath",
  "agents": [
     {"firstName": "Mary", "lastName": "Blogs"},
     {"firstName": "Joe", "lastName": "Smith"}
    ]
}


GET /agencies/_search
{
  "query": {
    "bool": {
      "filter": [
        {
          "match": {
            "agents.firstName": "Mary"
          }
        },
        {
          "match": {
            "agents.lastName": "Blogs"
          }
        }
      ]
    }
  }
}
```

Are the results what you expected?

Delete the index and explicitly give it a mapping so that
you can use a "nested" query to find only those agencies
that have an agent called "Mary Blogs".

**NOTE: For names, you should use a "text" type so as to get case insensitive matching etc.**
