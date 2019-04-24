#!/usr/bin/python3
import sys

div1="<span class=\"image left\"><img src=\"{{ \'"
div2="\' | relative_url }}\" alt=\"\" /></span>"

foo = str(sys.argv[1])

with open(foo) as f:
    for line in f:
        if "![]" in line:
            path = line.strip('![]()')
            path = path.strip()
            path = path[:-1]
            print(div1+path+div2)
        else:
            print(line)
        