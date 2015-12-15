# Install script for dotfiles. Places symlinks in home folder to track updates

echo "Installing dotfiles"

# Full path to dotfiles
path=$(pwd)

# Go to home
cd ~/

# Create symlinks to dotfiles
for file in .vimrc .tmux.conf
do
    rm $file
    cp -vs $path/$file .
done

# Install gruvbox color scheme for vim
echo "Installing gruvbox color scheme for vim"
mkdir -p .vim/colors
wget -q https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -O .vim/colors/gruvbox.vim
echo "Done"
