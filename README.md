#configs
.vimrc file for vim configuration
# from ~
ln -s ~/projects/configs/.vimrc .vimrc

iterm2:
solarized dark theme

fish configuration:
config.fish -> ~/.config/fish/ 
# from ~/.config/fish/
ln -s ~/projects/configs/config.fish config.fish
fish_prompt.fish -> ~/.config/fish/functions/
# from ~/.config/fish/functions
ln -s ~/projects/configs/fish_prompt.fish fish_prompt.fish

#UBUNTU
https://github.com/mavnn/mintty-colors-solarized
cat .minttyrc.dark >> .minttyrc


ln -s ~/projects/configs/.bashrc ~/.bashrc
