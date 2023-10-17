#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from subprocess import call
from pathlib import Path

from deploy import (
    BASE_DIR,
    CONFIG,
    add_line_to_file,
    create_symlink,
    sexy_print,
)


def setup_neovim():
    sexy_print.header("Setting up neovim")

    create_symlink(
        Path(BASE_DIR, "configs/nvim/init.lua"),
        "~/.config/nvim/init.lua",
    )
    create_symlink(
        Path(BASE_DIR, "configs/nvim/lua"),
        "~/.config/nvim/lua",
    )
    create_symlink(
        Path(BASE_DIR, "configs/nvim/indent"),
        "~/.config/nvim/indent",
    )
    create_symlink(
        Path(BASE_DIR, "configs/fish/neovim_env.fish"),
        "~/.config/fish/conf.d/neovim_env.fish",
    )
    create_symlink(
        Path(BASE_DIR, "configs/editorconfig"),
        "~/.editorconfig",
    )

    # Set up virtual environment
    virtualenv_dir = Path(CONFIG["Paths"]["VIRTUALENV_DIR"]).expanduser()
    virtualenv_dir.parent.mkdir(parents=True, exist_ok=True)

    if not Path(virtualenv_dir).exists():
        call(["virtualenv", "-p", "python3", virtualenv_dir])
        call(
            [
                Path(virtualenv_dir, "bin", "pip"),
                "install",
                "-r",
                "./configs/deploy/requirements.txt",
            ]
        )


if __name__ == "__main__":
    create_symlink(
        Path(BASE_DIR, "configs/kitty/kitty.conf"), "~/.config/kitty/kitty.conf"
    )
    create_symlink(
        Path(BASE_DIR, "configs/starship/starship.toml"), "~/.config/starship.toml"
    )
    create_symlink(Path(BASE_DIR, "configs/tmux/tmux.conf"), "~/.tmux.conf")
    create_symlink(Path(BASE_DIR, "configs/bash/tomasrc"), "~/.tomasrc")
    create_symlink(Path(BASE_DIR, "configs/sxhkd/sxhkdrc"), "~/.config/sxhkd/sxhkdrc")
    add_line_to_file(". ~/.tomasrc", "~/.bashrc")

    setup_neovim()
