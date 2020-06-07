#$1 = west, $2 = south, $3 = east, $4 = north

#!/bin/bash
if [ "$1" == "0" ] || [ "$2" == "0" ] || [ "$3" == "0" ] || [ "$4" == "0" ]; then
  java net.sf.saxon.Query errorsEmpty.xq > errorEmpty.xml
  touch output.csv
elif [ 1 -eq $(echo "($4 - $2) < 0" | bc) ] || [ 1 -eq $(echo "($3 - $1) < 0" | bc) ]; then
    java net.sf.saxon.Query errors.xq > errorWrongParameter.xml
    touch output.csv
else
  curl https://www.openstreetmap.org/api/0.6/map?bbox=$1,$2,$3,$4 > data.xml
  java net.sf.saxon.Query query_map.xq > intermediate.xml
  java net.sf.saxon.Transform -s:intermediate.xml -xsl:convert_csv.xsl -o:output.csv
fi
