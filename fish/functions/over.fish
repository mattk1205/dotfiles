function over --description 'Find lines exceeding column width'
    set -l width 80
    if set -q argv[1]
        set width $argv[1]
    end

    expand | awk -v c="$width" 'length($0) > c {
        printf "%4d %s\n", NR, $0
    }'
end
