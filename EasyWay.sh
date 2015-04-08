#!/bin/bash
clear
#Variables
pagina="www.sep.gob"
##### REVISAR SI EL USUARIO ES ROOT
#if ["$(id -u)" = "0"]; then
#       echo "super usuario"
#fi

###### REVISAR EL DOCUMENTO SI EXISTE
archivo="Reporte.txt"
if [ -e Reporte.txt ]; then
echo "" > $archivo
else
touch Reporte.txt
fi
##### FIN DEL IF

#Mostrar los datos
echo "la fecha es: $(date) $(date >> $archivo)"
echo "$(echo '###### la ruta del Reporte' >> $archivo) ######"
echo "El directorio es $(pwd) $(pwd >> $archivo)"

##################### Solicitud de la Pagina #######
read -p "Escribe la URL a probar:" pagina
echo " "
echo " "
echo "La Pagina es $pagina $(echo $pagina >> $archivo)"
echo ""
echo ""
################# WHATWEB A LA PAGINA#######################
echo "$(echo '----------- WHATWEB ----------->>>' >> $archivo)"
echo "$(whatweb -v $pagina >> $archivo)"
echo ""
echo ""
#################### REvisar Firewall #######################
echo "$(echo '========== Revision Firewall =========' >> $archivo)"
echo "$(wafw00f $pagina >> $archivo)"
echo ""
echo ""
###################### Aplicamos el WhatWeb #################
echo "$(echo '///////////////// REPORTE DEL WHATWEB ////////////' >> $archivo)"
echo "$(uniscan -u $pagina -qweds >> $archivo)"
#echo "$(uniscan -u $pagina  >> $archivo)"
echo "$(cp /usr/share/uniscan/report/*$pagina* .)"

#echo " $(echo '******* COMANDO NSLOOKUP ********' >> $archivo)"
#echo "NSLOOKUP: $(nslookup $pagina >> $archivo)"
#echo " $(echo '******* COMANDO DIG ********' >> $archivo)"
#echo "DIG $(dig $pagina >> $archivo)"
#echo " $(echo '>>>>>>>>>> COMANDO HOST <<<<<<<<<<<<<<' >> $archivo)"
#echo "HOST $(host $pagina >> $archivo)"
