#!/bin/bash
E_WRONG_ARGS=65
Number_of_expected_args=4
script_params="-a -h -m -z"

if [ $# -ne $Number_of_expected_args ]
then
    echo "Usage: `basename $0` $script_params"
    exit $E_WRONG_ARGS
fi
