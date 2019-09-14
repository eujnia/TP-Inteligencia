function [w] = train_g(x,yd,nro_epocas,criterio,tasa_ap)
  #criterio = nro de 0 a 1 
   
  x=[-1*ones(size(x,1),1) x]; #Agrega a x la columna de -1 al inicio
  w=rand(size(x,2),1)-0.5; 

  for epoca=1:nro_epocas 
    
    #Corrección de los w
    for patron=1:size(x,1)
    
      #incremento de los pesos
      z=x(patron,:)*w;
      
      if (z>=0)
        y=1;
      else
        y=-1;
      endif
      
      # ajustar pesos
      w = w + 0.5*tasa_ap*(yd(patron)-y)*x(patron,:)';
      
    endfor
    
    %% GRAFICA
      
      x1=linspace(-2,2,1000);
      x2=[];
      for i=1:length(x1)
        x2=[x2 (w(1)-w(2)*x1(i))/w(3)];
      endfor
      
      plot(x1,x2,'linewidth',1.5);
      pause(2);
    
    # validacion
    desempenio=0;
    
    for patron=1:size(x,1)
      
      z=x(patron,:)*w;
      
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