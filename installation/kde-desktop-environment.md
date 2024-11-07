# KDE Desktop Environment Installation Guide

## 1. Minimal Installation of Plasma

To avoid installing unnecessary packages, we will perform a minimal installation of Plasma.

```bash
sudo pacman -S plasma-desktop bluedevil bluez-obex pulseaudio-bluetooth kscreen plasma-nm plasma-pa
```

## 2. Installing KDE Applications

We install KDE applications grouped by functionality:

### 2.1 Graphics Applications

```bash
sudo pacman -S gwenview kolourpaint spectacle
```

### 2.2 Multimedia Applications

```bash
sudo pacman -S dragon elisa
```

### 2.3 Network Applications

```bash
sudo pacman -S kget
```

### 2.4 Development Tools

```bash
sudo pacman -S dolphin-plugins
```

### 2.5 System Tools

```bash
sudo pacman -S dolphin ffmpegthumbs kdegraphics-thumbnailers kio-admin konsole khelpcenter
```

### 2.6 Utility Tools

```bash
sudo pacman -S ark p7zip unrar filelight kcalc kcharselect kfind plocate
```

## 3. Using a Display Manager

A display manager allows graphical logins and manages user sessions.

### 3.1 Installing SDDM

The preferred display manager for KDE Plasma is **SDDM (Simple Desktop Display Manager)**.

```bash
sudo pacman -S sddm sddm-kcm
```

### 3.2 Enabling SDDM

To ensure SDDM starts on boot, we need to enable its service.

```bash
sudo systemctl enable sddm.service
```
