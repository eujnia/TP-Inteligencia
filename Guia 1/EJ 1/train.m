function [w] = train(x,yd,nro_epocas,criterio,tasa_ap)
  #criterio = nro de 0 a 1 
   
  x=[-1*ones(size(x,1),1) x]; #Agrega a x la columna de -1 al inicio
  w=randn(size(x,2),1)-0.5; 

  for epoca=1:nro_epocas 
    
    #Corrección de los w
    for patron=1:size(x,1)
    
      #incremento de los pesos
      z=dot(w,x(patron,:));
      
      if (z>=0)
        y=1;
      else
        y=-1;
      endif
      
      # ajustar pesos
      w = w + 0.5*tasa_ap*(yd(patron)-y)*x(patron,:)';
      
    endfor
    
    # validacion
    desempenio=0;
    
    for patron=1:size(x,1)
      
      z=dot(w,x(patron,:));
      
      if (z>=0)
        y_val=1;
      else
        y_val=-1;
      endif
      
      if y_val == yd(patron) 
        desempenio += 1;
      endif
      
    endfor
    # nro de aciertos / nro total de casos
    desempenio_prom = desempenio / size(x,1);
    
    if desempenio_prom >= criterio
       break
    endif
    
  endfor
  
endfunction