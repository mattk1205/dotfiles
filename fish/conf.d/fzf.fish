fzf --fish | source
set -gx FZF_DEFAULT_OPTS "\
--height=60% \
--layout=reverse \
--border=rounded \
--info=inline \
--color=bg+:#44475A,bg:#282A36,spinner:#FF79C6,hl:#BD93F9 \
--color=fg:#F8F8F2,header:#8BE9FD,info:#FFB86C,pointer:#FF79C6 \
--color=marker:#50FA7B,fg+:#F8F8F2,prompt:#BD93F9,hl+:#FF79C6"
