from dataclasses import dataclass
from enum import Enum
from pathlib import Path


@dataclass()
class Dotfile:
    name: str
    help: str
    source: Path = None
    target: Path = None


class Dotfiles(Enum):
    KITTY = Dotfile(
        "kitty",
        "Set up kitty terminal",
        Path("configs/kitty/kitty.conf"),
        Path("~/.config/kitty/kitty.conf"),
    )
    TMUX = Dotfile(
        "tmux", "Set up tmux", Path("configs/tmux/tmux.conf"), Path("~/.tmux.conf")
    )
    STARSHIP = Dotfile(
        "starship",
        "Set up starship",
        Path("configs/starship/starship.toml"),
        Path("~/.config/starship.toml"),
    )
    SXHKD = Dotfile(
        "sxhkd",
        "Set up sxhkd",
        Path("configs/sxhkd/sxhkdrc"),
        Path("~/.config/sxhkd/sxhkdrc"),
    )
    SWAY = Dotfile(
        "sway",
        "Set up sway",
        Path("configs/sway/config"),
        Path("~/.config/sway/config"),
    )
    SHELLS = Dotfile(name="shells", help="Set up .bashrc and config.fish")
    ALL = Dotfile(name="all", help="Set up all dotfiles")
