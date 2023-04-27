#!/bin/bash
#little fun for my website, CHO

write_to_index() {
  INDEX=/usr/local/apache2/htdocs/index.html
  tee -a "$INDEX"
}

fortunex() {
  /usr/games/fortune -s | /usr/games/cowsay -s -f $(shuf -n 1 -e $(/usr/games/cowsay -l))
  [ $? -ne 0 ] && fortunex
}

html_front() {
  cat <<EOF
<html>
<head>
<meta charset="utf-8">
</head>
<title>Quote</title>
<pre>
EOF
}

html_end() {
  cat <<EOF
</pre>
</html>
EOF
}

main() {
  html_front | write_to_index
  fortunex | write_to_index
  html_end | write_to_index
}

main "$@" || exit 1
