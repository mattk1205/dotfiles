function gci --wraps='git commit -a' --description 'alias gci=git commit -a'
  git commit -a $argv
        
end
