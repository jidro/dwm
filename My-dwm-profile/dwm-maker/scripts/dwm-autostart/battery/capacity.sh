#!/bin/env bash
upower -i $(upower -e |grep BAT) |grep --color=never -E 'state |to\ full |to\ empty |percentage' |awk '{print $2}'
