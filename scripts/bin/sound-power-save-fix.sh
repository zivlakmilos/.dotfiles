#!/usr/bin/env bash

echo 0 | sudo tee /sys/module/snd_hda_intel/parameters/power_save
