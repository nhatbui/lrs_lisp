#! /bin/bash

# Twitch chat characteristics:
# - trimmed (no white space(s) at beginning and end)
# - single spaces between words

teststring="simple repeat simple repeat simple repeat"
echo $teststring
echo $teststring | ./lrs.lisp

teststring="extra words at the start simple repeat simple repeat simple repeat"
echo $teststring
echo $teststring | ./lrs.lisp

teststring="simple repeat simple repeat simple repeat extra words at the end"
echo $teststring
echo $teststring | ./lrs.lisp

teststring="wrapped at start simple repeat simple repeat simple repeat and at the end"
echo $teststring
echo $teststring | ./lrs.lisp

teststring="simple repeat simple repeat simple repeat. <-- Look how the period affects this."
echo $teststring
echo $teststring | ./lrs.lisp

teststring="Capitalization not handled capitalization Not Handled!"
echo $teststring
echo $teststring | ./lrs.lisp

teststring="you youngings"
echo $teststring
echo $teststring | ./lrs.lisp

teststring="this is the best"
echo $teststring
echo $teststring | ./lrs.lisp

teststring="kung fu fun"
echo $teststring
echo $teststring | ./lrs.lisp

teststring="check it out, no tags: repeated message but no tags repeated message but no tags"
echo $teststring
echo $teststring | ./lrs.lisp

teststring="free coins free coins free coins free coins free coins"
echo $teststring
echo $teststring | ./lrs.lisp

teststring="Si se puede Si se puede Si se puede"
echo $teststring
echo $teststring | ./lrs.lisp

teststring="Duck Duck Goose Duck"
echo $teststring
echo $teststring | ./lrs.lisp
