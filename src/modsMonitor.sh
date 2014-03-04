#! /usr/bin/env bash

###Monitor r1
wc -w ../results/modsr1.txt | mail -s 'hoth: mods monitor' mkl48@nau.edu
