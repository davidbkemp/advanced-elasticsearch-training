# Elasticsearch Hands On Part 2 Exercises

Re-create the "agencies" index from 02a-nested-objects-exercises.md
but using a parent/child relationship.

You will need a join field for the agency/agent relationship:

- agency: whose only field is a "agencyName" field of type text.
- agent: whose only fields are "firstName" and "lastName"

Inserting an agency should look like this:

```
PUT /agencies/_doc/1?routing=1
{
  "agencyName": "Nelson Alexander",
  "my_join_field": {
    "name": "agency"
  }
}
```

Inserting an agent with id of `a` that belongs to agency `1` should look like this:

```
PUT /agencies/_doc/a?routing=1
{
    "firstName": "Mary",
    "lastName": "Smith",
    "my_join_field": {
      "name": "agent",
      "parent": "1"
    }
}

PUT /agencies/_doc/b?routing=1
{
    "firstName": "Joe",
    "lastName": "Blogs",
    "my_join_field": {
      "name": "agent",
      "parent": "1"
    }
}
```

Also for MacGrath:

```
PUT /agencies/_doc/2?routing=2
{
  "agencyName": "MacGrath",
  "my_join_field": {
    "name": "agency"
  }
}

PUT /agencies/_doc/x?routing=2
{
    "firstName": "Mary",
    "lastName": "Blogs",
    "my_join_field": {
      "name": "agent",
      "parent": "2"
    }
}

PUT /agencies/_doc/y?routing=2
{
    "firstName": "Joe",
    "lastName": "Smith",
    "my_join_field": {
      "name": "agent",
      "parent": "2"
    }
}

....


```



Once again, find only those agencies that have an agent called "Mary Blogs".
