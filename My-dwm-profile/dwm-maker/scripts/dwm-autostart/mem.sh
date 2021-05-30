#!/bin/sh
free -h |grep -- 1 |awk '{print $7}'
