%Ejercicio 3 - test

xval = [-20:0.1:20];
matriz_conjuntos  = [-20 -20 -10 -5; -10 -5 -5 -2; -5 -2 -2 0; -2 0 0 2; 0 2 2 5; 2 5 5 10; 5 10 20 20];
matriz_conjuntos  = [-7 -5 -5 -3 ; -5 -3 -3 -1;-3 -1 -1 0; -1 0 0 1;0 1 1 3; 1 3 3 5; 3 5 5 7];
grafica_conjuntos(matriz_conjuntos, tipo, xval);
hold on;
x= 4;
stem(x,1.5);
a = grado_activacion(matriz_conjuntos, tipo, x)
