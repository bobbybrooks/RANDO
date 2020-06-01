#!/bin/sh


# set up tmux
tmux start-server

session="CNC"

# Create a session and a scratch page
tmux new-session -d -s $session -n monitor # main window
tmux new-window -t $session:2 -n working   # scratch page

tmux select-window -t $session:2
tmux send-keys "cat deploy.txt" C-m

tmux select-window -t $session:1

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
tmux splitw -h -p 20

tmux selectp -t 0
tmux splitw -v -p 50
tmux splitw -h -p 20

tmux selectp -t 0
tmux splitw -h -p 20

tmux selectp -t 4
tmux splitw -h -p 20
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
tmux send-keys "cd ~/Ares/server" C-m "./ares.py runserver -h 0.0.0.0 -p 8080 --threaded" C-m

tmux selectp -t 1
#tmux send-keys "echo 1" C-m
tmux send-keys "echo This is the web-server" C-m C-m

tmux selectp -t 2
#tmux send-keys "echo 2" C-m
tmux send-keys "cd ~/Ares/server" C-m "./ares.py runserver -h 0.0.0.0 -p 111 --threaded" C-m

tmux selectp -t 3
tmux send-keys "echo This is the first server - port: 111" C-m C-m

tmux selectp -t 4
#tmux send-keys "echo 4" C-m
tmux send-keys "cd ~/Ares/server" C-m "./ares.py runserver -h 0.0.0.0 -p 3306 --threaded" C-m

tmux selectp -t 5
tmux send-keys "echo This is the second server - port: 3306" C-m C-m

tmux selectp -t 6
#tmux send-keys "echo 6" C-m
tmux send-keys "cd ~/Ares/server" C-m "./ares.py runserver -h 0.0.0.0 -p 5900 --threaded" C-m

tmux selectp -t 7
tmux send-keys "echo This is the third server - port: 5900" C-m C-m
#}}}

#
## Finished setup, attach to the tmux session!
##{{{
tmux attach-session -t $session
#}}}

