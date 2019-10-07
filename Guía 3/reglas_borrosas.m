function [y]=reglas_borrosas(x,E,S,tipo,r)
  y = zeros(length(x),1);
  n = size(r,1);
  ga=zeros(size(x),size(E,1));
  #x puede ser un valor o un vector e u g e n i a 
  for i=1:length(x)
    ga(i,:) = grado_activacion(E, tipo, x(i));
  endfor
  S = reordenar(S, r);
  for i=1:length(y)
    y(i) = defuzzificacion(S, tipo, ga(i,:));
  endfor  
endfunction
