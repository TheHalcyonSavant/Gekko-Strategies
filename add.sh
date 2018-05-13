#!/bin/bash
g=..
IFS=$'\n'

e=($(find $1 -name *.js | grep -E 'indicators' ))
for i in "${e[@]}"
do
echo "Copy indicator: $i"
cp $i $g/strategies/indicators/
done

e=($(find $1 -name *.js | grep -E -v '!|indicators'))
for i in "${e[@]}"
do
echo "Copy strategy: $i"
cp $i $g/strategies
done

e=($(find $1 -name *.toml | grep -E -v '!'))
for i in "${e[@]}"
do
echo "Copy strategy config: $i"
cp $i $g/config/strategies/
done

unset IFS
sed -i "s/strategies = qw(.*);/strategies = qw($1);/" ../backtest-config.pl
echo "backtest-config updated"
