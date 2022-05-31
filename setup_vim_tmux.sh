git config --global user.email "guanying2018@gmail.com"
git config --global user.name "guanyingc"
tar -zxvf vim_plugins.tgz
mv .vim ~/
cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf
