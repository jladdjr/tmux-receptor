#!/usr/bin/bash

r=/home/jim/git/receptor/receptor
rc="/home/jim/.virtualenvs/receptor/bin/receptorctl"
sandbox=/home/jim/git/receptor/sandbox/starting_workcommand


# start nodes
tmux split-window -l 95% "$r -c ${sandbox}/hop.conf; bash -i"
tmux split-window -l 84% "$r -c ${sandbox}/executor.conf; bash -i"

# show status
tmux split-window -l 80% "watch -n 2 $rc --socket /tmp/receptor-hop.sock status; bash -i"

# submit work once workcommand is advertised
tmux split-window -h "./wait_for_cmd.sh; ./prune_old_jobs.sh; $rc --socket /tmp/receptor-hop.sock work submit time --node executor --no-payload; bash -i"
tmux split-window -l 75% "watch -n 2 $rc --socket /tmp/receptor-hop.sock work list; bash -i"
tmux split-window -l 50% "watch -n 2 $rc --socket /tmp/receptor-executor.sock work list; bash -i"
