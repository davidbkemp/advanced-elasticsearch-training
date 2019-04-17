# Field Collapsing Exercise

Create and populate an "agent" index whose purpose is to
track the year-to-date number of sales per agent
(with one document per agent).
Note how the agency name and is duplicated for each agent in an agency.

Once you have done this, see the exercises at the end.

```
DELETE /agent

PUT /agent
{
  "mappings": {
    "properties": {
      "agentId": {"type": "keyword"},
      "agentName": {"type": "text"},
      "agencyId": {"type": "keyword"},
      "agencyName": {"type": "text"},
      "sales": {"type": "integer"}
    }
  }
}

PUT /agent/_doc/agent-1
{
  "agentId": "agent-1",
  "agentName": "Mary Smith",
  "agencyId": "agency-1",
  "agencyName": "Nelson Alexander",
  "sales": 18
}

PUT /agent/_doc/agent-2
{
  "agentId": "agent-2",
  "agentName": "Joe Blogs",
  "agencyId": "agency-1",
  "agencyName": "Nelson Alexander",
  "sales": 7
}

PUT /agent/_doc/agent-3
{
  "agentId": "agent-3",
  "agentName": "Mary Blogs",
  "agencyId": "agency-2",
  "agencyName": "MacGrath",
  "sales": 20
}

PUT /agent/_doc/agent-4
{
  "agentId": "agent-4",
  "agentName": "Joe Smith",
  "agencyId": "agency-2",
  "agencyName": "MacGrath",
  "sales": 13
}

```

Write a query to find those agents that have had
more than 5 sales ordered by the number of sales descending.

Use field collapsing to ensure that only one agent is returned per agency.
Note: you should not need to change the index mapping. 
