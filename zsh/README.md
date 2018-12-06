# zsh

* デフォルトのシェルをzshにする
```
$ echo /usr/local/bin/zsh | sudo tee -a /etc/shells
$ chsh -s /usr/local/bin/zsh
$ $SHELL --version
```

* シンボリックリンクをはる
```
$ ln -s ~/workspace/rukurx/dotfiles/zsh/.zshrc ~/.zshrc
```
