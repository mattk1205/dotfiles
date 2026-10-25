function nb --wraps='git switch -c "(whoami)-(date +%s)"' --description 'alias nb=git switch -c "(whoami)-(date +%s)"'
  git switch -c "(whoami)-(date +%s)" $argv
        
end
