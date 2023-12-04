#!/data/data/com.termux/files/usr/bin/bash

execute_command() {
    if ! "$@"; then
        echo "Error: Failed to execute $*"
        exit 1
    fi
}

execute_command pkg update -y
execute_command pkg install -y root-repo
execute_command pkg install -y git tsu python wpa-supplicant pixiewps iw openssl

execute_command git clone --depth 1 https://github.com/fulvius31/OneShot OneShot

execute_command chmod +x OneShot/oneshot.py

printf "###############################################\n# All done! Now you can run OneShot with\n# sudo python OneShot/oneshot.py -i wlan0 -K\n#\n# To update, run\n# (cd OneShot && git pull)\n###############################################\n"
