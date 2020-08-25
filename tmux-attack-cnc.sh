#!/bin/sh


# set up tmux
tmux start-server

session="CNC"

# Create a session and a scratch page
tmux new-session -d -s $session -n monitor # main window
tmux new-window -t $session:2 -n working   # scratch page

#tmux select-window -t $session:2
#tmux send-keys "cat deploy.txt" C-m

tmux select-window -t $session:0

# chop up windows
#{{{
# |---------------------|
# |     0    |     1    |
# |---------------------|
# |     2    |     3    |
# |---------------------|
# |     4    |     5    |
# |---------------------|
# |     6    |     7    |
# |---------------------|


tmux selectp -t 0
tmux splitw -v -p 50
tmux splitw -v -p 50
tmux splitw -h -p 50

tmux selectp -t 0
tmux splitw -v -p 50
tmux splitw -h -p 50

tmux selectp -t 0
tmux splitw -h -p 50

tmux selectp -t 4
tmux splitw -h -p 50
#}}}

# Set colors #
#{{{
tmux selectp -t 0 -P 'fg=white,bg=black'
tmux selectp -t 1 -P 'fg=white,bg=black'
#tmux selectp -t 1 -P 'fg=brightwhite,bg=black'

tmux selectp -t 2 -P 'fg=green,bg=black'
tmux selectp -t 3 -P 'fg=green,bg=black'

tmux selectp -t 4 -P 'fg=magenta,bg=black'
tmux selectp -t 5 -P 'fg=magenta,bg=black'

tmux selectp -t 6 -P 'fg=cyan,bg=black'
tmux selectp -t 7 -P 'fg=cyan,bg=black'

#}}}              



# select and identify windows
#{{{
tmux selectp -t 0
tmux send-keys 'targetIP=$(cat target.txt | grep \.)' C-m
tmux send-keys 'username=root && window=0' C-m
tmux send-keys 'randamt00=$(shuf -i 41-59 -n 1) && randmultconn00=$(shuf -i 19-44 -n 1) && randmultwait00=$(shuf -i 29-56 -n 1)' C-m
tmux send-keys 'randconn00=$(echo "$randamt00 * $randmultconn00" | bc) && randwait00=$(echo "$randamt00 * $randmultwait00" | bc)' C-m
tmux send-keys 'while true; do echo "$username CONN: $randconn00 WAIT: $randwait00";      ssh $username@$targetIP      "sleep $randconn00"; sleep "$randwait00"; done' C-m

tmux selectp -t 1
tmux send-keys 'targetIP=$(cat target.txt | grep \.)' C-m
tmux send-keys 'username=dmurphy && window=1' C-m
tmux send-keys 'randamt01=$(shuf -i 41-59 -n 1) && randmultconn01=$(shuf -i 19-44 -n 1) && randmultwait01=$(shuf -i 29-56 -n 1)' C-m
tmux send-keys 'randconn01=$(echo "$randamt01 * $randmultconn01" | bc) && randwait01=$(echo "$randamt01 * $randmultwait01" | bc)' C-m
tmux send-keys 'while true; do echo "$username CONN: $randconn01 WAIT: $randwait01";      ssh $username@$targetIP      "sleep $randconn01"; sleep "$randwait01"; done' C-m

tmux selectp -t 2
tmux send-keys 'targetIP=$(cat target.txt | grep \.)' C-m
tmux send-keys 'username=klibby && window=2' C-m
tmux send-keys 'randamt02=$(shuf -i 41-59 -n 1) && randmultconn02=$(shuf -i 19-44 -n 1) && randmultwait02=$(shuf -i 29-56 -n 1)' C-m
tmux send-keys 'randconn02=$(echo "$randamt02 * $randmultconn02" | bc) && randwait02=$(echo "$randamt02 * $randmultwait02" | bc)' C-m
tmux send-keys 'while true; do echo "$username CONN: $randconn02 WAIT: $randwait02";      ssh $username@$targetIP      "sleep $randconn02"; sleep "$randwait02"; done' C-m

