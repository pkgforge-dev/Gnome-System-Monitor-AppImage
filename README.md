# Gnome-System-Monitor-AppImage 🐧

[![GitHub Downloads](https://img.shields.io/github/downloads/pkgforge-dev/Gnome-System-Monitor-AppImage/total?logo=github&label=GitHub%20Downloads)](https://github.com/pkgforge-dev/Gnome-System-Monitor-AppImage/releases/latest)
[![CI Build Status](https://github.com//pkgforge-dev/Gnome-System-Monitor-AppImage/actions/workflows/appimage.yml/badge.svg)](https://github.com/pkgforge-dev/Gnome-System-Monitor-AppImage/releases/latest)

<p align="center">
  <img src="https://gitlab.gnome.org/GNOME/gnome-system-monitor/-/raw/main/data/icons/public/hicolor/scalable/apps/org.gnome.SystemMonitor.svg?ref_type=heads" width="128" />
</p>

* [Latest Stable Release](https://github.com/pkgforge-dev/Gnome-System-Monitor-AppImage/releases/latest)

---

AppImage made using [sharun](https://github.com/VHSgunzo/sharun), which makes it extremely easy to turn any binary into a portable package without using containers or similar tricks. 

**This AppImage bundles everything and should work on any linux distro, even on musl based ones.**

It is possible that this appimage may fail to work with appimagelauncher, I recommend these alternatives instead: 

* [AM](https://github.com/ivan-hc/AM) `am -i gnome-system-monitor` or `appman -i gnome-system-monitor`

* [dbin](https://github.com/xplshn/dbin) `dbin install gnome-system-monitor.appimage`

* [soar](https://github.com/pkgforge/soar) `soar install gnome-system-monitor`

This appimage works without fuse2 as it can use fuse3 instead, it can also work without fuse at all thanks to the [uruntime](https://github.com/VHSgunzo/uruntime)

<details>
  <summary><b><i>raison d'être</i></b></summary>
    <img src="https://github.com/user-attachments/assets/d40067a6-37d2-4784-927c-2c7f7cc6104b" alt="Inspiration Image">
  </a>
</details>

More at: [AnyLinux-AppImages](https://pkgforge-dev.github.io/Anylinux-AppImages/)

---

## Known quirk

- Help page only works if `gnome-help` or other similar `.page` viewer is installed on the host's system.  
Bundling the help page viewer in the AppImage would make it work everywhere, but it's both bad for the file size and [security](https://blogs.gnome.org/mcatanzaro/2025/04/15/dangerous-arbitrary-file-read-vulnerability-in-yelp-cve-2025-3155/), hence why we don't do that.
