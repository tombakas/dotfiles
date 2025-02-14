from datetime import datetime as dt
from pathlib import Path

from deploy.color_print import ColorPrint

BASE_DIR = Path(__file__).absolute().parents[1]


def create_symlink(source, target):
    source = Path(BASE_DIR / source)

    full_target = Path(target).expanduser()
    full_source = Path(source).expanduser()

    now = dt.now().strftime("%Y%m%d_%H%M")
    new_name = str(full_target) + "." + now + ".bak"

    if full_target.exists():
        if full_target.is_symlink():
            ColorPrint.yellow(
                pre_text="Symlink to ", color_text=target, post_text=" already exists"
            )
            return
        else:
            ColorPrint.yellow(color_text=target, post_text=" already exists")

            ColorPrint.yellow(color_text="Creating backup at ", post_text=new_name)
            full_target.rename(new_name)
    elif full_target.is_symlink():
        ColorPrint.red(
            pre_text="Symlink ",
            color_text=full_target.as_posix(),
            post_text=" is broken, unlinking... ",
        )
        full_target.unlink()
    else:
        create_directory(full_target.parent)

    ColorPrint.green(color_text="Creating symlink to ", post_text=str(full_target))
    full_target.symlink_to(full_source)


def create_directory(target):
    target = Path(target).expanduser()
    if not target.exists():
        ColorPrint.yellow(
            pre_text="Directory ",
            color_text=target.as_posix(),
            post_text=" does not exist, creating...",
        )
        target.mkdir(parents=True)


def append_to_file(text, file):
    ColorPrint.green(
        pre_text="Adding ", color_text=text, post_text=" to {}".format(file)
    )
    with open(Path(file).expanduser(), "a") as f:
        f.write("\n" + text + "\n")


def add_line_to_file(line, file):
    if not Path(file).expanduser().exists():
        ColorPrint.yellow(
            pre_text="File ",
            color_text="{}".format(Path(file).expanduser()),
            post_text=" does not exist. Creating it...",
        )
        Path(file).expanduser().touch()
    if not text_in_file(line, file):
        append_to_file(line, file)
    else:
        ColorPrint.bold(
            color_text="{}".format(line),
            end="",
        )
        ColorPrint.yellow(
            pre_text=" already in ",
            color_text="{}".format(file),
        )


def text_in_file(text, file):
    with open(Path(file).expanduser(), "r") as f:
        for line in f:
            if text in line:
                return True
    return False


def print_title(text):
    print(f"\n{text}")
    print("=" * len(text))
