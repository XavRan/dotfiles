function fish_prompt
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color blue
    echo -n -s ' 󰈺 '
end
