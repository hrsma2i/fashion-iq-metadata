if [ -e dress_error_urls.tsv ]; then
    cat dress_error_urls.tsv | sort | uniq > dress_error_urls_pre.tsv;
    /bin/rm dress_error_urls.tsv;
    aiodl  dress_error_urls_pre.tsv -r 50 -t 300 -c -f -d "\t" -o dress_images  -e  dress_error_urls.tsv;
fi;

if [ -e shirt_error_urls.tsv ]; then
    cat shirt_error_urls.tsv | sort | uniq > shirt_error_urls_pre.tsv;
    /bin/rm shirt_error_urls.tsv;
    aiodl  shirt_error_urls_pre.tsv -r 50 -t 300 -c -f -d "\t" -o shirt_images  -e  shirt_error_urls.tsv;
fi;

if [ -e toptee_error_urls.tsv ]; then
    cat toptee_error_urls.tsv | sort | uniq > toptee_error_urls_pre.tsv;
    /bin/rm toptee_error_urls.tsv;
    aiodl toptee_error_urls_pre.tsv -r 50 -t 300 -c -f -d "\t" -o toptee_images -e toptee_error_urls.tsv;
fi;