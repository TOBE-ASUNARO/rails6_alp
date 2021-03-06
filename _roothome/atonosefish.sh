#!/usr/bin/fish

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish && \
fisher install jethrokuan/z && \
fisher install 0rax/fish-bd && \
fisher install jethrokuan/fzf && \
fisher install ryotako/fish-global-abbreviation

gabbr l exa && cd && cat gabbrdata >> ~/.config/fish/.gabbr.config && gabbr -r

