if status is-interactive
    # Commands to run in interactive sessions can go here
end

# cd > ls
function cd
  builtin cd $argv
    ls -a --group-directories-first
end

# ls command
alias l="ls -l --group-directories-first"
alias ll="ls -la --group-directories-first"

# for windows explorer
alias open="explorer.exe"
alias e="explorer.exe ."

# tmux
alias ide="sh ~/.scripts/ide.sh"

# neovim
alias vi="nvim"
alias vim="nvim"

# cd command
alias cdc="cd /mnt/c"
alias cdh="cd /mnt/c/Users/strekoza"
alias cdw="cd /mnt/c/workspace"

# bobthefish
set -g theme_color_scheme gruvbox
set -g theme_display_git_default_branch yes
set -g fish_prompt_pwd_dir_length 0
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '
set -g theme_display_date no
set -g theme_display_cmd_duration no
