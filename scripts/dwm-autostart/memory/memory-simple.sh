#!/bin/sh
free -th |awk '{print $4}' |sed -n 4p
