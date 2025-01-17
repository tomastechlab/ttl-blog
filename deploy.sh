#!/bin/sh
HOST=homelab
DIR=/home/m900/share/server/tomastechlab.com/   # the directory where your web site files should go

HUGO_ENV=production hugo && rsync -rzv public/* ${HOST}:${DIR} # this will delete everything on the server that's not in the local public folder

exit 0
