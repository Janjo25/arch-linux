# Installation of the Z Shell and Starship

1. **First, download Zsh:**

   ```bash
   sudo pacman -S zsh
   ```
2. **Change the shell you are using:**

   ```bash
   chsh -s $(which zsh)
   ```

   You’ll need to log out and back in for the change to take effect.

3. **Copy the .zshrc file into your home directory.** This is a configuration file for the Zsh shell, where you can set
   up your personal preferences and customize how your terminal behaves. Once you’ve copied it, you’ll need to install
   the plugins specified in the file. To do this, clone the repository into a directory called `.zsh`:

   ```bash
   git clone <plugin_repository_url> ~/.zsh/plugins/<plugin_name>
   ```

   To update the plugins, simply execute the update script. It will pull any changes if there are any.

4. **Install Starship, a Zsh theme that includes many useful tools:**

   ```bash
   sudo pacman -S starship ttf-jetbrains-mono-nerd
   ```

   Add the following line to the end of your `.zshrc` file:

   ```bash
   eval "$(starship init zsh)"
   ```

5. **Create a configuration file to customize Starship:**

   ```bash
   mkdir -p ~/.config && touch ~/.config/starship.toml
   ```

   The Starship documentation explains everything you can do in this file to customize it.
