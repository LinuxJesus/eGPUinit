#/bin/bash
echo "RUN AS ROOT"
echo "eGPU=1 or iGPU=0: "
read egpu

if lspci | grep NVIDIA && $egpu = 1 ; then
  echo "Are you sure? Y=1 N=0: "
  read sure
  if $sure = 1 ; then
    echo "Switching to NVIDIA"

    if [ nvidia-xconfig -o /etc/X11/xorg.conf.nvidia ] ; then
      echo "NVIDIA Config Created"
      rename /etc/X11/xorg.conf /etc/X11/xorg.conf.backup.intel /etc/X11/xorg.conf
      rename /etc/X11/xorg.conf.nvidia /etc/X11/xorg.conf /etc/X11/xorg.conf.nvidia
      echo "Restarting xServer"
      systemctl restart lightdm.service

    fi

  fi

fi

echo "Are You sure? Y=1 N=0: "
read input
  if [ $input = 1 ] ; then
  echo "Switching to igpu"
  rename /etc/X11/xorg.conf /etc/X11/xorg.conf.nvidia /etc/X11/xorg.conf
  rename /etc/X11/xorg.conf.backup.intel /etc/X11/xorg.conf /etc/X11/xorg.conf.backup.intel
  echo "Restarting xServer"
  systemctl restart lightdm.service

  if [ $input = 0 ] ; then
    exit

  fi

fi
