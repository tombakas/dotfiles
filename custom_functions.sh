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
