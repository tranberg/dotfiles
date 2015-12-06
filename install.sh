# Install script for dotfiles. Places symlinks in home folder to track updates

# Full path to dotfiles
path=$(pwd)

# Go to home
cd ~/

# Create symlinks to dotfiles
for file in .vimrc .tmux.conf
do
    cp -vs $path/$file .
done
