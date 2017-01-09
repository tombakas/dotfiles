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

    def bold(self, text, end="\n"):
        print(self.BOLD + text + self.NORMAL, end=end)

    def green(self, text, end="\n"):
        print (self.GREEN + text + self.NORMAL, end=end)

    def red(self, text, end="\n"):
        print (self.RED + text + self.NORMAL, end=end)

    def yellow(self, text, end="\n"):
        print (self.YELLOW + text + self.NORMAL, end=end)

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
