# dotfiles

dotfileの設定をGNU Stowで管理するリポジトリ。1回ブートストラップすれば環境が再現できることを目的にしている。

## 構成

```
fish/.config/fish/   -> ~/.config/fish/   にstow
nvim/.config/nvim/   -> ~/.config/nvim/   にstow
tmux/.config/tmux/   -> ~/.config/tmux/   にstow
scripts/              各種インストールスクリプト(bootstrap.shから呼ばれる)
bootstrap.sh          上記すべてを順番に実行するエントリポイント
```

Neovimは`apt`ではなく[公式GitHubリリース](https://github.com/neovim/neovim/releases)のtarballを`/opt/nvim`に展開する(`fish/.config/fish/config.fish`が`/opt/nvim`をPATHに追加済み)。これによりディストロのaptが古いバージョンのままでも最新の安定版Neovimを使える。

## セットアップ

WSL2 + Ubuntu上でこのリポジトリをcloneし、以下を実行する。

```bash
cd dotfiles
./bootstrap.sh
```

`bootstrap.sh` は以下を順番に行う。

1. `apt`パッケージ導入(build-essential, curl, fish, stow, tmux, ripgrep, fd-find, fzf, python3, git など)
2. Node.js LTSをNodeSource経由で導入(mason経由のLSPサーバー用)
3. Neovim最新安定版を `/opt/nvim` に展開
4. `eza`(公式apt repo)導入
5. `zoxide`(公式インストールスクリプト)導入
6. `win32yank.exe` を `~/.local/bin` に導入(WSLはbinfmt interopでWindows実行ファイルをそのまま実行できるため、Windows側への別途インストールは不要)
7. `stow` で `~/.config/fish`, `~/.config/nvim`, `~/.config/tmux` をこのリポジトリにリンク(既存ファイルがあれば `*.bak.<timestamp>` に退避)
8. `fisher` を導入し `fish_plugins` に書かれたプラグイン(fisher本体, tide, fzf.fish)を導入
9. `tpm`(tmux plugin manager)を `~/.config/tmux/plugins/tpm` に導入し、`tmux.conf` に書かれたプラグインを導入
10. `nvim --headless "+Lazy! sync" +qa` でプラグインを事前取得

### 手動で行う必要がある後続作業

- `chsh -s "$(which fish)"` でログインシェルをfishに変更(パスワード入力が必要なため自動実行していない)。実行後、ターミナルを開き直す
- `nvim` を一度開いて待つ。mason-lspconfigの `ensure_installed` (`lua_ls`, `ts_ls`, `pyright`, `jsonls`, `yamlls`) が自動でインストールされる(非同期のため`bootstrap.sh`内では待機していない)
- クリップボード連携の確認: nvimで1行ヤンクしてWindows側にペーストできるか確認

## lazy-lock.json について

このリポジトリには `lazy-lock.json` を含めていない。初回の `bootstrap.sh` 実行時にlazy.nvimが新しいロックファイルを生成する。バージョン固定を再現したい場合は、生成された `~/.config/nvim/lazy-lock.json`(実体は `nvim/.config/nvim/lazy-lock.json` へのシンボリックリンク先)をこのリポジトリにコミットすること。
