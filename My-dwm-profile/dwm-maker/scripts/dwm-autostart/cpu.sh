#!/bin/env bash

echo $(( 100 - `vmstat |grep -- 3 |awk '{print $15}'` ))
