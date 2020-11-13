# Indica cual shell utilizara para ejecutar el script.
#!/bin/bash

cedula=$1 # Recibe el numero de cédula como parametro del script.

numImp=0 # Variable que almacena la suma de dígitos impares de la cédula.
numPar=0 # Variable que almacena la suma de dígitos pares de la cédula.
nm=0 # Variable que almacena los dígitos de la cédula.
aux=0 # Variable auxiliar.
comp=0 # Variable que almacena el dígito de comprobación de la cédula.

if [ ${#cedula} -eq 10  ]; then # Comprueba que la cédula tenga 10 dígitos.

	for i in $(seq 1 9); do # Ciclo for que cuenta desde el uno al nuevo.
		nm=$(expr substr $cedula $i 1) # Corta la cadena de texto de la cédula en dígitos individuales y los almacena en la variable nm.
		if [ $(expr $i % 2) -eq 0 ]; then # Comprueba si el indice actual es un número par.
			numPar=$(expr $numPar + $nm) # Suma los dígitos pares de la cédula.
		else
			aux=$(expr $nm \* 2) # Multiplica el dígito impar por dos.
			if [ $aux -ge 10 ]; then # Comprueba si el resultado de multiplicación es mayor a diez.
				aux=$(expr $aux - 9) # Si el resultado de la multiplicación es mayor a diez se le resta nueve.
				numImp=$(expr $numImp + $aux) # Suma los dígitos impares de la cédula.
			else
				numImp=$(expr $numImp + $aux) # Suma los dígitos impares de la cédula.
			fi
		fi
	done

	sum=$(expr $numImp + $numPar) # Suma el total de los numeros pares e impares.
	res=$(expr $sum % 10) # Obtiene el residuo de dividir la suma del total entre diez.

	if [ $res -eq 0 ]; then # Comprueba si el residuo es igual a cero.
		comp=0 # Establece el valor del dígito de comprobación en cero.
	else
		comp=$(expr 10 - $res) # Si el residuo es diferente de cero lo resta de diez.
	fi

	if [ $comp -eq $(expr substr $cedula 10 1) ]; then # Comprueba si el dígito de comprobación es igual al íltimo dígito de la cédula.
		echo Cedula Valida
	else
		echo Cedula No Valida
	fi

else
	echo Faltan dígitos
fi
