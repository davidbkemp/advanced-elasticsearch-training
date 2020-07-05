# Elasticsearch Hands On Part 2 Exercises

By default, the function_score query multiplies together the scores from the applicable functions.

You can over-ride that behaviour by specifying a score_mode of "sum":

eg.

```
GET /listings/_search
{
  "query": {
    "function_score": {
      "query": {
        "match_all": {}
      },
      "score_mode": "sum",
      "functions": [
        {...
```


With that in mind:

Write a function_score query that gives a score of

- 30.0 to 31.0 to premier
- 20.0 to 21.0 to highlight
- 10.0 to 11.0 to standard

Where x is reflects how close the property price is to 800. For example,

- A premier property with a price of 800 should get a score of 31.0
- A highlight property with a price of 460 should get a score something like 20.83
(i.e. between 20 and 21)



