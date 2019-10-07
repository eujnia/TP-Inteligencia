#Ejercicio 5 - test
%fila = nro conjunto 
x = 4;
r = [1; 2; 3; 4; 5; 6; 7];

tipo=0;
M = [-20 -20 -10 -5; -10 -5 -5 -2; -5 -2 -2 0; -2 0 0 2; 0 2 2 5; 2 5 5 10; 5 10 20 20];
S = [-7 -5 -5 -3 ; -5 -3 -3 -1;-3 -1 -1 0; -1 0 0 1;0 1 1 3; 1 3 3 5; 3 5 5 7];
[y_trian]=reglas_borrosas(x,M,S,tipo,r)

figure;

subplot(2,2,1);
grafica_conjuntos(M,tipo,[-20:0.2:20]);
title('entrada');

subplot(2,2,2);
grafica_conjuntos(S,tipo,[-7:0.1:7]);
title('salida');

tipo=1;
M = [-20 8; -10 5; -4 5; 0 3; 4 5; 10 5; 20 8];
S = [-7 3; -5 2; -3 2; 0 5; 3 2; 5 2; 7 3];
[y_gauss]=reglas_borrosas(x,M,S,tipo,r)

subplot(2,2,3);
grafica_conjuntos(M,tipo,[-20:0.2:20]);
title('entrada');

subplot(2,2,4);
grafica_conjuntos(S,tipo,[-7:0.1:7]);
title('salida');