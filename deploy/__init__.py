import argparse

from configparser import ConfigParser
from datetime import datetime as dt
from pathlib import Path

from deploy import sexy_print


BASE_DIR = Path(__file__).absolute().parents[1]
CONFIG = ConfigParser()
CONFIG.read(Path(BASE_DIR).joinpath("configs/deploy/config.ini"))


def parse_arguments():
    parser = argparse.ArgumentParser(description="Dotfile deployment script.")
    parser.add_argument(
        "-v", "--vim", default=False, action="store_true", help="Set up vim."
    )
    parser.add_argument(
        "-b", "--bash", default=False, action="store_true", help="Set up bash dotfiles."
    )
    parser.add_argument(
        "-n", "--nvim", default=False, action="store_true", help="Set up neovim."
    )
    parser.add_argument(
        "--vimplug",
        default="",
        help="Set up vimplug for vim/neovim provided as argument.",
    )
    parser.add_argument(
        "-d",
        "--dotfiles",
        nargs="*",
        default=None,
        help="Set up dotfiles([b]ash, [v]im, [n]eovim, [t]mux, [c]colors). Defaults to all.",
    )
    parser.add_argument(
        "-y", default=False, action="store_true", help="Yes to all prompts."
    )
    args = parser.parse_args()

    return args


def setup_dotfile(source, target, name=None):
    if name is None:
        sexy_print.header("Setting up " + Path(target).name)
    else:
        sexy_print.header("Setting up " + target)
    create_symlink(source, target)


def create_symlink(source, target):
    full_target = Path(target).expanduser()
    full_source = Path(source).expanduser()

    now = dt.now().strftime("%Y%m%d_%H%M")
    new_name = str(full_target) + "." + now + ".bak"

    if full_target.exists():
        if full_target.is_symlink():
            sexy_print.yellow("Symlink to ", target, " already exists\n")
            return
        else:
            sexy_print.yellow("", target, " already exists")

            sexy_print.yellow("Creating backup at ", new_name, "\n")
            full_target.rename(new_name)
    elif full_target.is_symlink():
        print("Symlink ", end="")
        sexy_print.red("Symlink ", full_target, " is broken, unlinking... ")
        full_target.unlink()
    else:
        directory_make(full_target.parent)

    print("Creating symlink to ", end="")
    sexy_print.green(str(full_target))
    full_target.symlink_to(full_source)


def directory_make(target):
    target = Path(target).expanduser()
    if not target.exists():
        sexy_print.yellow("Directory ", target.as_posix(), " does not exist, creating...")
        target.mkdir(parents=True)


def append_to_file(text, file):
    print("Adding ", end="")
    sexy_print.green(text, end="")
    print(" to {}".format(file))
    with open(Path(file).expanduser(), "a") as f:
        f.write(text + "\n")


def add_line_to_file(line, file):
    if not text_in_file(line, file):
        append_to_file(line, file)
    else:
        sexy_print.yellow('"{}" '.format(line), end="")
        print("already in ", end="")
        sexy_print.yellow("{}".format(file))


def setup_colors():
    sexy_print.header("Setting up colors")
    for file in Path(BASE_DIR, "configs/vim/colors/vim/").glob("*"):
        setup_dotfile(file, str(Path("~/.vim/colors/", file.name)))


def text_in_file(text, file):
    text_present = False
    with open(Path(file).expanduser(), "r") as f:
        for line in f:
            if text in line:
                text_present = True
                break
    return text_present


def setup_bash():
    setup_dotfile(
        Path(BASE_DIR, "configs/git/git-prompt.sh"), "~/.git-prompt.sh"
    )
    setup_dotfile(Path(BASE_DIR, "configs/git/git_aliases"), "~/.git_aliases")
    setup_dotfile(Path(BASE_DIR, "configs/bash/tomasrc"), "~/.tomasrc")
    setup_dotfile(Path(BASE_DIR, "configs/sxhkd/sxhkdrc"), "~/.config/sxhkd/sxhkdrc")
    add_line_to_file(". ~/.tomasrc", "~/.bashrc")
    add_line_to_file(". ~/.git-prompt.sh", "~/.bashrc")
    add_line_to_file(". ~/.git_aliases", "~/.bashrc")
