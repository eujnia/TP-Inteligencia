function [y]=reglas_borrosas(x,E,S,r)
  y = [];
  tipo=0;
  n = size(r,1);
  ga = grado_activacion(E,x , tipo);
  y = defuzzificacion_6(S,r,tipo, ga);  
endfunction
