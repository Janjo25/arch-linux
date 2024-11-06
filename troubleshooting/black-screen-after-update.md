# Fixing Black Screen After Updating NVIDIA Drivers

If after updating the NVIDIA drivers and rebooting you encounter a black screen, you need to instruct the NVIDIA driver
to provide its own framebuffer.

1. **Edit the GRUB Configuration File:**

   ```bash
   sudo nano /etc/default/grub
   ```

2. **Locate `GRUB_CMDLINE_LINUX_DEFAULT` and Add `nvidia_drm.fbdev=1`:**
   Find the line that begins with `GRUB_CMDLINE_LINUX_DEFAULT` and modify it as follows:

   ```bash
   GRUB_CMDLINE_LINUX_DEFAULT="quiet nvidia_drm.modeset=1 nvidia_drm.fbdev=1"
   ```

3. **Update GRUB:**
   Save the file and update GRUB:

   ```bash
   sudo grub-mkconfig -o /boot/grub/grub.cfg
   ```
