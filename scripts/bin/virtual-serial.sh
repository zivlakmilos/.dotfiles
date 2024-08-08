#!/usr/bin/env bash

socat -d -d pty,raw,echo=0,link=/tmp/ttySV1 pty,raw,echo=0,link=/tmp/ttySV2
