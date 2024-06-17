#!/bin/bash

start_po(){
  export DISPLAY=:0
  export $(dbus-launch)
  echo "START DISABLE HOTKEYS"

  for schema in $(gsettings list-schemas | grep -E 'keybindings|media-keys')
  do
      for key in $(gsettings list-keys $schema)
      do
          if [[ $(gsettings range $schema $key) == "type as" ]]; then
              gsettings set $schema $key "@as []"
          fi
      done
  done

  echo "END DISABLE HOTKEYS"
  openshot-qt
}


while [ 1 ]
do
  # Check whether or not socket exists
  if [ -S /tmp/.X11-unix/X0 ]
  then
    start_po
    exit 0
  fi

  # Adjust timeout according to your needs
  if [ $SECONDS -gt 15 ]
  then
    exit 1
  fi

  sleep 0.5
done