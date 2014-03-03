#! /usr/bin/env bash

###Monitor r1
wc -w ../results/csr1.txt | mail -s 'hoth: stats monitor' mkl48@nau.edu
