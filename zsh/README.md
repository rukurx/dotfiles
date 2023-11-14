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

* iTerm2でのカラー設定
<img width="935" alt="Colors Presets iterm2-material-design" src="https://github.com/rukurx/dotfiles/assets/13291100/84947678-e8f9-4e89-9f6d-faf85fbd0d54">
