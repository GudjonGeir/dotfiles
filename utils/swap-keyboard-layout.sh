#!/bin/bash
(setxkbmap -query | grep -q "layout:\s\+us") && setxkbmap is || setxkbmap us
