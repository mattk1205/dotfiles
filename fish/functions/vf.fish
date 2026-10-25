function vf --description 'Fuzzy find and edit a file in Vim'
    set -l file (
        fd --type f --exclude .git |
        fzf --bind 'change:reload:if [[ {q} == .* ]]; then fd --type f --hidden --exclude .git; else fd --type f --exclude .git; fi' \
            --preview 'bat --color=always --style=numbers --line-range=:300 {}' \
            --preview-window 'right:60%:wrap'
    )

    if test -n "$file"
        vim -- "$file"
    end
end
