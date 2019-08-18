# FasionIQ challenge dataset

## Setup

```sh
./dl_img.sh
```

Excute the following script while there are images failed to download.

```sh
./retry_dl_img.sh
```

If images have been downloaded, execute the following commands.

```sh
./compensate_for_broken_links.sh
git clone https://github.com/XiaoxiaoGuo/fashion-iq.git raw/fashion-iq
rm -rf raw/fashion-iq/.git
python raw/fashion-iq/start_kit/resize_images.py \
    --image_dir raw/images \
    --output_dir raw/resized_images
```

```sh
./make_main.sh
```
