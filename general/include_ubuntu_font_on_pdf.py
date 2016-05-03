#!/usr/bin/python

from subprocess import call
import sys

if len(sys.argv) != 2:
    print "Errore di sintassi."
    sys.exit(2)

nomeFile = sys.argv[1]
nomeFileOut = "def_"+nomeFile
call("gs -o "+nomeFileOut+" -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sFONTPATH=/usr/share/fonts/truetype/ubuntu-font-family "+nomeFile, shell="True")


