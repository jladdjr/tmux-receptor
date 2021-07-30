#!/usr/bin/bash

echo "Releasing hop work"
/home/jim/.virtualenvs/receptor/bin/receptorctl --socket /tmp/receptor-hop.sock work list | sed "s/'/\"/g" | sed "s/None\|False\|True/\"None\"/g" | jq -r "keys | to_entries[] | (.value)" | xargs /home/jim/.virtualenvs/receptor/bin/receptorctl --socket /tmp/receptor-hop.sock work release

echo "Releasing executor work"
/home/jim/.virtualenvs/receptor/bin/receptorctl --socket /tmp/receptor-executor.sock work list | sed "s/'/\"/g" | sed "s/None\|False\|True/\"None\"/g" | jq -r "keys | to_entries[] | (.value)" | xargs /home/jim/.virtualenvs/receptor/bin/receptorctl --socket /tmp/receptor-executor.sock work release
