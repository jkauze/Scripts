#/bin/bash
# JK - MAC
# Recursos: tcpserver (ucspi-tcp https://cr.yp.to/ucspi-tcp/tcpserver.html) para gestionar multiples conexiones tcp (Motivo: nc solo limitaba a 1      conexion a la vez)
# Funcion:
# Convierte un puerto especifico a la espera de conexiones tcp (clientes).
# Los clientes conectados podran ver los mensajes anteriores y sus fechas ( >> Mensaje 1 - [dec 13 1994] ). no hay manera de determinar quien lo       escribio
# Los clientes conectados pueden optar por escribir un mensaje que quedara guardado junto con los demas. de lo contrario solo veran los mensajes       guardados.
# La idea de los mensajes es que sean secretos, confesiones, declaraciones de amor, declaraciones de cambio de genero, expresar su odio por recursos   humanos (JT dedicado a ti), etc.

# COMO USAR:
# SITUARSE EN LA CARPETA QUE CONTIENE EL TCPSERVER (EN CASO DE NO TENERLO EN PATH) (DESCARGAR/UCSPI-TCP-0.88)
# .``/tcpserver -H -R 0.0.0.0 3334 /ruta/del/script/confesionario.sh
# (Esto deja a la espera abierta del puerto 3334, mientras se esta ejecutando)
# Conectarse remotamente desde su computador, con "nc <ip del server> 3334"
# Nota, el 0.0.0.0 pueden cambiarlo por la ip que quieran dejar a la escucha (en caso de poseer mas de 1 ip en la maquina), pueden cambiar el puerto   si lo desean.
# Se puede dejar como daemon al tcpserver, de manera que siempre permanezca a la escucha, unicamente tener claro que la ruta del script no debe        variar, es recomendable que pnerlo con la misma carpeta del tcpserver (al igual que archivo que contiene los secretos).

cat ~/Documentos/scripts/secretos_mac 2> /dev/null
echo -e "\n--------echo {Confiesa,desahoga,habla,lee,guarda}lo---------\n"
read -p "Deja tu confesion: " MESSAGE
if [ -z "$MESSAGE" ]
then
    echo "Sshhhhhh...."
else
    echo ">> $MESSAGE - [ $(date |cut -d " " -f 2-3,6) ]" >> ~/Documentos/scripts/secretos_mac
    echo -e "\nMensaje Guardado."
fi
