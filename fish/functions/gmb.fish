function gmb --description 'Show default Git branch'
    set -l branch (git symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null)
    or return 1
    string replace 'origin/' '' -- $branch
end
