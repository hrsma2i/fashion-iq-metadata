mkdir -p tiny/captions;
for category in dress shirt toptee
do
    for mode in train val test
    do
        smplj main/captions/cap.${category}.${mode}.json \
            -n 10 \
            -s 12345 \
            -o tiny/captions/cap.${category}.${mode}.json;
        smplj main/image_splits/split.${category}.${mode}.json \
            -n 10 \
            -s 12345 \
            -o tiny/image_splits/split.${category}.${mode}.json;
    done
    cp main/captions/dict* tiny/captions;
done

python format_image_split.py;
python copy_images_to_tiny.py