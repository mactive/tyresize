#!/usr/bin/env sh
awk 'match($0, /T\(@".*"\)/) {a = substr($0, RSTART + 3, RLENGTH - 4); print "\n/* " FILENAME " " FNR " */\n" a " = " a ";"}' UIView/*.m ViewController/*.m 
