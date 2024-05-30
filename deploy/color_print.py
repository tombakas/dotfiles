class ColorPrint:
    GREEN = "\033[92m"
    YELLOW = "\033[93m"
    RED = "\033[91m"
    BLUE = "\033[34m"
    BOLD = "\033[1m"
    NORMAL = "\033[0m"
    UNDERLINE = "\033[4m"

    @classmethod
    def color_print(
        cls, color_text="", pre_text="", post_text="", color="", end="\n"
    ):
        print(f"{pre_text}{color}{color_text}{cls.NORMAL}{post_text}", end=end)

    @classmethod
    def bold(cls, *args, **kwargs):
        cls.color_print(color=cls.BOLD, *args, **kwargs)

    @classmethod
    def green(cls, *args, **kwargs):
        cls.color_print(color=cls.GREEN, *args, **kwargs)

    @classmethod
    def red(cls, *args, **kwargs):
        cls.color_print(color=cls.RED, *args, **kwargs)

    @classmethod
    def yellow(cls, *args, **kwargs):
        cls.color_print(color=cls.YELLOW, *args, **kwargs)
