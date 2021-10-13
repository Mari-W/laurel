#!/usr/bin/env bash

# usage: ./gen-salt <LENGTH>
# example: ./gen-salt 24 outputs 3rs$ThWmhpqjO(%7l_QAqbah

tr -dc 'A-Za-z0-9!$%&()[]_{}~' </dev/urandom | head -c "$1"; echo
