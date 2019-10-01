#Ejercicio 4 - test
conjunto_salida = [-7 -5 -5 -3 ; -5 -3 -3 -1;-3 -1 -1 0; -1 0 0 1;0 1 1 3; 1 3 3 5; 3 5 5 7];
a = [0 0.7 0.3 0 0 0 0];
tipo = 0;
r=[1 2 3 4 5 6 7];
grafica_conjuntos(conjunto_salida,tipo,[-7:.1:7]);
[y]=defuzzificacion_6(conjunto_salida,r,tipo,a);
hold on;
stem(y,1);