tmux selectp -t 3
tmux send-keys 'targetIP=$(cat target.txt | grep \.)' C-m
tmux send-keys 'username=egoldstein && window=3' C-m
tmux send-keys 'randamt03=$(shuf -i 41-59 -n 1) && randmultconn03=$(shuf -i 19-44 -n 1) && randmultwait03=$(shuf -i 29-56 -n 1)' C-m
tmux send-keys 'randconn03=$(echo "$randamt03 * $randmultconn03" | bc) && randwait03=$(echo "$randamt03 * $randmultwait03" | bc)' C-m
tmux send-keys 'while true; do echo "$username CONN: $randconn03 WAIT: $randwait03";      ssh $username@$targetIP      "sleep $randconn03"; sleep "$randwait03"; done' C-m

tmux selectp -t 4
tmux send-keys 'targetIP=$(cat target.txt | grep \.)' C-m
tmux send-keys 'username=pcook && window=4' C-m
tmux send-keys 'randamt04=$(shuf -i 41-59 -n 1) && randmultconn04=$(shuf -i 19-44 -n 1) && randmultwait04=$(shuf -i 29-56 -n 1)' C-m
tmux send-keys 'randconn04=$(echo "$randamt04 * $randmultconn04" | bc) && randwait04=$(echo "$randamt04 * $randmultwait04" | bc)' C-m
tmux send-keys 'while true; do echo "$username CONN: $randconn04 WAIT: $randwait04";      ssh $username@$targetIP      "sleep $randconn04"; sleep "$randwait04"; done' C-m

tmux selectp -t 5
tmux send-keys 'targetIP=$(cat target.txt | grep \.)' C-m
tmux send-keys 'username=rsanchez && window=5' C-m
tmux send-keys 'randamt05=$(shuf -i 41-59 -n 1) && randmultconn05=$(shuf -i 19-44 -n 1) && randmultwait05=$(shuf -i 29-56 -n 1)' C-m
tmux send-keys 'randconn05=$(echo "$randamt05 * $randmultconn05" | bc) && randwait05=$(echo "$randamt05 * $randmultwait05" | bc)' C-m
tmux send-keys 'while true; do echo "$username CONN: $randconn05 WAIT: $randwait05";      ssh $username@$targetIP      "sleep $randconn05"; sleep "$randwait05"; done' C-m

tmux selectp -t 6
tmux send-keys 'targetIP=$(cat target.txt | grep \.)' C-m
tmux send-keys 'username=jpardella && window=6' C-m
tmux send-keys 'randamt06=$(shuf -i 41-59 -n 1) && randmultconn06=$(shuf -i 19-44 -n 1) && randmultwait06=$(shuf -i 29-56 -n 1)' C-m
tmux send-keys 'randconn06=$(echo "$randamt06 * $randmultconn06" | bc) && randwait06=$(echo "$randamt06 * $randmultwait06" | bc)' C-m
tmux send-keys 'while true; do echo "$username CONN: $randconn06 WAIT: $randwait06";      ssh $username@$targetIP      "sleep $randconn06"; sleep "$randwait06"; done' C-m

tmux selectp -t 7
tmux send-keys 'targetIP=$(cat target.txt | grep \.)' C-m
tmux send-keys 'username=ebelford && window=7' C-m
tmux send-keys 'randamt07=$(shuf -i 41-59 -n 1) && randmultconn07=$(shuf -i 19-44 -n 1) && randmultwait07=$(shuf -i 29-56 -n 1)' C-m
tmux send-keys 'randconn07=$(echo "$randamt07 * $randmultconn07" | bc) && randwait07=$(echo "$randamt07 * $randmultwait07" | bc)' C-m
tmux send-keys 'while true; do echo "$username CONN: $randconn07 WAIT: $randwait07";      ssh $username@$targetIP      "sleep $randconn07"; sleep "$randwait07"; done' C-m



#}}}

#
## Finished setup, attach to the tmux session!
##{{{
tmux attach-session -t $session
#}}}

