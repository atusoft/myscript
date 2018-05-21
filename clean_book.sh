# clean book folder 

function mvbook {
    mkdir -p $1
    find . -not \( -path ./$1 -prune \) -iname "*.$1" -exec mv {} $1/ \;
}

function unzip_file {
    find  .  -iname "*.$1"  -exec mv {} . \;
}

#clean file name
find . -iname '*%29*' -execdir bash -c 'mv -i "$1" "${1//%29/)}"' bash {} \;
find . -iname '*%28*' -execdir bash -c 'mv -i "$1" "${1//%28/(}"' bash {} \;
find . -iname '*%23*' -execdir bash -c 'mv -i "$1" "${1//%23/#}"' bash {} \;
find . -iname '*%28*' -execdir bash -c 'mv -i "$1" "${1//%28/(}"' bash {} \;
find . -iname '*%2B*' -execdir bash -c 'mv -i "$1" "${1//%2B/+}"' bash {} \;
find . -iname '*%26*' -execdir bash -c 'mv -i "$1" "${1//%26/&}"' bash {} \;
find . -iname '*%2C*' -execdir bash -c 'mv -i "$1" "${1//%2C/,}"' bash {} \;
find . -iname '*%5B*' -execdir bash -c 'mv -i "$1" "${1//%5B/[}"' bash {} \;
find . -iname '*%5D*' -execdir bash -c 'mv -i "$1" "${1//%5D/]}"' bash {} \;

#unzip
unzip_file rar
unzip_file zip
unzip_file 7z
rm  *.crdownload

#move to folder
mvbook test
mvbook azw3
mvbook mobi
mvbook azw
mvbook epub
mvbook opf
mvbook pdf
mvbook txt
mvbook doc
mvbook docx
mvbook iso

#remove other file
find . -iname '*.jpg' -exec rm {}  \;
find . -iname '*.html' -exec rm {}  \;
find . -iname '*.url' -exec rm {}  \;

#delete empty folder
sleep 10
wait
find . -empty -type d -delete
