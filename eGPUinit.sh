#/bin/bash
echo "RUN AS ROOT PLEASE"
echo "Do you have bumblebee, primus, and the nvidia drivers installed? Y=1/N=0: "
read yn
if [ $yn -eq 1 ] ; then
  echo "Starting Bumblebee"
  bumblebeed -D start
  echo "What program would you like to run? "
  read program
  primusrun $program

elif [ $yn -eq 0 ] ; then
  echo "What OS do you have installed? Arch=1/Ubuntu=0: "
  read os

  if [ $os -eq 1 ] ; then
    echo "installing Those Packages"
    pacman -S nvidia primus bumblebee
  fi

  if [ $os -eq 0 ] ; then
    echo "installing Those Packages"
    apt get install nvidia primus bumblebee
  fi

fi
