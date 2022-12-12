if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-login
    if test -z "$DISPLAY" -a "$(tty)" = /dev/tty1
        exec startx -- -keeptty
    end
end