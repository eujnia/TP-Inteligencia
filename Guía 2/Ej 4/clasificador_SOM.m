function [y] = clasificador_SOM(datos, w, clases_w)
  % clasificar los datos utilizando el mapa w, con clasificacion clases_w
  
  tipo_distancia = 3;
  y = [];
  
  for k=1:size(datos,1)
    
    min_dist=distancia( w(1,1,:), datos(k,:), tipo_distancia );
    for i=1:size(w,1)
      for j=1:size(w,2)
        dist=distancia( w(i,j,:), datos(k,:), tipo_distancia );
        if dist<=min_dist
          min_dist=dist;
          pos_min=[i j];
        endif
      endfor
    endfor
    
    y = [y; clases_w(i,j)];
    
  endfor
  
endfunction