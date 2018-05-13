#!/bin/bash
g=..
IFS=$'\n'

e=($(find $1 -name *.js -printf '%f' | grep -E 'indicators' ))
for i in "${e[@]}"
do
echo "Remove indicator: $i"
rm $g/strategies/indicators/$i
done

e=($(find $1 -name *.js -printf '%f' | grep -E -v '!|indicators'))
for i in "${e[@]}"
do
echo "Remove strategy: $i"
rm $g/strategies/$i
done

e=($(find $1 -name *.toml -printf '%f' | grep -E -v '!'))
for i in "${e[@]}"
do
echo "Remove strategy config: $i"
rm $g/config/strategies/$i
done

unset IFS
sed -i "s/$1//" ../backtest-config.pl
echo "backtest-config updated"
