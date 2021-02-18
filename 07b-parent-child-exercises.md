# Elasticsearch Hands On Part 2 Exercises

Re-create the "agencies" index from 02a-nested-objects-exercises.md
but using a parent/child relationship.

You will need a join field for the agency/agent relationship:

- agency: whose only field is a "agencyName" field of type text.
- agent: whose only fields are "firstName" and "lastName"

Inserting an agency should look like this:

```
POST /agencies/_doc/1?routing=1
{
  "agencyName": "Nelson Alexander",
  "my_join_field": {
    "name": "agency"
  }
}
```

Inserting an agent with id of `a` that belongs to agency `1` should look like this:

```
POST /agencies/_doc/a?routing=1
{
    "firstName": "Mary",
    "lastName": "Smith",
    "my_join_field": {
      "name": "agent",
      "parent": "1"
    }
}
```


Once again, find only those agencies that have an agent called "Mary Blogs".
