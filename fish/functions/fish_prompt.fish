function fish_prompt
    set -l last_status $status

    set_color cyan
    date '+%H:%M'

    if test $last_status -ne 0
        set_color red
        printf ' (%s)' $last_status
    end

    if test (id -u) -eq 0
        set_color red
    else
        set_color normal
    end
    printf ' %s' $USER

    set_color brblack
    printf ' - '

    set_color green
    printf '%s' (prompt_pwd)

    set -l branch (command git branch --show-current 2>/dev/null)
    if test -n "$branch"
        set_color magenta
        printf ' [%s]' $branch
    end

    printf '\n'
    set_color brmagenta
    printf '❯ '
    set_color normal
end
