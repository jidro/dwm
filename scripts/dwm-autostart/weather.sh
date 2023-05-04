#!/bin/env bash
curl -Ss 'https://wttr.in?0&T&Q' | cut -c 16- | head -2 | xargs echo
#curl -Ss 'https://wttr.in/?format=1'
