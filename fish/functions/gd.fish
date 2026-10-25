function gd --wraps=git\ diff\ \':!\*lock\' --description alias\ gd=git\ diff\ \':!\*lock\'
  git diff ':!*lock' $argv
        
end
