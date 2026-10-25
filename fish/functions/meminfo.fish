function meminfo --description 'Show memory usage'
    free -m | awk '/^Mem:/ {
        used = $2 - $7
        printf "memory: %dMB / %dMB (%.0f%%)\n", used, $2, used*100/$2
    }'
end
