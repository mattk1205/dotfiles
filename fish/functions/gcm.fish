function gcm --description 'Switch to default branch and pull'
    set -l branch (gmb); or return 1
    git switch $branch; and git pull
end
