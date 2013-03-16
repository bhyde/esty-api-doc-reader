These two files:
+ api-decl.lisp
+ api-decl.json
Contain a description of the Esty API.

The code here can snarf etsy api reference materials and then parse it into something
suitable for other purposes.

That was done in two steps.  In the first step the bash script ./step1.sh scraps
the Esty developer doc and puts the results in the scraped_data directory.  This
step requires that you have w3m installed.  An example of the pages it scrapes:
http://www.etsy.com/developers/documentation/reference/feedbackinfo

Then the code in parse-scraps.lisp is used to make the api-decl files.

If they don't change the APi there is no need to run the code.

If you have freshen scrapped_data then you need to load the eadr system
step into the eadr package and run:
```common-lisp
(progn (load-all-api-elements) (dump-api-decl))
```
