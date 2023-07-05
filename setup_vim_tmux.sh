#git config --global user.email "guanying2018@gmail.com"
#git config --global user.name "guanyingc"

tar -zxvf vim_plugins.tgz 
for f in plugins/*.tgz; do
    tar -zxvf $f -C .vim/bundle
done
#cp .vim ~/
#cp vimrc ~/.vimrc
#cp tmux.conf ~/.tmux.conf
#tmux source ~/.tmux.conf
#
#cp scripts/myhttp.py ~/.myhttp.py
