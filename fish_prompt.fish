function fish_prompt
    set_color $fish_color_operator
    echo -n (prompt_pwd)
	
	set __git_cb ":"(set_color cyan)(git branch ^/dev/null | grep \* | sed 's/* //')(set_color normal)""
	echo -n $__git_cb
	set_color green
    echo -n ' → '
	set_color normal
end
