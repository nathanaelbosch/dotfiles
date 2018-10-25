#!/usr/bin/bash
path=$1
file=${path##*/} 
base=${file%.*}

MAKEFILE='~/scripts/cy2exe.Makefile'
TMPDIR='/tmp/cy2exe/'

mkdir -p $TMPDIR
cp $1 "$TMPDIR/embedded.pyx"

make -C $TMPDIR -f '~/scripts/cy2exe.Makefile'
cp "$TMPDIR/embedded" ./$base