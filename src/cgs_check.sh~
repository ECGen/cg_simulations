#! /usr/bin/env bash

cd ../data/null

r00count=$(ls -1 r00 | wc -l)
let r00pc=$r00count/160000*100

r0count=$(ls -1 r0 | wc -l)
let r0pc=$r0count*100/160000

c0count=$(ls -1 c0 | wc -l)
let c0pc=$c0count*100/160000

r1count=$(ls -1 r1 | wc -l)
let r1pc=$r1count*100/160000

echo ---Totals---
echo r00: $r00count
echo r0: $r0count
echo c0: $c0count
echo r1: $r1count
echo 
echo ---Percent---
echo r00: $r00pc
echo r0: $r0pc
echo c0: $c0pc
echo r1: $r1pc
