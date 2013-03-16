#!/bin/bash
trap 'echo exiting...; exit 1' INT
cd `dirname $0`
mkdir -p scrapped_data
rm -rf scrapped_data/*
# get a list of all the api elements
w3m -dump http://www.etsy.com/developers/documentation/reference/user \
| sed -e '1,/RSS Feeds/d' -e '/Get Full Access/,$d'                   \
| grep --only-matching '[A-Za-z_][A-Za-z_]*'                          \
| tr 'A-Z' 'a-z'                                                      \
> scrapped_data/api-elements

wc -l scrapped_data/api-elements

# Get the doc for each of the object types
for type in $( cat scrapped_data/api-elements ) ; do
    w3m -cols 10000                                                        \
        -dump http://www.etsy.com/developers/documentation/reference/$type \
        | sed -e '1,/PuSH Subscriber Example/d' -e '/Developers Home/,$d'  \
        > scrapped_data/$type.txt
    wc -l scrapped_data/$type.txt
    S=$((RANDOM%20+5))
    echo -n sleep $S
    sleep $S
    echo .
done
