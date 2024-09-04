#!/usr/bin/python3

import argparse
import subprocess
from typing import List
import os

DARK_WALLS_DIR = os.path.expanduser("~/dotfiles/wallpapers_dark/*")
LIGHT_WALLS_DIR = os.path.expanduser("~/dotfiles/wallpapers_light/*")
SPAN_WALL = f"{DARK_WALLS_DIR}/gingaeiyuu_span.png"


def get_xrandr_out() -> List[str]:
    return [
        line
        for line in subprocess.check_output("xrandr").decode().splitlines()
        if "connected" in line.split()
    ]


def set_walls(
    wall_dir: str, span: bool = False, num_screen: int = 2
):
    feh_cmd = ["feh"]
    if span:
        feh_cmd += ["--bg-scale", "--no-xinerama", SPAN_WALL]
    else:
        for _ in range(num_screen):
            feh_cmd += ["--bg-scale", "--randomize", wall_dir]
    subprocess.call(feh_cmd)


def main(args: argparse.Namespace):
    if args.d:
        subprocess.call(["notify-send", "Setting dark mode walls"])
        wall_dir = DARK_WALLS_DIR
    else:
        subprocess.call(["notify-send", "Setting light mode walls"])
        wall_dir = LIGHT_WALLS_DIR
    set_walls(wall_dir, num_screen=1)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-d", type=bool, default=True, help="Dark mode")
    args = parser.parse_args()
    main(args)
