#!/bin/sh

case "$1" in
    *.tar*)
        tar tf "$1"
        ;;
    *.zip)
        unzip -l "$1"
        ;;
    *.odt|*.ods|*.odp|*.sxw)
        odt2txt "$1"
        ;;
    *.docx)
        docx2txt "$1" -
        ;;
    *.wav|*.mp3|*.flac|*.m4a|*.wma|*.ape|*.ac3|*.og[agx]|*.spx|*.opus|*.as[fx]|*.mka|*.mp4)
        exiftool "$1"
        ;;
    *.png|*.jpg|*.JPG)
        chafa "$1" -s "$4x" -w 9
        ;;
    *)
        bat --color=always --style=plain --theme=gruvbox-dark --pager=never "$1"
        ;;
esac
