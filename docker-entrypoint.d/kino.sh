#!/bin/bash
#little fun for my website, CHO

INDEX=/usr/local/apache2/htdocs/index.html
TMP=/usr/local/apache2/htdocs/tmp.html

fortunex() {
    /usr/games/fortune -s | /usr/games/cowsay -s -f $(shuf -n 1 -e $(/usr/games/cowsay -l)) >> $TMP
    [ $? -ne 0 ] && fortunex
}

echo "<html>" > $TMP
echo "<head>" >> $TMP
echo "<meta charset=\"utf-8\">" >> $TMP
echo "</head>" >> $TMP
echo "<title>have a fortune cookie ...</title>" >> $TMP
echo "<pre>" >> $TMP
fortunex 
echo "</pre>" >> $TMP
echo "</html>" >> $TMP
cp -a $TMP $INDEX
