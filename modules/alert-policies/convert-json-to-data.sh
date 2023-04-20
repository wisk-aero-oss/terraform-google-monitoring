#!/usr/bin/env bash

# Convert json source data file to terraform data
#   This does 90% of work. Requires some manual editing afterwards

## WORKS - CamelCase to snake_case
#   FIX:
#     Do not do text in ""
#     only test in "":  - But needs multiple replaces inbetween the ""
#gsed 's/\(\([A-Za-z0-9]\)\([A-Z]\)\)/\2_\l\3/g' <<< 'testCamelCase: "ValLifeTest": qws'
#
## WORKS - Remove quotes aroung json keys
#gsed -E 's/"([^"]+)":/\1 =/g' <<< '"key": "value"'

## Complete
#gsed 's/\(\([A-Za-z0-9]\)\([A-Z]\)\)/\2_\l\3/g;s/,$//' <<< '"testCamelCase": "Val",' | gsed -E 's/"([^"]+)":/\1 =/g'
#

jq '.[] | del(.creationRecord) | del(.mutationRecord) | del(.name) | del(.conditions[].name)' "$1" | \
  jq -s . | \
  while IFS='' read -r LinefromFile || [[ -n "${LinefromFile}" ]]; do
    # "key": to key =
    line=$(echo "${LinefromFile}" | gsed -E 's/"([^"]+)":/\1 =/g')
    # remove trailing ,
    if [[ ! "${line}" =~ ^[[:space:]]*},[[:space:]]*$ ]]; then
      line=$(echo "${line}" | gsed 's/,$//')
    fi
    prefix=${line%%=*}
    # key - CamelCase to snake_case
    if [ "${prefix}" != "${line}" ]; then
      prefix=$(echo "${prefix}" | gsed 's/\(\([A-Za-z0-9]\)\([A-Z]\)\)/\2_\l\3/g')
    fi
    suffix=${line#*=}
    [ "${suffix}" == "${line}" ] && suffix=''
    if [ "${prefix}" == "${line}" ]; then
      sep=''
    else
      sep='='
    fi
    echo "${prefix}${sep}${suffix}"
  done  > "$2"
