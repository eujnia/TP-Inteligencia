%Ejercicio 2 - test
xval = [-20:0.1:20];

tipo = 0;
matriz_conjuntos  = [-20 -20 -10 -5; -10 -5 -5 -2; -5 -2 -2 0; -2 0 0 2; 0 2 2 5; 2 5 5 10; 5 10 20 20];
figure;
grafica_conjuntos(matriz_conjuntos, tipo, xval);

tipo = 1;
conj_gauss = [-20 8; -10 5; -4 5; 0 3; 4 5; 10 5; 20 8];
figure;
grafica_conjuntos(conj_gauss, tipo, xval);