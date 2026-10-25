function getRecentDownload --description 'Move newest Windows downloads to current directory'
    argparse 'n=' 'help' -- $argv
    or return 2

    if set -q _flag_help
        echo 'Usage: getRecentDownload [-n COUNT]'
        return 0
    end

    set -l count 1
    if set -q _flag_n
        set count $_flag_n
    end

    if not string match -qr '^[1-9][0-9]*$' -- "$count"
        echo 'Count must be a positive integer' >&2
        return 2
    end

    set -l downloads (wslpath (cmd.exe /c 'echo %USERPROFILE%\Downloads' 2>/dev/null | string trim))
    if not test -d "$downloads"
        echo 'Windows Downloads folder not found' >&2
        return 1
    end

    set -l files (command find "$downloads" -maxdepth 1 -type f -printf '%T@ %p\0' |
        sort -zrn |
        head -z -n "$count" |
        string split0)

    if test (count $files) -eq 0
        echo 'No files found'
        return 1
    end

    for entry in $files
        set -l file (string replace -r '^[^ ]+ ' '' -- "$entry")
        if test -e "./"(path basename "$file")
            echo "Destination already exists: "(path basename "$file") >&2
            return 1
        end
    end

    for entry in $files
        set -l file (string replace -r '^[^ ]+ ' '' -- "$entry")
        mv -n -- "$file" .
        or return 1
        echo "Moved: "(path basename "$file")
    end
end
