function [error_prom] = test(w,x,yd)
  
  x=[-1*ones(size(x,1),1) x];
  desempenio=0;
  y = [];
  # recorrer por patron
  for patron=1:size(x,1)
    
    y=[y; x(patron,:)*w];
    
    error= yd(patron)-y(patron)/yd(patron);  
    
  endfor
  figure;
  plot(y);
  hold on;
  plot(yd);hold on;
  legend("prediccion","real");
  error_prom = error/size(x,1);
  
endfunction
