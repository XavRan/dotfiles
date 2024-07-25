if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting

    # vi mode
    set -U fish_key_bindings fish_vi_key_bindings

    bind \b -M insert backward-kill-word

    pfetch
    alias ls="exa --icons auto --color=always --group-directories-first"
    alias lt="ls -T"
    alias cat="bat --theme Coldark-Dark"
    alias grep="rg"

    fish_add_path /home/xavran/.cargo/bin

    starship init fish | source
    enable_transience
end
