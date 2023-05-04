#!/bin/env bash

#uptime | sed 's/.*,//'
uptime |awk '{print $3, $4}' |cut -c -6
