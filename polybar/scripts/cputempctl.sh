#!/bin/bash
sensors | awk 'FNR == 3 {print $4}' |  sed 's/+//'
