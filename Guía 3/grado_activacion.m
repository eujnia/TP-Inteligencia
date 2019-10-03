function [a] = grado_activacion(matriz_conjuntos, tipo, xval)
  a = zeros(size(matriz_conjuntos,1),1);
  for i =1:size(matriz_conjuntos,1)
    a(i) = membresia(matriz_conjuntos(i,:),tipo, xval);
  endfor
    
endfunction
