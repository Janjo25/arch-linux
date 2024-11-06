# Installing Docker

1. **Install Docker and Useful Optional Packages:**

   ```bash
   sudo pacman -S docker docker-buildx docker-scan
   ```

2. **Enable the Socket at Boot:**
   This means the socket will be available on boot, but it won’t start Docker until you actually try to use it:

   ```bash
   sudo systemctl start docker.socket
   sudo systemctl enable docker.socket
   ```

3. **Verify Docker Status:**

   ```bash
   docker info
   ```

4. **Run Docker CLI as a Non-Root User:**
   To be able to run the Docker CLI command as a non-root user, add your user to the Docker group:

   ```bash
   sudo usermod -aG docker $USER
   ```
