cat asin2url.dress.txt |  awk '{ print $2 "\t" $1 ".jpg" }' > dress_urls.tsv;
cat asin2url.shirt.txt |  awk '{ print $2 "\t" $1 ".jpg" }' > shirt_urls.tsv;
cat asin2url.toptee.txt | awk '{ print $2 "\t" $1 ".jpg" }' > toptee_urls.tsv;

aiodl dress_urls.tsv  -r 50 -t 300 -c -f -d "\t" -o dress_images  -e dress_error_urls.tsv
aiodl shirt_urls.tsv  -r 50 -t 300 -c -f -d "\t" -o shirt_images  -e shirt_error_urls.tsv
aiodl toptee_urls.tsv -r 50 -t 300 -c -f -d "\t" -o toptee_images -e toptee_error_urls.tsv