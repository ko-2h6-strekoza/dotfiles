set fish_greeting

fish_add_path --path --append /opt/nvim/bin
fish_add_path --path $HOME/.local/bin

if status is-interactive
    # zoxide (smarter cd)
    zoxide init fish | source

    # cd > eza
    function cd
        builtin cd $argv
        and eza -la --group-directories-first --icons
    end

    # ls
    alias l="eza -l --group-directories-first --icons"
    alias ll="eza -la --group-directories-first --icons"

    # for windows explorer
    alias open="explorer.exe"
    alias e="explorer.exe ."

    # neovim
    alias vi="nvim"
    alias vim="nvim"

    alias cdc="cd /mnt/c"
    alias cdh="cd /mnt/c/Users/strekoza"
end
