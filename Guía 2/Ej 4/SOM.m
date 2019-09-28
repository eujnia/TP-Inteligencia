function [val_real,val_som]=SOM(entrada, alto, ancho, mapa, etiqueta)
  min_dist = norm(mapa(1,1,1)-entrada(1),mapa(1,1,2)-entrada(2),2);
  pos_min = [1 1];
  
      for i=1:alto
        for j=1:ancho
          
          dist=norm(mapa(i,j,1)-entrada(1),mapa(i,j,2)-entrada(2),2);
           
          if dist<=min_dist
            min_dist=dist;
            pos_min=[i j];
          endif
      
        endfor
      endfor 
      
      %valor devuelto por el som
      val_som = etiqueta(pos_min);
      
      %valor deseado
       if entrada(3) == 1
         val_real=1;
       else 
         val_real=0;
       endif
       
endfunction