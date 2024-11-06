# Arch Linux Installation Guide

## 1. Set the Console Keyboard Layout

```bash
loadkeys la-latin1
```

## 2. Verify Boot Mode

Check the UEFI bitness:

```bash
cat /sys/firmware/efi/fw_platform_size
```

If the command returns `64`, then the system is booted in UEFI mode with a 64-bit x64 UEFI, which is good.

## 3. Verify Internet Connection

Check connectivity with:

```bash
ping archlinux.org
```

## 4. Check System Clock Synchronization

```bash
timedatectl
```

## 5. Identify Devices

```bash
lsblk
```

## 6. Check Logical Sector Size

Check that NVMe drives and Advanced Format hard disk drives are using the optimal logical sector size before
partitioning:

```bash
cat /sys/block/<drive>/queue/logical_block_size
cat /sys/block/<drive>/queue/physical_block_size
```

This will show if both sizes match. Typically, they should be 512 or 4096 bytes. If they match, you're good to go!

## 7. Partitioning

Use a partitioning tool to modify partition tables:

```bash
cfdisk /dev/<drive>
```

## 8. Format the Partitions

Once the partitions have been created, each newly created partition must be formatted with an appropriate file system:

### Root Partition:

```bash
mkfs.ext4 /dev/<root_partition>
```

### Swap Partition:

```bash
mkswap /dev/<swap_partition>
```

### EFI Partition:

```bash
mkfs.fat -F 32 /dev/<efi_system_partition>
```

## 9. Mount the File Systems

Mount the root volume to `/mnt`:

```bash
mount /dev/<root_partition> /mnt
```

Create any remaining mount points under `/mnt` (such as `/mnt/boot` for `/boot`) and mount the volumes in their
corresponding hierarchical order. **Tip:** Run `mount` with the `--mkdir` option to create the specified mount point.
Alternatively, create it using `mkdir` beforehand.

### Mount the EFI System Partition:

```bash
mount --mkdir /dev/<efi_system_partition> /mnt/boot
```

### Mount the Swap Volume:

```bash
swapon /dev/<swap_partition>
```

## 10. Installation

### Install Essential Packages

Use the `pacstrap` script to install the base package, Linux kernel, and firmware for common hardware:

```bash
pacstrap -K /mnt base linux linux-firmware
```

Add additional essential packages as needed:

```bash
pacstrap -K /mnt base linux linux-firmware intel-ucode e2fsprogs networkmanager nano man-db man-pages texinfo grub dosfstools efibootmgr os-prober
```

## 11. Configure the System

### Generate an fstab File

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

Check if everything is well:

```bash
cat /mnt/etc/fstab
```

### Change Root into the New System

```bash
arch-chroot /mnt
```

### Configure the Time Zone

```bash
ln -sf /usr/share/zoneinfo/America/Guatemala /etc/localtime
```

### Generate /etc/adjtime

```bash
hwclock --systohc
```

## 12. Localization

### Edit /etc/locale.gen

Uncomment the needed locales:

```bash
nano /etc/locale.gen
```

### Generate the Locales

```bash
locale-gen
```

### Create the Locale Configuration

```bash
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=la-latin1" > /etc/vconsole.conf
```

## 13. Network Configuration

### Create the Hostname File

```bash
echo <name> > /etc/hostname
```

### Check Internet Connection

```bash
ping archlinux.org
```

### Check if NetworkManager is Enabled at Boot

```bash
systemctl is-enabled NetworkManager
```

If not, enable it:

```bash
systemctl enable NetworkManager
```

### Set Your Password

```bash
passwd
```
