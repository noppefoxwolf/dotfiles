# Dotfiles

個人的な開発環境設定ファイル集

## 含まれるファイル

- `.zshrc` - zshシェルの設定
- `.vimrc` - Vimエディタの設定
- `.tmux.conf` - tmux端末マルチプレクサの設定
- `.git-prompt.sh` - Gitプロンプト設定

## セットアップ

各設定ファイルをホームディレクトリにシンボリックリンクとして配置してください。

```bash
ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
ln -sf $(pwd)/.git-prompt.sh ~/.git-prompt.sh
```

設定を有効にするため、シェルを再起動してください。

```bash
source ~/.zshrc
```