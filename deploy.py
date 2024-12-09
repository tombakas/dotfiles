#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from pathlib import Path

from deploy.utils import add_line_to_file, create_symlink


def setup_neovim():
    create_symlink("configs/sqlfluff", "~/.sqlfluff")
    create_symlink("configs/nvim/", "~/.config/nvim/")
    create_symlink("configs/editorconfig", "~/.editorconfig")


def setup_kitty():
    create_symlink("configs/kitty/kitty.conf", "~/.config/kitty/kitty.conf")


def setup_tmux():
    create_symlink("configs/tmux/tmux.conf", "~/.tmux.conf")


def setup_starship():
    create_symlink("configs/starship/starship.toml", "~/.config/starship.toml")


def setup_sxhkd():
    create_symlink("configs/sxhkd/sxhkdrc", "~/.config/sxhkd/sxhkdrc")


def setup_dotfiles():
    path_to_bashrc = Path(__file__).parent / "configs" / "bash" / "bashrc"
    path_to_fish_config = Path(__file__).parent / "configs" / "fish" / "config.fish"

    add_line_to_file(f"source {path_to_fish_config}", "~/.config/fish/config.fish")
    add_line_to_file(f". {path_to_bashrc}", "~/.bashrc")


if __name__ == "__main__":
    setup_neovim()
    setup_starship()
    setup_sxhkd()
    setup_dotfiles()
