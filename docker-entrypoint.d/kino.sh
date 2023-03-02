#!/bin/bash
#little fun for my website, CHO

fortunex() {
  INDEX=/usr/local/apache2/htdocs/index.html
  /usr/games/fortune -s | /usr/games/cowsay -s -f $(shuf -n 1 -e $(/usr/games/cowsay -l)) > $INDEX
  [ $? -ne 0 ] && fortunex
}

main() {
  fortunex
}

main "$@" || exit 1
