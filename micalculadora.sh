#! /bin/bash
#Declaramos las variables que vamos a usar
#Variable que guarda el resultado de las operaciones
sum=0
#Variable que recoge el resto de los numeros con los quellamas a la funcion
resto=`expr $1 % $2`
#Variable que recoge la multiplicacion de los numeros con los quellamas a la funcion
mul=`expr $1 \* $2`
i="y"
#mientras se siga dando a y cuando te pregunta si quieres continuar se ejecuta el codigo
while [ $i = "y" ]
do
# Te lista las opciones puedes elegir
echo "1.Sumar"
echo "2.Restar"
echo "3.Multiplicar"
echo "4.Dividir"
echo "5.Porcentaje"
echo "6.Guardar las operaciones en una archivo de texto"
echo "Introduce el numero de operación seleccionada (1 al 4)"
#lee la opcion que elige el usuario
read ch
#dependiendo de la opcion que elija hace una cosa distinta
case $ch in
#si elige la opcion 1, suma
    1)sum=`expr $1 + $2`
     echo "El resultado de la suma de los operadores "$1" y "$2" es "$sum;;
#si elige la opcion 2, resta
    2)sum=`expr $1 - $2`
     echo "El resultado de la resta de los operadores "$1" y "$2" es "$sum;;
#si elige la opcion 2, multiplica
    3)sum=`expr $1 \* $2`
     echo "El resultado del producto de los operadores "$1" y "$2" es "$sum;;
#si elige la opcion 4, divide y saca el resto
    4)sum=`expr $1 / $2`
#si divide entre 0 saca error
     if [ $2 = "0" ]
     then
	echo "No puedes dividir entre 0, prueba con otro numero"
     else
     	echo "El resultado de la división de los operadores "" y "" es "$sum" y su resto es " $resto
     fi;;
#si elige la opcion 5, saca el porcentaje
    5)sum=`expr $mul / 100`
     echo  $1" respecto a "$2" supone un porcentaje de "$sum;;
    6)
     echo "Se ha creado el archivo de texto";;
esac
#Te pregunta si quieres continuar
echo "Quieres continuar (y/n)) ?"
#lee tu respuesta
read i
#si das a cualquier otra tecla dintinta de y, sale del programa
if [ $i != "y" ]
then
    exit 0
fi
done
