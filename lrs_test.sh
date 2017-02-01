#! /bin/bash

# Twitch chat characteristics:
# - trimmed (no white space(s) at beginning and end)
# - single spaces between words

teststring="simple repeat simple repeat simple repeat"
echo $teststring
echo $teststring | ./lrs

teststring="extra words at the start simple repeat simple repeat simple repeat"
echo $teststring
echo $teststring | ./lrs

teststring="simple repeat simple repeat simple repeat extra words at the end"
echo $teststring
echo $teststring | ./lrs

teststring="wrapped at start simple repeat simple repeat simple repeat and at the end"
echo $teststring
echo $teststring | ./lrs

teststring="simple repeat simple repeat simple repeat. <-- Look how the period affects this."
echo $teststring
echo $teststring | ./lrs

teststring="Capitalization not handled capitalization Not Handled!"
echo $teststring
echo $teststring | ./lrs

teststring="you youngings"
echo $teststring
echo $teststring | ./lrs

teststring="this is the best"
echo $teststring
echo $teststring | ./lrs

teststring="kung fu fun"
echo $teststring
echo $teststring | ./lrs

teststring="check it out, no tags: repeated message but no tags repeated message but no tags"
echo $teststring
echo $teststring | ./lrs

teststring="free coins free coins free coins free coins free coins"
echo $teststring
echo $teststring | ./lrs

teststring="Si se puede Si se puede Si se puede"
echo $teststring
echo $teststring | ./lrs

teststring="Duck Duck Goose Duck"
echo $teststring
echo $teststring | ./lrs
