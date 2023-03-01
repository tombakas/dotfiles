#!/usr/bin/env bash

transfer() {
    if [ $# -eq 0  ]; then
        echo -e "No arguments specified. Usage:\n\tcat /tmp/test.md | transfer test.md";
        return 1;
    fi

    filename=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
    curl --progress-bar -w "\n" --upload-file "$1" "https://transfer.sh/$filename" | tee
}

reset_permissions() {
    find . -type f -print0 | xargs -0 chmod -v 644
    find . -type d -print0 | xargs -0 chmod -v 755
}

night_light() {
    LIGHT_STATUS=$(gsettings get org.gnome.settings-daemon.plugins.color night-light-enabled)

    if [[ $LIGHT_STATUS == "true" ]]; then
        gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false
    else
        gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
    fi
}
