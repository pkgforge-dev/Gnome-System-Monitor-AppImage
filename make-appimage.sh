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
export STARTUPWMCLASS=gnome-system-monitor
export GTK_CLASS_FIX=1

# Trace and deploy all files and directories needed for the application (including binaries, libraries and others)
quick-sharun /usr/bin/gnome-system-monitor \
             /usr/lib/gnome-system-monitor/* \
             /usr/share/help/*/gnome-system-monitor

## Add missing Processes and Resources icon
cp -v /usr/share/icons/hicolor/symbolic/apps/processes-symbolic.svg ./AppDir/share/icons/hicolor/symbolic/apps/processes-symbolic.svg
cp -v /usr/share/icons/hicolor/symbolic/apps/resources-symbolic.svg ./AppDir/share/icons/hicolor/symbolic/apps/resources-symbolic.svg

# Turn AppDir into AppImage
quick-sharun --make-appimage
