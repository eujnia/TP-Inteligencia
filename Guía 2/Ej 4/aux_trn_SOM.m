#
for epoca=1:nro_epoca
  epoca
    for patron=1:size(entradas,1)
     patron
    % Buscar la neurona cuya distancia al patron sea mínima (competencia)
 
    %matriz de distancias
     dist=abs(w(:,:,1)-entradas(patron,1))+abs(w(:,:,2)-entradas(patron,2));
       
     [min_dist1,pos1] = min(dist');
     [_,pos1] =min(min_dist1);
     
     [min_dist2,pos2] = min(dist);
     [_,pos2]=min(min_dist2);
     
    %neurona con pos minima
     pos_min=[pos1 pos2];
    
    
    %Incrementa el contador de la neurona dependiendo si gano para un patron con 1 
    
    if entradas(patron,3) == 1
      clasificador(pos_min(1),pos_min(2)) += 1;
    else
       clasificador(pos_min(1),pos_min(2)) -= 1;
    endif
       

       
      %Actualiza los pesos de la ganadora y vecinas
      for i=1:alto
        for j=1:ancho
          if abs(pos_min(1)-i)<=radio && abs(pos_min(2)-j)<=radio 
            w(i,j,1)=w(i,j,1)+tasa* (entradas(patron,1)-w(i,j,1));
            w(i,j,2)=w(i,j,2)+tasa* (entradas(patron,2)-w(i,j,2));
          endif
        endfor
      endfor
      
     % grafica
      if mod(epoca,10)==0
          grafica_mapa;
      endif
      
    endfor %patron
    
    %Etiqueto cada neurona segun si gano mas veces con 1 o con 0 en 
    %esta epoca

     for i = 1:alto 
      for j = 1:ancho 
   
       if clasificador(i,j)>0  %gano mas veces el patron 1
         etiqueta(i,j) = 1; %actualizo
       else 
         etiqueta(i,j) = 0;
       endif
       
      endfor
     endfor 
    
  endfor %epoca
  
  %si la cantidad de 1 fue mayor que la mitad del numero de 
  %epocas, entonces gana mas veces el patron 1 para esa neurona 
  %en todas las epocas hasta el momento
  