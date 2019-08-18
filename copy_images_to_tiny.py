import os
import shutil
from pathlib import Path

import pandas as pd
from tqdm import tqdm


DATASET_ROOT = os.environ['DATASET_ROOT']


def copy_images(category, mode):
    main_dir = Path(DATASET_ROOT)/'main'
    tiny_dir = Path(DATASET_ROOT)/'tiny'
    main_img_dir = main_dir/'resized_images'
    tiny_img_dir = tiny_dir/'resized_images'
    tiny_cap_dir = tiny_dir/'captions'
    json_file = tiny_cap_dir/'cap.{}.{}.json'.format(category, mode)
    df = pd.read_json(json_file)
    img_names = df['candidate']
    if 'target' in df.columns:
        img_names = pd.concat((img_names, df['target']))

    tiny_img_dir.mkdir(exist_ok=True)
    for img_name in tqdm(img_names, desc=json_file.name):
        shutil.copy(main_img_dir/'{}.jpg'.format(img_name), tiny_img_dir)


def main():
    categories = ['dress', 'shirt', 'toptee']
    modes = ['train', 'val', 'test']
    for category in categories:
        for mode in modes:
            copy_images(category, mode)


if __name__ == '__main__':
    main()
