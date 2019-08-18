RAW_DIR="${DATASET_ROOT}/raw"
IMAGE_URL_DIR="${RAW_DIR}/image_url"
cat ${IMAGE_URL_DIR}/asin2url.dress.txt \
    ${IMAGE_URL_DIR}/asin2url.shirt.txt \
    ${IMAGE_URL_DIR}/asin2url.toptee.txt \
| awk '{ print $2 "\t" $1 ".jpg" }' \
| sort | uniq \
> ${IMAGE_URL_DIR}/image_urls.tsv;

aiodl ${IMAGE_URL_DIR}/image_urls.tsv \
    -r 50 -t 300 -c -f -d "\t" \
    -o ${RAW_DIR}/images \
    -e ${IMAGE_URL_DIR}/error_urls.tsv