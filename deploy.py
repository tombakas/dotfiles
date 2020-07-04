#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from subprocess import call
from pathlib import Path

from deploy import (
    BASE_DIR,
    CONFIG,
    directory_make,
    parse_arguments,
    setup_bash,
    setup_colors,
    setup_dotfile,
    sexy_print,
)


def set_up_vimplug(vim_type):
    VIM_TARGET = "~/.vim/autoload/plug.vim"
    NVIM_TARGET = "~/.local/share/nvim/site/autoload/plug.vim"
    source = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

    if vim_type == "vim":
        target = Path(VIM_TARGET).expanduser()
    elif vim_type in ["nvim", "neovim"]:
        target = Path(NVIM_TARGET).expanduser()
    else:
        sexy_print.red("Unknown vim type supplied for vim_plug")
        return

    if target.exists():
        sexy_print.yellow("{} already exists".format(target))
        return
    sexy_print.header("Setting up VimPlug")
    sexy_print.green("Cloning VimPlug to {}\n".format(target))

    call(["curl", "-fLo", target, "--create-dirs", source])
    sexy_print.green("\nDone")


def setup_neovim():
    sexy_print.header("Setting up neovim")

    # Set up virtual environment
    virtualenv_dir = Path(CONFIG["Paths"]["VIRTUALENV_DIR"]).expanduser()
    virtualenv_dir.parent.mkdir(parents=True, exist_ok=True)

    # call(["sudo", "dnf", "install", "-y", "neovim", "python3-virtualenv"])
    if not Path(virtualenv_dir).exists():
        call(["virtualenv", "-p", "python3", virtualenv_dir])
    call([
            Path(virtualenv_dir, "bin", "pip"),
            "install",
            "-r",
            "./configs/deploy/requirements.txt",
    ])


if __name__ == "__main__":

    arguments = parse_arguments()

    VIM = arguments.vim
    NVIM = arguments.nvim
    BASH = arguments.bash
    VIMPLUG = arguments.vimplug
    DOTFILES = arguments.dotfiles

    if DOTFILES is not None:
        DOTFILES = "".join(DOTFILES)

        # If no dotfiles specified, setup all dotfiles
        if DOTFILES == "":
            DOTFILES = "bcntv"
        if "t" in DOTFILES:
            setup_dotfile(Path(BASE_DIR, "configs/tmux/tmux.conf"), "~/.tmux.conf")
        if "v" in DOTFILES:
            setup_dotfile(Path(BASE_DIR, "configs/vim/vimrc"), "~/.vimrc")
            directory_make("~/.vim/indent")
            setup_dotfile(
                Path(BASE_DIR, "configs/vim/htmldjango.vim"),
                "~/.vim/indent/htmldjango.vim",
            )
        if "n" in DOTFILES:
            setup_dotfile(
                Path(BASE_DIR, "configs/vim/init.vim"), "~/.config/nvim/init.vim",
            )
            setup_dotfile("~/.vim/colors", "~/.config/nvim/colors")
            setup_dotfile("~/.vim/plugged", "~/.config/nvim/plugged")
            setup_dotfile("~/.vim/indent", "~/.config/nvim/indent")
        if "c" in DOTFILES:
            setup_colors()
        if "b" in DOTFILES:
            setup_bash()

    if VIMPLUG:
        set_up_vimplug(VIMPLUG)

    if NVIM:
        setup_neovim()
