curl -fLo /usr/local/bin/nvim.appimage --create-dirs https://github.com/neovim/neovim/releases/download/v0.3.8/nvim.appimage # Download neovim
chmod u+x /usr/local/bin/nvim.appimage # Make it executable
rm -f ~/.config/nvim/init.vim # Delete config if exists
mkdir -p ~/.config/nvim/ # Make config directory if doesn't exist
ln -s ./nvim/init.vim ~/.config/nvim/init.vim # Link this config to neovim config
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
