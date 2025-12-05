#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import sys
from pathlib import Path

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
    parser.add_argument(
        "--kitty", action="store_true", default=False, help="Set up kitty terminal"
    )
    parser.add_argument(
        "--tmux", action="store_true", default=False, help="Set up tmux"
    )
    parser.add_argument(
        "--starship", action="store_true", default=False, help="Set up starship"
    )
    parser.add_argument(
        "--sxhkd", action="store_true", default=False, help="Set up sxhkd"
    )
    parser.add_argument(
        "--sway", action="store_true", default=False, help="Set up sway"
    )
    parser.add_argument(
        "--shells",
        action="store_true",
        default=False,
        help="Set up .bashrc and config.fish",
    )
    parser.add_argument(
        "--all", action="store_true", default=False, help="Set up all dotfiles"
    )

    if len(sys.argv) == 1:
        parser.print_help()

    return parser.parse_args()


def setup_neovim(all=False):
    link_dotfiles("neovim", "configs/nvim/", "~/.config/nvim/")

    if all is True:
        create_symlink("configs/editorconfig", "~/.editorconfig")
        create_symlink("configs/sqlfluff", "~/.sqlfluff")


def link_dotfiles(tool, source, target):
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
        link_dotfiles("kitty", "configs/kitty/kitty.conf", "~/.config/kitty/kitty.conf")
    if args.tmux or args.all:
        link_dotfiles("tmux", "configs/tmux/tmux.conf", "~/.tmux.conf")
    if args.sway or args.all:
        link_dotfiles("sway", "configs/sway/config", "~/.config/sway/config")
    if args.starship or args.all:
        link_dotfiles(
            "starship", "configs/starship/starship.toml", "~/.config/starship.toml"
        )
    if args.sxhkd or args.all:
        link_dotfiles("sxhkd", "configs/sxhkd/sxhkdrc", "~/.config/sxhkd/sxhkdrc")
    if args.shells or args.all:
        setup_dotfiles()
