#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from pathlib import Path
from subprocess import call

from deploy.config import CONFIG
from deploy.utils import add_line_to_file, create_symlink


def setup_neovim():
    # Set up virtual environment
    virtualenv_dir = Path(CONFIG["Paths"]["VIRTUALENV_DIR"]).expanduser()
    virtualenv_dir.parent.mkdir(parents=True, exist_ok=True)

    if not Path(virtualenv_dir).exists():
        call(["python3", "-m", "venv", virtualenv_dir])
        call(
            [
                Path(virtualenv_dir, "bin", "pip"),
                "install",
                "-r",
                "./configs/deploy/requirements.txt",
            ]
        )

    # Set up nvim related config files
    create_symlink("configs/sqlfluff", "~/.sqlfluff")
    create_symlink("configs/nvim/init.lua", "~/.config/nvim/init.lua")
    create_symlink("configs/nvim/lua", "~/.config/nvim/lua")
    create_symlink("configs/nvim/indent", "~/.config/nvim/indent")
    create_symlink(
        "configs/fish/neovim_env.fish", "~/.config/fish/conf.d/neovim_env.fish"
    )
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
    create_symlink("configs/bash/tomasrc", "~/.tomasrc")
    add_line_to_file(". ~/.tomasrc", "~/.bashrc")


if __name__ == "__main__":
    setup_neovim()
    setup_starship()
    setup_sxhkd()
    setup_dotfiles()
