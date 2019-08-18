RAW_DIR="${DATASET_ROOT}/raw"
IMAGE_URL_DIR="${RAW_DIR}/image_url"
if [ -e ${IMAGE_URL_DIR}/error_urls.tsv ]; then
    cat ${IMAGE_URL_DIR}/error_urls.tsv | sort | uniq > ${IMAGE_URL_DIR}/error_urls_pre.tsv;
    /bin/rm ${IMAGE_URL_DIR}/error_urls.tsv;
    aiodl  ${IMAGE_URL_DIR}/error_urls_pre.tsv \
        -r 50 -t 300 -c -f -d "\t" \
        -o ${RAW_DIR}/images \
        -e ${IMAGE_URL_DIR}/error_urls.tsv;
fi;