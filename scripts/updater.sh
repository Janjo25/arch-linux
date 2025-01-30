#!/bin/zsh

# Update the system.
echo "🔄 Starting system update..."
sudo pacman -Syu | tee /tmp/pacman-update.log

# Check if the update mentions NVIDIA.
if grep -qi "nvidia" /tmp/pacman-update.log; then
    echo "⚠️ NVIDIA driver update detected!"
    echo "🔧 Running 'sudo mkinitcpio -P' to regenerate the initramfs..."
    sudo mkinitcpio -P
else
    echo "✅ No NVIDIA driver updates detected. Proceeding..."
fi

# Update Rust.
echo "🦀 Updating Rust toolchain..."
rustup update

echo "✅ System update complete!"
