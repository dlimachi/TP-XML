#recibir parametros
#chequear parametros
#llamar al openStreetMap api
#se genera el data.xml
#procesar con xquery

#$1 = west, $2 = south, $3 = east, $4 = north

#!/bin/bash

 # while [$4 > $2 && $3 > $1] do
 #     $1 $2 $3 $4
 # done <
curl https://www.openstreetmap.org/api/0.6/map?bbox=$1,$2,$3,$4 > o2.xml
