#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import print_function

import argparse
import os
from datetime import datetime as dt

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


def create_symlink(source, target):
    full_target = os.path.expanduser(target)
    now = dt.now().strftime("%Y%m%d_%H%M")
    new_name = full_target + "." + now + ".bak"

    if os.path.isfile(full_target):
        if os.path.islink(full_target):
            print("Symlink to ", end="")
            sexy_print.yellow(target, "")
            print(" already exists")
            print()
            return
        else:
            sexy_print.yellow(target, "")
            print(" already exists")

            print("Creating backup at ", end="")
            sexy_print.yellow(new_name)
            os.rename(full_target, new_name)

    print("Creating symlink to ", end="")
    sexy_print.green(full_target)
    print()
    os.symlink(os.path.join(BASE_DIR, source), full_target)

    return


def setup_dotfile(source, name):
    sexy_print.header("Setting up " + name)
    create_symlink(source, "~/" + name)


if __name__ == "__main__":

    arguments = parse_arguments()

    VIM = arguments.vim
    NVIM = arguments.nvim
    DOTFILES = arguments.dotfiles[0]

    if DOTFILES is not None:
        if "t" in DOTFILES:
            setup_dotfile(os.path.join(BASE_DIR, ".tmux.conf"), ".tmux.conf")
        if "v" in DOTFILES:
            setup_dotfile(os.path.join(BASE_DIR, "vimrc_files/.vimrc"), ".vimrc")
