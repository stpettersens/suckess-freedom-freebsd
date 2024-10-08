#
# Patched for FreeBSD based on swindlemccoop's patch for OpenBSD.
#
# dmenu version
VERSION = 5.0

# paths
PREFIX=/usr/local
MANPREFIX =$(PREFIX)/share/man

#X11INC = /usr/X11R6/include
#X11LIB = /usr/X11R6/lib
X11INC=/usr/local/include 
X11LIB=/usr/local/lib
# changed for FreeBSD

# Xinerama, comment if you don't want it
XINERAMALIBS=-lXinerama
XINERAMAFLAGS=-DXINERAMA

# freetype
FREETYPELIBS=-lfontconfig -lXft
FREETYPEINC=/usr/local/include/freetype2
# changed for FreeBSD

# includes and libs
INCS=-I$(X11INC) -I$(FREETYPEINC)
LIBS=-L$(X11LIB) -lX11 $(XINERAMALIBS) $(FREETYPELIBS) -lXrender

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=200809L -DVERSION=\"$(VERSION)\" $(XINERAMAFLAGS)
CFLAGS   = -std=c99 -pedantic -Wall -Os $(INCS) $(CPPFLAGS)
LDFLAGS  = $(LIBS)

# compiler and linker
CC = cc
