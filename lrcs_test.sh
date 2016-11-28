#! /bin/bash

# Twitch chat characteristics:
# - trimmed (no white space(s) at beginning and end)
# - single spaces between words

teststring="simple repeat simple repeat simple repeat"
echo $teststring
echo $teststring | clisp libhrc.lisp

teststring="extra words at the start simple repeat simple repeat simple repeat"
echo $teststring
echo $teststring | clisp libhrc.lisp

teststring="simple repeat simple repeat simple repeat extra words at the end"
echo $teststring
echo $teststring | clisp libhrc.lisp

teststring="wrapped at start simple repeat simple repeat simple repeat and at the end"
echo $teststring
echo $teststring | clisp libhrc.lisp

teststring="simple repeat simple repeat simple repeat."
echo $teststring
echo $teststring | clisp libhrc.lisp

teststring="Capitalization not handled capitalization Not Handled!"
echo $teststring
echo $teststring | clisp libhrc.lisp

teststring="you youngings"
echo $teststring
echo $teststring | clisp libhrc.lisp

teststring="this is the best"
echo $teststring
echo $teststring | clisp libhrc.lisp

teststring="kung fu fun"
echo $teststring
echo $teststring | clisp libhrc.lisp

teststring="check it out, no tags: repeated message but no tags repeated message but no tags"
echo $teststring
echo $teststring | clisp libhrc.lisp

teststring="free coins free coins free coins free coins free coins"
echo $teststring
echo $teststring | clisp libhrc.lisp

teststring="Si se puede Si se puede Si se puede"
echo $teststring
echo $teststring | clisp libhrc.lisp

teststring="Duck Duck Goose Duck"
echo $teststring
echo $teststring | clisp libhrc.lisp
