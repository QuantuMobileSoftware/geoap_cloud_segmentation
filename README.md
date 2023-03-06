# geoap_cloud_segmentation

### Build image

`docker build .`

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
