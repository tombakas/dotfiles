#!/usr/bin/env python3

import argparse
import sys
from enum import Enum
from pathlib import Path

from deploy.dotfiles import Dotfiles
from deploy.utils import add_line_to_file, create_symlink, print_title


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--neovim",
        nargs="?",
        const=True,
        default=False,
        metavar="all",
        help="Set up neovim related dotfiles. Pass 'all' as an argument to also set up sqfluff and editorconfig",
    )

    for dotfile in Dotfiles:
        parser.add_argument(
            f"--{dotfile.value.name}",
            action="store_true",
            default=False,
            help=dotfile.value.help,
        )

    if len(sys.argv) == 1:
        parser.print_help()

    return parser.parse_args()


def setup_neovim(all=False):
    link_dotfiles("neovim", "configs/nvim/", "~/.config/nvim/")

    if all is True:
        create_symlink("configs/editorconfig", "~/.editorconfig")
        create_symlink("configs/sqlfluff", "~/.sqlfluff")


def link_dotfiles(*args, **kwargs):
    if len(args) == 1 and isinstance(args[0], Enum):
        namespace = args[0].value
        tool = namespace.name
        source = namespace.source
        target = namespace.target
    else:
        tool = args[0]
        source = args[1]
        target = args[2]
    print_title(tool)
    create_symlink(source, target)


def setup_dotfiles():
    print_title("shells")
    path_to_bashrc = Path(__file__).parent / "configs" / "bash" / "bashrc"
    path_to_fish_config = Path(__file__).parent / "configs" / "fish" / "config.fish"

    add_line_to_file(f"source {path_to_fish_config}", "~/.config/fish/config.fish")
    add_line_to_file(f". {path_to_bashrc}", "~/.bashrc")


if __name__ == "__main__":
    args = parse_args()

    if args.neovim or args.all:
        setup_neovim(all=args.neovim == "all" or args.all)
    if args.kitty or args.all:
        link_dotfiles(Dotfiles.KITTY)
    if args.tmux or args.all:
        link_dotfiles(Dotfiles.TMUX)
    if args.sway or args.all:
        link_dotfiles(Dotfiles.SWAY)
    if args.starship or args.all:
        link_dotfiles(Dotfiles.STARSHIP)
    if args.sxhkd or args.all:
        link_dotfiles(Dotfiles.SXHKD)
    if args.shells or args.all:
        setup_dotfiles()
