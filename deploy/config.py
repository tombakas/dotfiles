from configparser import ConfigParser
from pathlib import Path

BASE_DIR = Path(__file__).absolute().parents[1]
CONFIG = ConfigParser()
CONFIG.read(Path(BASE_DIR).joinpath("configs/deploy/config.ini"))
