function gbd --description 'Diff current branch against default branch'
    set -l branch (gmb); or return 1
    git diff "$branch"...HEAD
end
