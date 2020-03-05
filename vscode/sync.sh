#! /bin/bash

linux_config_path="$HOME/.config/Code/User"

mkdir -p "$linux_config_path"

function pull() {
    cp settings.json "$linux_config_path"
}

function push() {
    cp "$linux_config_path"/settings.json settings.json
}

function main() {
    if [ $# -ne 1 ]; then
        echo "脚本只能有一个参数(-h/pull/push)"
        exit
    fi
    case $1 in
    pull)
        pull
        ;;
    push)
        push
        ;;
    '-h')
        cat <<EOL
脚本需要一个参数
-h显示本帮助信息
pull用dotfiles的配置覆盖本地配置
push用本地配置覆盖dotfiles配置
EOL
        ;;
    *)
        echo "参数必须是(-h/push/pull)"
        exit
        ;;
    esac
}

main "$@"
