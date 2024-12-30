if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting

    # vi mode
    set -U fish_key_bindings fish_vi_key_bindings

    bind \b -M insert backward-kill-word

    alias ls="exa --icons auto --color=always --group-directories-first"
    alias lt="ls -T"
    alias cat="bat --theme Coldark-Dark"
    alias grep="rg"

    fish_add_path /home/xavran/.cargo/bin
    fish_add_path /opt/cuda/bin
    fish_add_path /opt/cuda/nsight_compute
    fish_add_path /opt/cuda/nsight_systems/bin

    set CUDA_PATH /opt/cuda

    fzf --fish | source
    starship init fish | source
    enable_transience
end
