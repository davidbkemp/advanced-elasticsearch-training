# Elasticsearch Hands On Part 2 Exercises

Modify the childcare-centres example to use geo-shapes instead of geo-points.

You will need to:

In ../childcare-centres/mapping-template.json
 - Replace "geo_point" with "geo_shape"

In ../childcare-centres/logstash/logstash.config
 - Replace the "mutate" section with the following two mutate sections:

```
      mutate {
        add_field => { "[geocode][type]" => "point" }
        add_field => { "[geocode][coordinates]" => ["%{[lon]}", "%{[lat]}"] }
      }
    
      # This converts all the array elements from strings to floats.
      mutate {
        convert => { "[geocode][coordinates]" => "float" }
      }
```

See https://www.elastic.co/guide/en/logstash/current/plugins-filters-mutate.html#plugins-filters-mutate-add_field
It should generate something a little like this.
Note how the longitude comes before the latitide. This is standard Geo Json.

```
"geocode": {
       "type" : "point",
        "coordinates" : ["144.995", "-37.829"]
    }
```


Re-run the ../childcare-centres/feed-index.sh script.

Use a geo-shape query to find child care centres within 1km of the Melbourne GPO
  - Lat: -37.8138932
  - Lon: 144.9611874
