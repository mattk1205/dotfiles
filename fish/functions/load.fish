function load --description 'Show normalized CPU load'
    set -l cores (nproc)
    awk -v cores="$cores" '{printf "1m: %.2f  5m: %.2f  15m: %.2f\n", $1/cores, $2/cores, $3/cores}' /proc/loadavg
end
