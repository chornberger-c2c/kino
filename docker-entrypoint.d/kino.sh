#!/bin/bash
#little fun for my website, CHO

fortunex() {
  /usr/games/fortune -s | /usr/games/cowsay -s -f $(shuf -n 1 -e $(/usr/games/cowsay -l)) >> "$INDEX"
  [ $? -ne 0 ] && fortunex
}

html_front() {
  INDEX=/usr/local/apache2/htdocs/index.html
  cat <<EOF > "$INDEX"
<html>
<head>
<meta charset="utf-8">
</head>
<title>Quote</title>
<pre>
EOF
}

html_end() {
  cat <<EOF >> "$INDEX"
</pre>
</html>
EOF
}

main() {
  html_front
  fortunex
  html_end
}

main "$@" || exit 1
