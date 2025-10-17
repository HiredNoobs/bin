# -----------------------------------------------------
# BASHRC LOADER
# -----------------------------------------------------

for f in ~/.config/bashrc/*; do 
  if [ -f $f ]; then
    source $f
  fi
done
