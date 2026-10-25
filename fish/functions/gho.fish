function gho --description 'Open current Git path on GitHub'
    set -l root (git rev-parse --show-toplevel 2>/dev/null)
    or return 1

    set -l remote (git remote get-url (string escape --style=var -- (string length -q -- "$argv[2]"; and echo $argv[2]; or echo origin)) 2>/dev/null)
    or return 1

    set -l repo (string replace -r '^git@github\.com:' 'https://github.com/' -- $remote)
    set repo (string replace -r '^ssh://git@github\.com/' 'https://github.com/' -- $repo)
    set repo (string replace -r '\.git$' '' -- $repo)

    if not string match -q 'https://github.com/*' -- $repo
        echo 'gho: Remote is not a GitHub repository' >&2
        return 1
    end

    set -l branch (git branch --show-current)
    set -l path (string replace -- "$root" '' "$PWD")

    if set -q argv[1]
        set path "$path/$argv[1]"
    end

    set -l url "$repo"
    if test -n "$branch"
        set url "$repo/tree/$branch$path"
    end

    echo $url
    command -q wslview; and wslview $url; or xdg-open $url
end
