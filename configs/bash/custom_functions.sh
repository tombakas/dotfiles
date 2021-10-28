function mkenv.sh {
    echo -e "Looking for \e[1mbin/activate\e[0m"

    activate_dir=$(find . -maxdepth 3 -wholename '*/bin/activate' | cut -d "/" -f 2-)

    if [ -z "$1" ]
    then
        venv_name=venv
    else
        venv_name=$1
    fi

    if [ "$activate_dir" != "" ]
    then
        echo -e "Found at \e[1m$activate_dir\e[0m"
    else
        echo -e "\e[1m\e[91mNothing found\e[0m"
        return
    fi

    cat << EOF > ./env.sh
DIR="\$( cd "\$( dirname "\${BASH_SOURCE[0]}"  )" && pwd  )"
pushd \$DIR > /dev/null
. "$activate_dir"
popd > /dev/null

export PS1="($venv_name)\${_OLD_VIRTUAL_PS1}"
EOF
    echo -e "\e[32m\e[1mDone\e[0m"
}

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
