#/usr/bin/bash

#get the zip file
zip=$1

#get the author
author=$2

#name of the file without extensions
name=${zip::-4}

#unzip the zip into a folder
unzip -d articulos/$name $zip

#convert the html to markdown and move it to _posts folder
html2md -i articulos/$name/*.html -o _posts/$name.md

#add the title and author
{ echo "---"; echo "title: " $name; echo "author: " $author; echo "layout: post"; echo "---"; cat _posts/$name.md; } > _posts/$name.md.new

rm _posts/$name.md

curt=$(date '+%F')

mv _posts/$name.md.new _posts/$curt-$name.md

rm $zip