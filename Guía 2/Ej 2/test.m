function [error_prom] = test(w,x,yd)
  
  x=[-1*ones(size(x,1),1) x];
  desempenio=0;
  
  # recorrer por patron
  for patron=1:size(x,1)
    
    y=x(patron,:)*w;
    
    error= yd(patron)-y/yd(patron);  
    
  endfor

  error_prom = error/size(x,1);
  
endfunction
