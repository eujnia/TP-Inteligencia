function [menor_d] = sACO(n_ciudades, distancia, n_hormigas, t_max, ro,  n_m)
  # inicializamos las feromonas con valores pequeños y los nodos
  # si el nodo está disponible nodo ij = 1. si no = 0
  feromona = nodo = zeros(n_ciudades, n_ciudades);
  feromona(:,:) = rand(1)*0.001;
  
  long_max = n_ciudades;
  p = zeros(n_hormigas, long_max); # camino recorrido
  
  # probabilidad: distancia * nodo
  prob = distancia * nodo * feromona;
  long_camino = zeros(n_hormigas, t_max);
  for t = 1:t_max
    
    # para cada hormiga
    for k = 1:n_hormigas
      nodo(:,:) = 1;
      p(k,:) = 1;
      p(k,1) = 7;
      
      # para cada paso
      for paso = 2:n_m  # primer paso = nodo 7
        
        # actualizamos prob. de elegir un nodo
        for n = 1:n_ciudades
          prob(p(k,paso), n) = nodo(p(k,paso-1),n) * feromona(p(k,paso-1),n); # distancia(p(k,paso-1),n) 
        endfor
        
        # seleccionamos el próximo nodo según la probabilidad 
        i = selec_nodo(prob(p(k,paso),:)); 
  
        p(k,paso) = i;
         
        # lo eliminamos de los nodos posibles
        nodo(paso-1,:) = 0;
        nodo(:,paso-1) = 0;
        
      endfor
      
      # como no hay repeticiones no hay ciclos
      # calcular la longitud del camino econtrado f para cada conexión (i; j)

      
      
      # reducir por evaporación la cantidad de feromonas:
      feromona = (1-ro)*feromona;
      
      suma = 0;
      # depositar feromonas proporcionalmente a la bondad de la solución
      for n =1:n_m-2
        i = p(k,n);
        j = p(k,n+1);
        
        suma = suma + distancia(i,j); 
      endfor
      suma
    
      for n =1:n_m-2
        i = p(k,n);
        j = p(k,n+1);
        feromona(i,j) = feromona(i,j) + distancia(i,j)/suma; 
      endfor
      
     endfor

  endfor
   
  menor_d = p(n_hormigas,:);
  
endfunction
