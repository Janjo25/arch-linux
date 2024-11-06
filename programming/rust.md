# Installing Rust as a Developer

1. **Install Rustup:**
   Install `rustup`, as it is recommended for programming in Rust. If you only use Rust for running or installing
   software made with Rust, installing Rust directly may suffice, but `rustup` provides better flexibility:

   ```bash
   sudo pacman -S rustup
   ```

   Installing the GNU Debugger (`gdb`) and LLDB Debugger (`lldb`) is not necessary if using JetBrains IDE, as they are
   already bundled with the IDE.

2. **Install the Toolchain Manually:**
   The `rustup` package does not install a toolchain by default, so you need to install the toolchain manually:

   ```bash
   rustup default stable
   ```

3. **Test the Installation:**
   To check if everything was installed correctly, run:

   ```bash
   rustc -V
   ```

   It’s important to note that `rustup` does not automatically update the provided toolchains. If you wish to use the
   latest releases of Rust, crates, and other relevant packages, you may occasionally want to update your toolchains
   with:

   ```bash
   rustup update
   ```

   Additionally, Rust does not do its own linking, so you’ll need to have a linker installed. You can use `gcc` for this
   purpose.
