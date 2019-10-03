function grafica_conjuntos(matriz_conjuntos, tipo, xval)
%  figure();
  hold on;
  for i =1:size(matriz_conjuntos,1)
    mu_eval=membresia(matriz_conjuntos(i,:),tipo,xval);
    plot(xval,mu_eval); 
  endfor
endfunction
