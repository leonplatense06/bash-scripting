#!/bin/bash

convert () {
    for arc in ./*; do
        echo "$arc" | tr -d "aA"  | tr "b-zB-Z" "B-Zb-z"
    done
}

convert