#!/bin/bash

# Modified again by Eric Fernandes Ferreira <candelabrus@gmail.com> for my personal Infinality Fonts Project

set -e

# To have our own output directory (upgradepkg)
export TMP=/tmp/infinality-fonts
rm -rf $TMP

# Number of CPUs + 1
export NUMJOBS=$(expr $(lscpu | grep -E '^CPU\(s\):' | xargs | cut -d ' ' -f 2) + 1)

echo "###"
echo "### Building: source/beautifulsoup ..."
echo "###"
sleep 3

( cd beautifulsoup
  sh beautifulsoup.SlackBuild || exit 1
  upgradepkg --install-new --reinstall $TMP/beautifulsoup*.txz
) || exit 1

echo "###"
echo "### Building: source/cssselect ..."
echo "###"
sleep 3

( cd cssselect
  sh cssselect.SlackBuild || exit 1
  upgradepkg --install-new --reinstall $TMP/cssselect*.txz
) || exit 1

echo "###"
echo "### Building: source/lxml ..."
echo "###"
sleep 3

( cd lxml
  sh lxml.SlackBuild || exit 1
  upgradepkg --install-new --reinstall $TMP/lxml*.txz
) || exit 1

echo "###"
echo "### Building: source/freetype ..."
echo "###"
sleep 3

( cd freetype
  sh freetype.SlackBuild || exit 1
  upgradepkg --install-new --reinstall $TMP/freetype*.txz
) || exit 1

echo "###"
echo "### Building: source/fontconfig ..."
echo "###"
sleep 3

( cd fontconfig
  sh fontconfig.SlackBuild || exit 1
  upgradepkg --install-new --reinstall $TMP/fontconfig*.txz
) || exit 1

echo "###"
echo "### Building: source/cairo ..."
echo "###"
sleep 3

( cd cairo
  sh cairo.SlackBuild || exit 1
  upgradepkg --install-new --reinstall $TMP/cairo*.txz
) || exit 1

echo "###"
echo "### Finished."
echo "###"
