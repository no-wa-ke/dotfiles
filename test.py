#!/usr/bin/env python

import commands

check = commands.getoutput("ls -F | grep -v ./.*")

print check