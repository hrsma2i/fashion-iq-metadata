import os
import shutil
from pathlib import Path

import pandas as pd
from tqdm import tqdm


DATASET_ROOT = os.environ["DATASET_ROOT"]


def copy_images(category, mode):
    main_dir = Path(DATASET_ROOT) / "main"
    tiny_dir = Path(DATASET_ROOT) / "tiny"

    main_img_dir = main_dir / "resized_images"
    tiny_img_dir = tiny_dir / "resized_images"

    tiny_cap_dir = tiny_dir / "captions"
    json_file_cap = tiny_cap_dir / "cap.{}.{}.json".format(category, mode)
    df_cap = pd.read_json(json_file_cap)

    img_names = df_cap["candidate"]
    if "target" in df_cap.columns:
        img_names = pd.concat((img_names, df_cap["target"]))

    tiny_split_dir = tiny_dir / "image_splits"
    json_file_split = tiny_split_dir / "split.{}.{}.json".format(
        category, mode
    )
    df_split = pd.read_json(json_file_split)
    img_names = pd.concat((img_names, df_split[0]))

    img_names = img_names.unique()

    tiny_img_dir.mkdir(exist_ok=True)
    for img_name in tqdm(img_names, desc="{}.{}".format(category, mode)):
        shutil.copy(main_img_dir / "{}.jpg".format(img_name), tiny_img_dir)


def main():
    categories = ["dress", "shirt", "toptee"]
    modes = ["train", "val", "test"]
    for category in categories:
        for mode in modes:
            copy_images(category, mode)


if __name__ == "__main__":
    main()
