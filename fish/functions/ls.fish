function ls --wraps='eza --icons=auto --group-directories-first' --description 'alias ls=eza --icons=auto --group-directories-first'
  eza --icons=auto --group-directories-first $argv
        
end
