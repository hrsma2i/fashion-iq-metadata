RAW_DIR="${DATASET_ROOT}/raw"
MAIN_DIR="${DATASET_ROOT}/main"

mkdir ${DATASET_ROOT}/main;
ln -sfn ${RAW_DIR}/*_images ${MAIN_DIR}