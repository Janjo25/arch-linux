# Adding a New User with Sudo Access

1. **Create a New User:**

   ```bash
   useradd -m -G wheel -s /bin/bash <username>
   ```

2. **Set a Password for the User:**

   ```bash
   passwd <username>
   ```

3. **Install the `sudo` Package:**

   ```bash
   sudo pacman -S sudo
   ```

4. **Ensure the `wheel` Group Has Sudo Permissions:**

   Edit the `/etc/sudoers` file using `visudo`:
   ```bash
   EDITOR=nano visudo
   ```

   Look for the line that says:

   ```bash
   # %wheel ALL=(ALL:ALL) ALL
   ```

   Remove the comment (the `#`) to enable sudo access for the `wheel` group.
