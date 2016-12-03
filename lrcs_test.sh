#! /bin/bash

# Twitch chat characteristics:
# - trimmed (no white space(s) at beginning and end)
# - single spaces between words

teststring="simple repeat simple repeat simple repeat"
echo $teststring
echo $teststring | ./lrcs.lisp

teststring="extra words at the start simple repeat simple repeat simple repeat"
echo $teststring
echo $teststring | ./lrcs.lisp

teststring="simple repeat simple repeat simple repeat extra words at the end"
echo $teststring
echo $teststring | ./lrcs.lisp

teststring="wrapped at start simple repeat simple repeat simple repeat and at the end"
echo $teststring
echo $teststring | ./lrcs.lisp

teststring="simple repeat simple repeat simple repeat. <-- Look how the period affects this."
echo $teststring
echo $teststring | ./lrcs.lisp

teststring="Capitalization not handled capitalization Not Handled!"
echo $teststring
echo $teststring | ./lrcs.lisp

teststring="you youngings"
echo $teststring
echo $teststring | ./lrcs.lisp

teststring="this is the best"
echo $teststring
echo $teststring | ./lrcs.lisp

teststring="kung fu fun"
echo $teststring
echo $teststring | ./lrcs.lisp

teststring="check it out, no tags: repeated message but no tags repeated message but no tags"
echo $teststring
echo $teststring | ./lrcs.lisp

teststring="free coins free coins free coins free coins free coins"
echo $teststring
echo $teststring | ./lrcs.lisp

teststring="Si se puede Si se puede Si se puede"
echo $teststring
echo $teststring | ./lrcs.lisp

teststring="Duck Duck Goose Duck"
echo $teststring
echo $teststring | ./lrcs.lisp
