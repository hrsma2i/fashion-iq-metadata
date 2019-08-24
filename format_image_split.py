import os
from pathlib import Path

import pandas as pd


DATASET_ROOT = os.environ["DATASET_ROOT"]


def format_json(category, mode):
    tiny_dir = Path(DATASET_ROOT) / "tiny"

    tiny_split_dir = tiny_dir / "image_splits"
    json_file = tiny_split_dir / "split.{}.{}.json".format(category, mode)
    df = pd.read_json(json_file)
    df[0].to_json(json_file, "records")


def main():
    categories = ["dress", "shirt", "toptee"]
    modes = ["train", "val", "test"]
    for category in categories:
        for mode in modes:
            format_json(category, mode)


if __name__ == "__main__":
    main()
