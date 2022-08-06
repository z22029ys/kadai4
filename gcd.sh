#!/bin/bash

if [ $# -ne 2 ]; then
  echo "input 2 arguments" 1>&2
  exit 1
fi

expr $1 + $2 > /dev/null 2>&1
if [ $? -ge 2 ]; then
  echo "input natural number" 1>&2
  exit 1
fi

if [ "$1" -lt 1 ] || [ "$2" -lt 1 ]; then
  echo "input natural number" 1>&2
  exit 1
fi

GCD () {
  a=$1
  b=$2

  if [ "$b" = 0 ]; then
    echo "$a"
  else
    c=$((a % b))

    GCD "$b" "$c"
  fi
}

GCD $1 $2
