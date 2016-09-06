# Show installed packages
apm list -ib

# Create installed package file
apm list -ib > packages.txt

# Install packages
apm install --packages-file packages.txt

