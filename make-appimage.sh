#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q gnome-system-monitor | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/org.gnome.SystemMonitor.svg
export DESKTOP=/usr/share/applications/org.gnome.SystemMonitor.desktop
export DEPLOY_OPENGL=1
export STARTUPWMCLASS=gnome-system-monitor # For Wayland, this is 'org.gnome.SystemMonitor', so this needs to be changed in desktop file manually by the user in that case until some potential automatic fix exists for this

# Trace and deploy all files and directories needed for the application (including binaries, libraries and others)
quick-sharun /usr/bin/gnome-system-monitor \
             /usr/lib/gnome-system-monitor/*

## Add missing Processes and Resources icon
cp -v /usr/share/icons/hicolor/symbolic/apps/processes-symbolic.svg ./AppDir/share/icons/hicolor/symbolic/apps/processes-symbolic.svg
cp -v /usr/share/icons/hicolor/symbolic/apps/resources-symbolic.svg ./AppDir/share/icons/hicolor/symbolic/apps/resources-symbolic.svg

## Copy help files for Help section to work
langs=$(find /usr/share/help/*/gnome-system-monitor/ -type f | awk -F'/' '{print $5}' | sort | uniq)
for lang in $langs; do
  mkdir -p ./AppDir/share/help/$lang/gnome-system-monitor/
  cp -vr /usr/share/help/$lang/gnome-system-monitor/* ./AppDir/share/help/$lang/gnome-system-monitor/
done

# Turn AppDir into AppImage
quick-sharun --make-appimage
