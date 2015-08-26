#!/bin/bash

#delay bar
Progress() {
  _bar=$1; _bar=${_bar:=.}
  while :
  do
    jobs %1 > /dev/null 2>&1
    [ $? = 0 ] || break
    printf ${_bar}
    sleep 0.1
  done;
}
usage() {
  printf "usage:$0 [command]"; exit;
}
# [ $# = 0 ] && usage
"$@" &
Progress