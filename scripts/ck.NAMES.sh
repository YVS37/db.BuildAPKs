#!/usr/bin/env sh
# Copyright 2020-2021 (c) all rights reserved by BuildAPKs; see LICENSE
# https://buildapks.github.io published courtesy https://pages.github.com
#################################################################################
set -eu
export RDR="$HOME/buildAPKs"
if [ $( awk '{print $5}' BNAMES | sort -gu | head -n 1 ) != 0 ]
then
	echo ok 
else
	echo "File BNAMES is corrupt!  EXITING..." 
	exit 
fi
if [ $( awk '{print $2}' GNAMES | sort -u | wc -c ) = 18 ] 
then
	echo ok 
else
	echo "File GNAMES is corrupt!  EXITING..." 
	exit 
fi
if [ $( awk '{print $5}' "$RDR/var/db/BNAMES" | sort -gu | head -n 1 ) != 0 ] 
then
	echo ok 
else
	echo "File ~/${RDR##*/}/var/db/BNAMES  is corrupt!  EXITING..." 
	exit 
fi
if [ $( awk '{print $2}' "$RDR/var/db/GNAMES" | sort -u | wc -c ) = 18 ] 
then
	echo ok 
else
	echo "File ~/${RDR##*/}/var/db/GNAMES is corrupt!  EXITING..." 
	exit 
fi
echo done 
# ck.NAMES.sh OEF
