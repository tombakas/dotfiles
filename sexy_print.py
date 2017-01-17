from __future__ import print_function


class sexy_print(object):
    GREEN = "\033[92m"
    YELLOW = "\033[93m"
    RED = "\033[91m"
    BLUE = "\033[34m"
    BOLD = "\033[1m"
    NORMAL = "\033[0m"
    UNDERLINE = '\033[4m'

    def __init__(self):
        pass

    def bold(self, start="", text="", finish="", end="\n"):
        if start != "" and text == "" and finish == "":
            text = start
            start = ""
        print(start + self.BOLD + text + self.NORMAL + finish, end=end)

    def green(self, start="", text="", finish="", end="\n"):
        if start != "" and text == "" and finish == "":
            text = start
            start = ""
        print (start + self.GREEN + text + self.NORMAL + finish, end=end)

    def red(self, start="", text="", finish="", end="\n"):
        if start != "" and text == "" and finish == "":
            text = start
            start = ""
        print (start + self.RED + text + self.NORMAL + finish, end=end)

    def yellow(self, start="", text="", finish="", end="\n"):
        if start != "" and text == "" and finish == "":
            text = start
            start = ""
        print (start + self.YELLOW + text + self.NORMAL + finish, end=end)

    def header(self, text=""):
        text_length = len(text)
        print (80 * "-")
        if (text_length % 2 == 0):
            padding = (80 - len(text)) / 2 * "-"
            print(padding + self.GREEN + text + self.NORMAL + padding)
        else:
            padding_left = (80 - len(text) - 1) / 2 * "-"
            padding_right = (80 - len(text) + 1) / 2 * "-"
            print(padding_left + self.GREEN + text + self.NORMAL + padding_right)
        print (80 * "-")
