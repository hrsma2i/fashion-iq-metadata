mkdir -p tiny/labels
for category in dress shirt toptee
do
    for mode in train val test
    do
        smplj main/labels/cap.${category}.${mode}.json \
            -n 10 \
            -s 12345 \
            -o tiny/labels/cap.${category}.${mode}.json
    done
done

python copy_images_to_tiny.py