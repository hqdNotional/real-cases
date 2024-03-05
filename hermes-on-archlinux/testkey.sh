#!/bin/bash

export KEYNAME="key"

# Generate key and output as json
gaiad keys add testkey $KEYNAME --output json
