#!/usr/bin/python

import sys
from subprocess import call

# file being saves
file_name = sys.argv[1].split("/")

# directory to monitor for changes
project_dir = "/home/tomas/projects/jw/portal".split("/")

# is file in watched dir
if project_dir == file_name[0: len(project_dir)]:

    # determine project root dir
    project_name = file_name[len(project_dir)]
    project_location = "/".join(project_dir + [project_name])

    # determine what file to touch to trigger a reload
    touch_files = {
        "portal-api": "platform.wsgi",
        "default": "src/app.py"
    }
    filename = (
        touch_files["default"]
        if project_name not in touch_files.keys()
        else touch_files[project_name]
    )
    call("touch %s/%s" % (project_location, filename), shell=True)
