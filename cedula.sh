# Indica cual shell utilizara para ejecutar el script.
#!/bin/bash

# echo Ingrese su Numero de Cedula:
# read cedula

cedula=$1 # Recibe el numero de cedula como parametro del script.

numImp=0
numPar=0
nm=0
aux=0
comp=0

if [ ${#cedula} -eq 10  ]; then

	for i in `seq 1 9`; do
		nm=`expr substr $cedula $i 1`
		if [ `expr $i % 2` -eq 0 ]; then
			numPar=`expr $numPar + $nm`
		else
			aux=`expr $nm \* 2`
			if [ $aux -ge 10 ]; then
				aux=`expr $aux - 9`
				numImp=`expr $numImp + $aux`
			else
				numImp=`expr $numImp + $aux`
			fi
		fi
	done

	sum=`expr $numImp + $numPar`
	res=`expr $sum % 10`

	if [ $res -eq 0 ]; then
		comp=0
	else
		comp=`expr 10 - $res`
	fi

	if [ $comp -eq `expr substr $cedula 10 1` ]; then
		echo Cedula Valida
	else
		echo Cedula No Valida
	fi

else
	echo Faltan Digitos
fi
