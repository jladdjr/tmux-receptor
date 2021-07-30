#!/usr/bin/bash

echo "Waiting for workcommand to be listed.."

sleep 10

until /home/jim/.virtualenvs/receptor/bin/receptorctl --socket /tmp/receptor-hop.sock status | grep time &> /dev/null
do
  sleep 2
done
