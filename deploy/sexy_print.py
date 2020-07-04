GREEN = "\033[92m"
YELLOW = "\033[93m"
RED = "\033[91m"
BLUE = "\033[34m"
BOLD = "\033[1m"
NORMAL = "\033[0m"
UNDERLINE = "\033[4m"


def color_builder(color, *args, **kwargs):
    def color_fun(start="", text="", finish="", end="\n"):
        if start != "" and text == "" and finish == "":
            text = start
            start = ""
        print(start + color + text + NORMAL + finish, end=end)
    color_fun(*args, **kwargs)


def bold(*args, **kwargs):
    color_builder(BOLD, *args, **kwargs)


def green(*args, **kwargs):
    color_builder(GREEN, *args, **kwargs)


def red(*args, **kwargs):
    color_builder(RED, *args, **kwargs)


def yellow(*args, **kwargs):
    color_builder(YELLOW, *args, **kwargs)


def header(text="", color=GREEN):
    print(80 * "-")
    if len(text) % 2 == 0:
        padding = int((80 - len(text)) / 2) * "-"
        print(padding + color + text + NORMAL + padding)
    else:
        padding_left = int((80 - len(text) - 1) / 2) * "-"
        padding_right = int((80 - len(text) + 1) / 2) * "-"
        print(padding_left + color + text + NORMAL + padding_right)
    print(80 * "-")
