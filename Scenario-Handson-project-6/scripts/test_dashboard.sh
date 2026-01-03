#!/bin/bash

echo "Generating CPU load..."

for i in {1..4}
do
  yes > /dev/null &
done

sleep 60

echo "Stopping CPU load..."
pkill yes

echo "Dashboard test completed."
