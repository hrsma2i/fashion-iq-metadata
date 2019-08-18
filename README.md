# FasionIQ challenge dataset

## Setup

```sh
./dl_img.sh
```

Excute the following script while there are images failed to download.

```sh
./retry_dl_img.sh
./compensate_for_broken_links.sh
```

```sh
./make_main.sh
```

```sh
git clone https://github.com/XiaoxiaoGuo/fashion-iq.git raw/fashion-iq
rm -rf raw/fashion-iq/.git
mkdir labels
cd labels
```