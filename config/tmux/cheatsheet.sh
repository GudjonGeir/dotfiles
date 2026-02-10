#!/usr/bin/env bash
# Tmux cheat sheet — displayed via tmux display-popup

# Everforest colors
G='\033[38;2;167;192;128m'  # green  #a7c080
Y='\033[38;2;219;188;127m'  # yellow #dbbc7f
B='\033[38;2;127;187;179m'  # blue   #7fbbb3
P='\033[38;2;214;153;182m'  # purple #d699b6
D='\033[38;2;133;146;137m'  # dim    #859289
F='\033[38;2;211;198;170m'  # fg     #d3c6aa
BOLD='\033[1m'
R='\033[0m'

key() { printf "  ${G}%-24s${R} %s\n" "$1" "$2"; }
header() { printf "\n ${BOLD}${1}%-30s${R}\n" "$2"; }

echo ""
printf " ${BOLD}${F}Tmux Cheat Sheet${R}  ${D}(prefix = Ctrl+Space)${R}\n"

header "$Y" "SESSIONS"
key "tmux new -s name"       "New named session"
key "tmux attach -t name"    "Attach to session"
key "tmux ls"                "List sessions"
key "prefix  d"              "Detach"
key "prefix  s"              "List sessions"
key "prefix  \$"             "Rename session"
key "prefix  C-s"            "Save session (resurrect)"
key "prefix  C-r"            "Restore session (resurrect)"

header "$B" "WINDOWS"
key "prefix  c"              "Create window"
key "prefix  ,"              "Rename window"
key "prefix  n"              "Next window"
key "prefix  p"              "Previous window"
key "prefix  w"              "List windows"
key "prefix  &"              "Kill window"
key "prefix  0-9"            "Switch to window #"

header "$P" "PANES"
key "prefix  |"              "Split vertical"
key "prefix  -"              "Split horizontal"
key "prefix  z"              "Toggle zoom"
key "prefix  x"              "Kill pane"
key "prefix  {"              "Move pane left"
key "prefix  }"              "Move pane right"
key "prefix  Space"          "Cycle layouts"
key "C-h/j/k/l"             "Navigate panes (vim-tmux)"

header "$G" "COPY MODE"
key "prefix  ["              "Enter copy mode"
key "v"                      "Start selection"
key "y"                      "Copy selection"
key "prefix  ]"              "Paste buffer"

header "$D" "CONFIG"
key "prefix  r"              "Reload config"
key "prefix  I"              "Install plugins (TPM)"
key "prefix  ?"              "This cheat sheet"

echo ""
