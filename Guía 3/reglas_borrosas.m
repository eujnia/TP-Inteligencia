function [y]=reglas_borrosas(x,E,S,r)
  y = [];
  for i = 1:size(r,1)
    if  x ==E(i,:)      
      y = S(r(i),:);
    endif
  endfor
%la componente i-esima del conj de entrada i se corresponde con 
% r i del conjunto de salida 

endfunction
