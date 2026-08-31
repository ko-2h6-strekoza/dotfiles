# dotfiles

fish + neovim の設定をGNU Stowで管理するリポジトリ。WSL2 Ubuntuを再インストールしたときに、このリポジトリを1回ブートストラップすれば環境が再現できることを目的にしている。

## 構成

```
fish/.config/fish/   -> ~/.config/fish/     にstow
nvim/.config/nvim/    -> ~/.config/nvim/     にstow
scripts/               各種インストールスクリプト(bootstrap.shから呼ばれる)
bootstrap.sh           上記すべてを順番に実行するエントリポイント
```

Neovimは`apt`ではなく[公式GitHubリリース](https://github.com/neovim/neovim/releases)のtarballを`/opt/nvim`に展開する(`fish/.config/fish/config.fish`が`/opt/nvim`をPATHに追加済み)。これによりディストロのaptが古いバージョンのままでも最新の安定版Neovimを使える。

## 前提条件

- WSL2 + Ubuntu(新規インストール直後を想定)
- このリポジトリが `C:\Users\strekoza\dev\dotfiles` にあり、WSL側から `/mnt/c/Users/strekoza/dev/dotfiles` として見えること

## WSLの再インストール手順(Windows PowerShellで実行・破壊的操作)

**注意: `wsl --unregister` は指定したディストロ内のファイルを完全に削除する。** 実行前にWSL内に残したいファイルがないか確認すること。

```powershell
# 既存のUbuntuを完全に削除
wsl --unregister Ubuntu

# Ubuntuを再インストール
wsl --install -d Ubuntu
```

初回起動時にUNIXユーザー名/パスワードの設定を求められる。

## 再インストール後のセットアップ

新しいUbuntuを開いて以下を実行する。

```bash
cd /mnt/c/Users/strekoza/dev/dotfiles
./bootstrap.sh
```

`bootstrap.sh` は以下を順番に行う。

1. `apt`パッケージ導入(build-essential, curl, fish, stow, ripgrep, fd-find, fzf, python3, git など)
2. Node.js LTSをNodeSource経由で導入(mason経由のLSPサーバー用)
3. Neovim最新安定版を `/opt/nvim` に展開
4. `eza`(公式apt repo)導入
5. `zoxide`(公式インストールスクリプト)導入
6. `win32yank.exe` を `~/.local/bin` に導入(WSLはbinfmt interopでWindows実行ファイルをそのまま実行できるため、Windows側への別途インストールは不要)
7. `stow` で `~/.config/fish`, `~/.config/nvim` をこのリポジトリにリンク(既存ファイルがあれば `*.bak.<timestamp>` に退避)
8. `fisher` を導入し `fish_plugins` に書かれたプラグイン(fisher本体, tide, fzf.fish)を導入
9. `nvim --headless "+Lazy! sync" +qa` でプラグインを事前取得

## 手動で行う必要がある後続作業

- `chsh -s "$(which fish)"` でログインシェルをfishに変更(パスワード入力が必要なため自動実行していない)。実行後、ターミナルを開き直す
- `nvim` を一度開いて待つ。mason-lspconfigの `ensure_installed` (`lua_ls`, `ts_ls`, `pyright`, `jsonls`, `yamlls`) が自動でインストールされる(非同期のため`bootstrap.sh`内では待機していない)
- クリップボード連携の確認: nvimで1行ヤンクしてWindows側にペーストできるか確認

## Neovimの補完エンジンについて

`nvim-cmp` ではなく [`blink.cmp`](https://github.com/saghen/blink.cmp) を使用している。LSPの capabilities は `lua/plugins/lsp.lua` 内で `vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })` として全LSPサーバーに共通適用している。

## lazy-lock.json について

このリポジトリには `lazy-lock.json` を含めていない(`wsl_bak`にあった旧ロックファイルは `nvim-cmp` など今回削除したプラグインを含んでおり、そのまま使うと矛盾するため)。初回の `bootstrap.sh` 実行時にlazy.nvimが新しいロックファイルを生成する。バージョン固定を再現したい場合は、生成された `~/.config/nvim/lazy-lock.json`(実体は `nvim/.config/nvim/lazy-lock.json` へのシンボリックリンク先)をこのリポジトリにコミットすること。
