#!/usr/bin/env python3
import os
import base64
import sys

clip = base64.b64encode(sys.stdin.buffer.read())
for pid in (
    os.getpid(),
    os.getppid(),
):  # so that osc52-copy can be invoked by processes that themselves do not have a tty.
    cty = f"/proc/{pid}/fd/1"
    try:
        fd = os.open(cty, os.O_WRONLY)
        if os.isatty(fd):
            os.write(fd, b"\x1b]52;c;")  # the actual escape sequence
            os.write(fd, clip)
            os.write(fd, b"\a")
            break
    except Exception:
        continue
    finally:
        os.close(fd)
else:
    raise SystemExit("no tty")
