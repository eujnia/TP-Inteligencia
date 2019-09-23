# GUIA II



### Ejercicio 1:

Codifique el algoritmo de entrenamiento para una red neuronal con RBF y pruebe implementar en la resolución del problema xor, empleando los datos de la guía anterior.

Diseñe una red RBF para resolver el problema Iris (irisbin.csv), considerando una cantidad de parámetros similar a la red MLP de la guía anterior. 

Luego compare la velocidad de entrenamiento y el porcentaje final de clasificación obtenido con ambas arquitecturas. 



### Solución: 

RBF tiene dos capas. Una capa gausiana con aprendizaje no supervisado y una capa de perceptrón con aprendizaje supervisado. 





Algoritmo en la capa gausiana:

  *	Mientras no se actualice g:
     	*	Guardamos g actual
     	*	Graficamos los centroides
     	*	Calculamos la distancia de todos los patrones a los k centroides con la norma 2 y guardamos el centroide mas cercano al mismo
     	*	Entre todos los patrones pertenecientes al conjunto calculamos el promedio. Delta es una matriz que contiene en cada fila el nuevo centroide: se suman en cada uno de ellos los valores de loss puntos del conjunto y se divide por la cantidad de patrones pertenecientes al conjunto. Consideración: si la cantidad de patrones pertenecientes al cjnto es nula el patron se va a 0,0,0.
     	*	Luego de ajustar los centroides, calculamos la gauseana usando 

$$
y  = exp((-0.5* mean((entradas(i,:)- c(j,:)))./ desvio)^2
$$



Algoritmo en la etapa de salida:

​	Perceptrón simple sobre las salidas de la gauseana

Segun entiendo, la capa gausiana tiene que devolver las salidas estimadas para un conjunto de puntos. Así que ahora devuelve yg pero lo que importa es cg, que tiene 1 o -1 dependiendo de si fue el maximo de yg o no.

Otra cosa que cambié fue que las neuronas gauseanas son 2. Me parece que tiene que ver con el tipo de respuesta.. lo estuve pensando y me parece que tiene sentido, no sé que opinás.





Nota: La distancia euclidea se calcula así

![img](https://www.excel-avanzado.com/wp-content/uploads/2014/08/distancia-entre-dos-puntos.jpg)



