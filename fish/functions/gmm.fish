function gmm --description 'Merge default branch into current branch'
    set -l branch (gmb); or return 1
    git merge $branch
end
