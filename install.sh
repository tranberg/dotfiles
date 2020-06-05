# Install script for dotfiles. Places symlinks in home folder to track updates

echo "Installing dotfiles"

# Full path to dotfiles
path=$(pwd)

# Go to home
cd ~/

# Create symlinks to dotfiles
for file in .vimrc .tmux.conf
do
    if [ -f $file ]; then
        rm $file
    fi
    cp -vs $path/$file .
done

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create symlink to plugin file
cd ~/.vim/
cp -vs $path/plugins.vim .
