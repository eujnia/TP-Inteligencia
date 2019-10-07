#Ejercicio 4 - test

a = [0 0.7 0.3 0 0 0 0];
r=[1 2 3 4 5 6 7];

tipo = 0;
conjunto_salida = [-7 -5 -5 -3 ; -5 -3 -3 -1;-3 -1 -1 0; -1 0 0 1;0 1 1 3; 1 3 3 5; 3 5 5 7];
figure;
grafica_conjuntos(conjunto_salida,tipo,[-7:.1:7]);
[y_trian]=defuzzificacion(conjunto_salida,tipo,a)
hold on;
stem(y_trian,1);

tipo = 1;
conjunto_salida = [-7 3; -5 2; -3 2; 0 5; 3 2; 5 2; 7 3];
figure;
grafica_conjuntos(conjunto_salida,tipo,[-7:.1:7]);
[y_gauss]=defuzzificacion(conjunto_salida,tipo,a)
hold on;
stem(y_gauss,1);