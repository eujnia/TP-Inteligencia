function [desempenio_prom] = test(w,x,yd)
  
  x=[-1*ones(size(x,1),1) x];
  desempenio=0;
  
  # recorrer por patron
  for patron=1:size(x,1)
    
    z=dot(w,x(patron,:));
    
    # funcion de activacion
    if (z>=0)
      y = 1;
    else
      y = -1;
    endif
    
    # comparar con y deseado
    if (y==yd(patron))
      desempenio+=1;
    endif
  
  endfor

  desempenio_prom = desempenio / size(x,1) % es da un float  100% confirmado
  
endfunction
