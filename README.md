# geoap_cloud_segmentation

[Cloud detection](https://docs.google.com/document/d/1H9HK7gEGofG2zWBwhA8bK8BS0jvsywYMCGHy68EChB8/edit#heading=h.i58akew2w841)

### Build image

`docker build -t quantumobile/cloud_det .`

### Pull image

`docker pull quantumobile/cloud_det`

### Push to registry

`docker push quantumobile/cloud_det`

### Docker run command

```
docker run \
    -e "AOI=POLYGON ((-85.299088 40.339368, -85.332047 40.241477, -85.134979 40.229427, -85.157639 40.34146, -85.299088 40.339368))" \
    -e "START_DATE=2020-07-01" \
    -e "END_DATE=2020-08-01" \
    -e "SENTINEL2_GOOGLE_API_KEY=/input/api-key-retriever.json" \
    -e "SATELLITE_CACHE_FOLDER=/input/SENTINEL2_CACHE" \
    -e "OUTPUT_FOLDER=/output" \
```

### How to add model to SIP

## How to add model to SIP
____

1. Open Admin page, `localhost:9000/admin/`
2. In AOI block select `Components` and click on `+Add`
    * Add <b>Component name</b>: `Add your name`
    * Add <b>Image</b>: `quantumobile/cloud_det`
    * Select <b>Sentinel Google API key is required</b>
    * Deselect <b>Whether GPU is needed for a component to run</b>
    * Select <b>Start and end dates are required</b>
3. <b>SAVE</b>
4. Update page with `SIP app` <i>(localhost:3000)</i>
5. Select `Area` or `Field` on the map and save it
6. Drop-down menu on your `Area` or `Field` -> `View reports`
7. `Create new`
8. In `Select layers` choose your component, add additional params like <i>Year</i>, <i>Date range</i> and so on
9. `Save changes`

