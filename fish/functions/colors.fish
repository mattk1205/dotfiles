function colors --description 'Display 256 terminal colors'
    for i in (seq 0 255)
        printf '\e[38;5;%dmcolor %d\n' $i $i
    end
    printf '\e[0m'
end
