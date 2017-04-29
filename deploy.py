#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import print_function

import argparse
import sys
import os

from datetime import datetime as dt
from subprocess import call

from sexy_print import sexy_print


BASE_DIR = os.path.abspath(os.path.dirname(__file__))
sexy_print = sexy_print()


def parse_arguments():
    parser = argparse.ArgumentParser(description='Dotfile deployment script.')
    parser.add_argument('-v', '--vim', default=False, action='store_true', help='Set up vim.')
    parser.add_argument('-n', '--nvim', default=False, action='store_true', help='Set up neovim.')
    parser.add_argument(
        '-d',
        '--dotfiles',
        nargs="*",
        default=None,
        help='Set up dotfiles([b]ash, [v]im, [n]eovim, [t]mux). Defaults to all.')
    parser.add_argument('-y', default=False, action='store_true', help='Yes to all prompts.')
    args = parser.parse_args()

    return args


def set_up_vimplug():
    call(["curl", "-fLo", os.path.expanduser("~/.vim/autoload/plug.vim"), "--create-dirs", "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"])


def create_symlink(source, target):
    full_target = os.path.expanduser(target)
    now = dt.now().strftime("%Y%m%d_%H%M")
    new_name = full_target + "." + now + ".bak"

    if os.path.isfile(full_target):
        if os.path.islink(full_target):
            sexy_print.yellow("Symlink to ", target, " already exists")
            return
        else:
            sexy_print.yellow("", target, " already exists")

            sexy_print.yellow("Creating backup at ", new_name)
            os.rename(full_target, new_name)
    elif os.path.islink(full_target):
        print("Symlink ", end="")
        sexy_print.red("Symlink ", target, " is broken, unlinking... ")

    print("Creating symlink to ", end="")
    sexy_print.green(full_target)
    try:
        os.symlink(os.path.join(BASE_DIR, source), full_target)
    except OSError:
        print("Full path to {} does not exist".format(full_target))
        sexy_print.red("Exiting")
        sys.exit(1)
    print()

    return


def setup_dotfile(source, target, name=None):
    if name is None:
        sexy_print.header("Setting up " + os.path.basename(target))
    else:
        sexy_print.header("Setting up " + target)
    create_symlink(source, target)


def directory_make(target):
    if not os.path.isdir(os.path.expanduser(target)):
        sexy_print.yellow("Directory ", target, " does not exist, creating...")
        os.makedirs(os.path.expanduser(target))


if __name__ == "__main__":

    arguments = parse_arguments()

    VIM = arguments.vim
    NVIM = arguments.nvim
    DOTFILES = arguments.dotfiles

    if DOTFILES is not None:
        if "t" in DOTFILES:
            setup_dotfile(os.path.join(BASE_DIR, ".tmux.conf"), "~/.tmux.conf")
        if "v" in DOTFILES:
            setup_dotfile(os.path.join(BASE_DIR, "vimrc_files/.vimrc"), "~/.vimrc")
            directory_make("~/.vim/indent")
            setup_dotfile(os.path.join(BASE_DIR, "vimrc_files/htmldjango.vim"), "~/.vim/indent/htmldjango.vim")
        if "n" in DOTFILES:
            setup_dotfile(os.path.join(BASE_DIR, "vimrc_files/init.vim"), "~/.config/nvim/init.vim")
