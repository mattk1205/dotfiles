function interfaces --description 'Show network interfaces'
    ip -o -4 addr show | awk '{print $2 ": " $4}'
end
