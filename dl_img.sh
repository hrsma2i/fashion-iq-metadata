RAW_DIR="${DATASET_ROOT}/raw"
IMAGE_URL_DIR="${RAW_DIR}/image_url"
cat ${IMAGE_URL_DIR}/asin2url.dress.txt |  awk '{ print $2 "\t" $1 ".jpg" }' > ${IMAGE_URL_DIR}/dress_urls.tsv;
cat ${IMAGE_URL_DIR}/asin2url.shirt.txt |  awk '{ print $2 "\t" $1 ".jpg" }' > ${IMAGE_URL_DIR}/shirt_urls.tsv;
cat ${IMAGE_URL_DIR}/asin2url.toptee.txt | awk '{ print $2 "\t" $1 ".jpg" }' > ${IMAGE_URL_DIR}/toptee_urls.tsv;

aiodl ${IMAGE_URL_DIR}/dress_urls.tsv  -r 50 -t 300 -c -f -d "\t" -o ${RAW_DIR}/dress_images  -e ${IMAGE_URL_DIR}/dress_error_urls.tsv
aiodl ${IMAGE_URL_DIR}/shirt_urls.tsv  -r 50 -t 300 -c -f -d "\t" -o ${RAW_DIR}/shirt_images  -e ${IMAGE_URL_DIR}/shirt_error_urls.tsv
aiodl ${IMAGE_URL_DIR}/toptee_urls.tsv -r 50 -t 300 -c -f -d "\t" -o ${RAW_DIR}/toptee_images -e ${IMAGE_URL_DIR}/toptee_error_urls.tsv