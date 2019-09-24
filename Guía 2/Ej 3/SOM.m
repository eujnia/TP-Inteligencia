function []=SOM(alto, ancho, entradas, nro_epocas, radio, tasa)
  
  w=rand(alto, ancho, 2)-0.5;
  
  min_dist=abs(w(1,1,1)-entradas(1,1))+abs(w(1,1,2)-entradas(1,2));
  pos_min=[1 1];
  
  figure;
  for i=1:alto
    for j=1:ancho
      
      if i != alto && j!=ancho
        plot(w(i,j,1),w(i,j,2),'or','linewidth',1.1); hold on;
        line([w(i,j,1) w(i+1,j,1)],[w(i,j,2) w(i+1,j,2)],"linestyle","--","color","r");
        line([w(i,j,1) w(i,j+1,1)],[w(i,j,2) w(i,j+1,2)],"linestyle","--","color","r");
     endif
    
      if j == ancho && j!=ancho
        plot(w(i,j,1),w(i,j,2),'or','linewidth',1.1);
        line([w(i,j,1) w(i+1,j,1)],[w(i,j,2) w(i+1,j,2)],"linestyle","--","color","r");
      endif
      
      if i == alto 
        plot(w(i,j,1),w(i,j,2),'or','linewidth',1.1);
        if j != ancho
          line([w(i,j,1) w(i,j+1,1)],[w(i,j,2) w(i,j+1,2)],"linestyle","--","color","r");  
        endif
      endif
      
    endfor
  endfor
    
           
  for epoca=1:nro_epocas
    for patron=1:size(entradas,1)
      
      % buscar distancia neurona de distancia minima para el patron
      for i=1:alto
        for j=1:ancho
          
          dist=abs(w(i,j,1)-entradas(patron,1))+abs(w(i,j,2)-entradas(patron,2));
          if dist<min_dist
            min_dist=dist;
            pos_min=[i j];
          endif
          
        endfor
      endfor
      radio=fix(0.99*radio);
      % actualizar ganadora y vecinas
      for i=1:alto
        for j=1:ancho
          if pos_min(1)+i<=radio && pos_min(2)+j<=radio
            w(i,j,1)+=w(i,j,1)+tasa*(entradas(patron,1)-w(i,j,1));
            w(i,j,2)+=w(i,j,2)+tasa*(entradas(patron,2)-w(i,j,2));
          endif
        endfor
      endfor
      
      
      
      
      
      hold off;
      for i=1:alto-1
          for j=1:ancho-1
              plot(w(i,j,1),w(i,j,2),'or','linewidth',1.1); hold on;
              line([w(i,j,1) w(i+1,j,1)],[w(i,j,2) w(i+1,j,2)],"linestyle","--","color","r");
              line([w(i,j,1) w(i,j+1,1)],[w(i,j,2) w(i,j+1,2)],"linestyle","--","color","r");
          endfor
          plot(w(i,ancho,1),w(i,ancho,2),'or','linewidth',1.1);
          line([w(i,ancho,1) w(i+1,ancho,1)],[w(i,ancho,2) w(i+1,ancho,2)],"linestyle","--","color","r");
      endfor
       for j=1:ancho-1
         plot(w(alto,j,1),w(alto,j,2),'or','linewidth',1.1);
          line([w(alto,j,1) w(alto,j+1,1)],[w(alto,j,2) w(alto,j+1,2)],"linestyle","--","color","r");
         endfor
         plot(w(alto,ancho,1),w(alto,ancho,2),'or','linewidth',1.1);
      pause(1);
      
    endfor
  endfor
  
endfunction