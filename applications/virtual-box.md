# Installation of VirtualBox

1. **Install the VirtualBox package:**

   Begin by installing VirtualBox and its guest ISO package:

   ```bash
   sudo pacman -S virtualbox virtualbox-guest-iso
   ```

2. **Choose the appropriate host modules:**

   During the installation process, you will be prompted to select the package that provides host modules. Choose:

   `virtualbox-host-modules-arch`

3. **Add your user to the `vboxusers` group:**

   To ensure proper permissions, add your user to the `vboxusers` group:

   ```bash
   sudo usermod -aG vboxusers $USER
   ```

   For the changes to take effect, you’ll need to log out and log back in.
