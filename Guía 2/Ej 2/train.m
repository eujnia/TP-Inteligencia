function [w] = train(x,yd,nro_epocas,criterio,tasa_ap)
  #criterio = nro de 0 a 1 
   
  x=[-1*ones(size(x,1),1) x]; #Agrega a x la columna de -1 al inicio
  w=rand(size(x,2),1)-0.5; 

  for epoca=1:nro_epocas 
    
    #Corrección de los w
    for patron=1:size(x,1)
    
      #funcion de transferencia   
      y=x(patron,:)*w;
      
      # ajustar pesos
      w = w + 0.5*tasa_ap*(yd(patron)-y)*x(patron,:)';
      
    endfor
    
    for patron=1:size(x,1)
      
      y_val=x(patron,:)*w;
      
      error= yd(patron)-y_val/yd(patron);  
      
    endfor
    error_prom = error / size(x,1);
    
    if error_prom <= 1-criterio
       break
    endif
    
  endfor
  
endfunction