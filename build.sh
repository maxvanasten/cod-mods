#!/usr/bin/env bash
rm -rf ./dist/t5/*
zip -r ./dist/t5/zm_randomizer.zip ./src/t5/zm_randomizer/

rm -rf ./dist/t6/*
zip -r ./dist/t6/zm_randomizer.zip ./src/t6/zm_randomizer/
zip -r ./dist/t6/zm_gobblegums.zip ./src/t6/zm_gobblegums/
zip -r ./dist/t6/zm_quests_demo.zip ./src/t6/zm_quests_demo/
zip -r ./dist/t6/zm_tomb_challenge.zip ./src/t6/zm_tomb_challenge/
zip -r ./dist/t6/zm_speedrun_timer.zip ./src/t6/zm_speedrun_timer/
