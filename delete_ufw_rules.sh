#!/bin/bash

# Usage: ./delete-ufw-range.sh <start> <end>
# Deletes UFW rules numbered from <start> to <end> (inclusive), in reverse order.

if [ $# -ne 2 ]; then
  echo "Usage: $0 <start_number> <end_number>"
  exit 1
fi

START=$1
END=$2

if [ "$START" -gt "$END" ]; then
  echo "Start number must be less than or equal to end number."
  exit 1
fi

for (( i=END; i>=START; i-- ))
do
  echo "Deleting UFW rule #$i"
  sudo ufw delete $i
done

