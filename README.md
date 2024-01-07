# My Rusty Dotfiles

These are my dotfiles for Wayland. I have a few goals for this build:

  1. Use Rust as much as possible while keeping close to a typical Unix system.
      
      No Boilerplate's video, Oxidise Your Life, put the idea in my head of 'What if my system
      could be installed with only cargo?'. It seemed like a fun idea and I like Rust enough.
      I want the command line experience to feel familiar to anyone though. So, I have made the 
      choice to not replace the core utils where Rust core util replacements exist.

  2. Opt for batteries-included tools where possible.

      Spending hours (or even days) configuring tools to get them exactly how you want them to 
      behave and look is an amazing part of using Unix systems from a learning and creative
      perspective. However, having sensible options out of box after knowing what the options
      are feels nice now. Plus, sensible options out of the box means dotfiles are more focused
      on theming your experience.

### Required Software

- alacritty
- eww
- helix
- hyprland
- nushell
- pamixer
- socat
- stow
- zellij

### How To Apply

1. Install the required software.
2. Clone this repository into $HOME/.config.
3. Run stow from $HOME/.config/.dotfiles on each directory to create the symlinks in $HOME/.config.

### How To Unapply

1. Run stow with the `-D` flag from $HOME/.config/.dotfiles on each directory to delete the
symlinks in $HOME/.config.
