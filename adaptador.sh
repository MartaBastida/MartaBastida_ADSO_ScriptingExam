#!/bin/bash
# un script para poder leer entradas
# un archivo temporal donde guardar lo que vamos leyendo

#Declaramos las variables vacias
nombre=""
ip=""
gateway=""
mascara=""
dns1=""
dns2=""
#Empezamos el bucle
while :
do
#Funcion que dibuja la caja del nombre y recoge el nombre del adaptador y lo mete en el archivo /tmp/input.txt (Cada vez que metemos un nombre nuevo el resto de datos del archivo se borran)
fun_nombre(){
OUTPUT="/tmp/input.txt"
dialog --title "Nombre" \
--backtitle "Adaptador de red" \
--inputbox "Indica el nombre del adaptador de red" 8 60 2>$OUTPUT
response=$?
name=$(<$OUTPUT)
case $response in
        0) nombre=$name ;;
        1) echo "Cancel pressed." ;;
        255) echo "[ESC] key pressed." ;;
esac
#rm /tmp/input.txt
}
#Funcion que dibuja la caja de la ip, la recoge y lo mete en el archivo /tmp/input.txt 
fun_ip(){
OUTPUT="/tmp/input.txt"
dialog --title "IP" \
--backtitle "Adaptador de red" \
--inputbox "Indica la direccion IP" 8 60 2>>$OUTPUT
response=$?
name=$(<$OUTPUT)
case $response in
        0) ip=$name ;;
        1) echo "Cancel pressed." ;;
        255) echo "[ESC] key pressed." ;;
esac
#rm /tmp/input.txt
}
#Funcion que dibuja la caja del gateway, lo recoge y lo mete en el archivo /tmp/input.txt 
fun_gateway(){
OUTPUT="/tmp/input.txt"
dialog --title "Gateway" \
--backtitle "Adaptador de red" \
--inputbox "Indica la puerta de enlace " 8 60 2>>$OUTPUT
response=$?
name=$(<$OUTPUT)
case $response in
        0) gateway=$name ;;
        1) echo "Cancel pressed." ;;
        255) echo "[ESC] key pressed." ;;
esac
#rm /tmp/input.txt
}
#Funcion que dibuja la caja de la mascara, la recoge y lo mete en el archivo /tmp/input.txt 
fun_mask(){
OUTPUT="/tmp/input.txt"
dialog --title "Mascara de red" \
--backtitle "Adaptador de red" \
--inputbox "Indica la mascara de red" 8 60 2>>$OUTPUT
response=$?
name=$(<$OUTPUT)
case $response in
        0) mascara=$name ;;
        1) echo "Cancel pressed." ;;
        255) echo "[ESC] key pressed." ;;
esac
#rm /tmp/input.txt
}
#Funcion que dibuja la caja del primer dns, la recoge y lo mete en el archivo /tmp/input.txt 
fun_dns1(){
OUTPUT="/tmp/input.txt"
dialog --title "Primer dns" \
--backtitle "Adaptador de red" \
--inputbox "Indica el primer dns" 8 60 2>>$OUTPUT
response=$?
name=$(<$OUTPUT)
case $response in
        0) dns1=$name ;;
        1) echo "Cancel pressed." ;;
        255) echo "[ESC] key pressed." ;;
esac
#rm /tmp/input.txt
}
#Funcion que dibuja la caja del segundo dns, la recoge y lo mete en el archivo /tmp/input.txt 
fun_dns2(){
OUTPUT="/tmp/input.txt"
dialog --title "Segundo dns" \
--backtitle "Adaptador de red" \
--inputbox "Indica el segundo dns" 8 60 2>>$OUTPUT
response=$?
name=$(<$OUTPUT)
case $response in
        0) dns2=$name ;;
        1) echo "Cancel pressed." ;;
        255) echo "[ESC] key pressed." ;;
esac
#rm /tmp/input.txt
}
#Funcion que dibuja la caja de ver opciones, saca el contenido del fichero /tmp/input.txt 
#fun_ver_opciones(){
#	cat /tmp/input.txt `uname -a` > opc
#	whiptail --textbox opc 30 60
#}
#Funcion que dibuja la caja del interfaces, saca el contenido del fichero /etc/network/interfaces 
fun_interfaces(){
	cat /etc/network/interfaces `uname -a` > inter
	whiptail --textbox inter 30 60
}

#--------------------------INICIO SCRIPT---------------------------------------
OUTPUT="/tmp/input.txt"
# Dibuja el InputBox
dialog --menu "Conexion de adaptadores de red" 0 0 0 Nombre "Indica el nombre del adaptador de red" IP "Indica la direccion ip" Gateway "Indica la puerta de enlace" Mascara "Indica la mascara de red" DNS1 "Indica el primer dns" DNS2 "Indica el segundo dns"  Interfaces "Visualiza el ficher actual de los adaptadores de red" Salir "Salir del script" 2>temp

if [ "$?" = "0" ]
then
        _return=$(cat temp)
 #Dependiendo de la opcion que seleccione el usuario, saca por pantalla su funcion definida antes
        # Nombre is selected
        if [ "$_return" = "Nombre" ]
        then
                fun_nombre
        fi
 
         # ip is selected
        if [ "$_return" = "IP" ]
        then
		fun_ip
        fi
 
         # gateway is selected
        if [ "$_return" = "Gateway" ]
        then
		fun_gateway
        fi
         # mascara is selected
        if [ "$_return" = "Mascara" ]
        then
                fun_mask
        fi
         # dns is selected
        if [ "$_return" = "DNS1" ]
        then
                fun_dns1
        fi
         # dns is selected
        if [ "$_return" = "DNS2" ]
        then
                fun_dns2
        fi
         # interfaces is selected
#        if [ "$_return" = "Ver opciones" ]
#        then
#                fun_ver_opciones
#        fi
         # interfaces is selected
        if [ "$_return" = "Interfaces" ]
        then
                fun_interfaces
        fi
        # Salir is selected
        if [ "$_return" = "Salir" ]
        then
                exit 0
        fi
 
# Si presionas Cancel
else
        echo "Cancel is pressed"
fi

#Entra en el cae
case $response in
	1) exit 0 ;;
	255) exit 0 ;;
esac

#borrar archivo temporal
#rm /tmp/input.txt
done
