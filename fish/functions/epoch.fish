function epoch --description 'Convert Unix timestamp to date'
    if test (count $argv) -eq 0
        date '+%B %d, %Y %-I:%M:%S %p %Z'
    else
        date -d "@$argv[1]" '+%B %d, %Y %-I:%M:%S %p %Z'
    end
end
