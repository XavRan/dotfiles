if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    set -U fish_key_bindings fish_vi_key_bindings

    source ~/.config/fish/keys.fish

    set -U fish_user_paths /usr/local/bin $fish_user_paths
    set -U fish_user_paths ~/.local/share/bin $fish_user_paths
    set -U fish_user_paths ~/.config/emacs/bin $fish_user_paths

    set -x EDITOR /usr/bin/vim

    bind -M insert \ef accept-autosuggestion

    alias ls lsd
    alias cat bat
    alias find fd

    wal -Rq
end
