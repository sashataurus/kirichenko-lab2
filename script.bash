#!/bin/bash

dec_to_bin() {
    echo "obase=2; $1" | bc | awk '{printf "%08d", $0}'
}

IFS='.' read -r -a octets <<< "$1"

binary_ip=$(printf "%s.%s.%s.%s\n" \
    "$(dec_to_bin "${octets[0]}")" \
    "$(dec_to_bin "${octets[1]}")" \
    "$(dec_to_bin "${octets[2]}")" \
    "$(dec_to_bin "${octets[3]}")")

echo "$binary_ip"
