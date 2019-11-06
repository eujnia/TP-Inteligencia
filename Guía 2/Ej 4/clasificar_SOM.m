function [clases_w] = clasificar_SOM(w, datos)
  % clasificador SOM recibe un mapa y devuelve la clasificacion de cada elemento
  % de acuerdo a los datos, se puede seleccionar la forma 1 para pasar todos
  % los datos por todas las neuronas o la forma 2 para calcular con que clase
  % gana más veces cada neurona
  
  clases_w = zeros(size(w(:,:,1)));
  caso = 1;
  tipo_distancia = 3;
  
  switch caso
    case 1
      % pasar todos los patrones por las neuronas y quedarse con el de minima dist
      
      for i=1:size(w,1)
        for j=1:size(w,2)
          
          min_dist=distancia( w(1,1,:), datos(1,:), tipo_distancia );
          for k=1:size(datos,1)
            
            dist=distancia( w(i,j,:), datos(k,:), tipo_distancia );
            if dist<=min_dist
              min_dist=dist;
              patron=k;
            endif
            
          endfor
          
          clases_w(i,j) = datos(patron,3);
          
        endfor
      endfor
      
    case 2
      % pasar todos los patrones y sumar la cantidad de veces que gana una neurona
      % asignar la clase con la que gano mas veces
      
      victorias=zeros(size(w,1),size(w,2),2);
      
      for k=1:size(datos,1)
        min_dist=distancia( w(1,1,:), datos(1,:), tipo_distancia );
        
        for i=1:size(w,1)
          for j=1:size(w,2)
            
            dist=distancia( w(i,j,:), datos(k,:), tipo_distancia );
            if dist<=min_dist
              min_dist=dist;
              pos_min=[i j];
            endif
            
          endfor
        endfor
        
        % agregar el dato de la ganadora
        victorias(pos_min(1), pos_min(2), datos(k,3)+1) += 1;
        
      endfor
      
      for i=1:size(w,1)
        for j=1:size(w,2)
          [~,pos] = max(w(i,j,:));
          clases_w(i,j) = pos-1;
        endfor
      endfor
      
  endswitch      
  
endfunction