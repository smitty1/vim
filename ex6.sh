#!/bin/bash

for input in $@
do
echo "${input} is $(file $input)"
ls -l $input
done

