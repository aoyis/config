# Run fastfetch on launch 
fastfetch

# Custom defined commands
mkcd(){
  mkdir -p "$1" && CD "$1"
}

alias rs="rsync -a --info=progress2"

