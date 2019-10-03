#Ejercicio 6 - test
%sistema borroso como mapeo no lineal entrada-salida
%recorriendo todo el rango de valores de entrada posibles y
% calculando la salida correspondiente
%Modique los conjuntos de entrada
%para utilizar conjuntos gaussianos en lugar de los trapezoidales,
%y vuelva a graficar el mapeo resultante. Estudie como cambia la morfologia
% del mapeo si se modifica el solapamiento entre conjuntos. Cambie
%el mapeo de reglas a 
%r = [7; 6; 5; 4; 3; 2; 1]
% y analice el resultado.
M = [-20 -20 -10 -5; -10 -5 -5 -2; -5 -2 -2 0; -2 0 0 2; 0 2 2 5; 2 5 5 10; 5 10 20 20];
S = [-7 -5 -5 -3 ; -5 -3 -3 -1;-3 -1 -1 0; -1 0 0 1;0 1 1 3; 1 3 3 5; 3 5 5 7];
 
%fila = nro conjunto 
x = [-20:0.5:20];
r = [1; 2; 3; 4; 5; 6; 7];
y= reglas_borrosas(x,M,S,r)
grafica_ej_6();