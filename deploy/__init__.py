from configparser import ConfigParser
from datetime import datetime as dt
from pathlib import Path

from deploy import sexy_print


BASE_DIR = Path(__file__).absolute().parents[1]
CONFIG = ConfigParser()
CONFIG.read(Path(BASE_DIR).joinpath("configs/deploy/config.ini"))


def create_symlink(source, target, name=None):
    if name is None:
        sexy_print.header("Setting up " + Path(target).name)
    else:
        sexy_print.header("Setting up " + target)

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
        create_directory(full_target.parent)

    print("Creating symlink to ", end="")
    sexy_print.green(str(full_target))
    full_target.symlink_to(full_source)


def create_directory(target):
    target = Path(target).expanduser()
    if not target.exists():
        sexy_print.yellow(
            "Directory ", target.as_posix(), " does not exist, creating..."
        )
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


def text_in_file(text, file):
    text_present = False
    with open(Path(file).expanduser(), "r") as f:
        for line in f:
            if text in line:
                text_present = True
                break
    return text_present
