#Ejercicio 7 - test

%Responder para las 4 combinaciones de matrices de E S:
% presenta error final (alcanza el valor deseado)? 
% oscila?
% tiene sobreimpulso? (es decir, inicialmente se pasa del valor final).

% Analizar también la velocidad de convergencia, puede ser útil en aplicaciones críticas 

for c = 1:4
  sistema_borroso(c);
endfor

%  ANÁLISIS:
%
%  Error final: Es menor en los casos en los que se utiliza el conjunto de entrada M2 (conjunto que contiene trapecios)
%  Los valores de error se mapean en los conjuntos de entrada 
%
%  Oscilaciones: Las oscilaciones se dan en los casos en donde el conjunto de entrada es del tipo M2 (como el caso anterior)
%  Esto sucede porque la función de membresía cerca de cero es pequeña y las funciones que están pegadas son mayores lo que
%  hace que los centroides estén más cerca de esas funciones y oscilen
%
%  Sobreimpulso: En estos casos no se presentan sobreimpulsos.
%
%  Velocidad de convergencia: La convergenca más rapida se obtiene en el caso en donde la matriz de entrada tiene solo 
%  conjuntos triangulares y la de salida tiene conjuntos grandes cerca del cero, siendo menor en los casos de oscilaciones