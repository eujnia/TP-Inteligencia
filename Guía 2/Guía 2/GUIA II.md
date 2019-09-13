# GUIA II



### Ejercicio 1:

Codique el algoritmo de entrenamiento para una red neuronal con RBF y pruebe implementar en la resolución del problema xor, empleando los datos de la guía anterior.

Diseñe una red RBF para resolver el problema Iris (irisbin.csv), considerando una cantidad de parámetros similar a la red MLP de la guía anterior. 

Luego compare la velocidad de entrenamiento y el porcentaje nal de clasificación obtenido con ambas arquitecturas. 



### Solución: 

RBF tiene dos capas. Una capa gausiana con aprendizaje no supervisado y una capa de perceptrón con aprendizaje supervisado. 



1- Realización de la capa gausiana: 

Objetivos:
•  Encontrar k conjuntos  Cj de forma que:
		•  Cada conjunto Cj sea lo más diferente posible de los demás
		•  Los patrones dentro de cada Cj sean lo más parecidos posible entre ellos.
• Encontrar el centroide de cada conjunto Cj



Método: 

1. Inicialización: se forman los k conjuntos con patrones elegidos al aleatoriamente.
2. Se calculan los centroides.

3. Se reasignan los patrones al Cj más cercano.

4. Volver a 2 hasta que no se realicen reasignaciones.



Segun entiendo, la capa gausiana tiene que devolver las salidas estimadas para un conjunto de puntos. Así que ahora devuelve yg pero lo que importa es cg, que tiene 1 o -1 dependiendo de si fue el maximo de yg o no.

Otra cosa que cambié fue que las neuronas gauseanas son 2. Me parece que tiene que ver con el tipo de respuesta.. lo estuve pensando y me parece que tiene sentido, no sé que opinás.





Nota: La distancia euclidea se calcula así

![img](https://www.excel-avanzado.com/wp-content/uploads/2014/08/distancia-entre-dos-puntos.jpg)



