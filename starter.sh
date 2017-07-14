#!/bin/bash
#
  if  [[ $MODULE = "$null" ]]; then
    code source
    cd source
    /bin/bash
  else
    cd source
    $MODULE
  fi
##
