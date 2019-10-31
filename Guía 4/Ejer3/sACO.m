function [menor_d] = sACO(n_ciudades, distancia, n_hormigas, t_max, ro,  n_m)
  # inicializamos las feromonas con valores pequeños y los nodos
  
  feromona = zeros(n_ciudades, n_ciudades); 
  feromona(:,:) = (rand(1) + 0.1) ;
  min_sum = 10000.1;
  
  nodo = zeros(n_ciudades, n_ciudades); # desde , hasta
  # si el nodo está disponible nodo ij = 1. si no = 0
  
  
  long_max = n_ciudades;
  p = ones(n_hormigas, long_max); # camino recorrido
  
  # probabilidad: distancia * nodo
  prob = nodo * feromona;
 % long_camino = zeros(n_hormigas, t_max);
  for t = 1:t_max
    ini = 7;
    # para cada hormiga
    for k = 1:n_hormigas
      nodo(:,:)=1;
      
      for nod = 1: n_ciudades
         nodo(nod,nod) = 0;
      endfor
      p(k,:) = 1;
      p(k,1) = ini; 
      
      # para cada paso
      for paso = 2:n_m  # primer paso = nodo 7
        
        # actualizamos prob. de elegir un nodo
        for n = 1:n_ciudades
          nodos = nodo(p(k,paso-1),n)
          prob(p(k,paso-1), n) = nodo(p(k,paso-1),n) * feromona(p(k,paso-1), n); # distancia(p(k,paso-1),n) 
        endfor
        proba = prob(p(k,paso-1), :)
        # seleccionamos el próximo nodo según la probabilidad 
        i = selec_nodo(prob(p(k,paso-1),:)); 
        if i != 0 
          p(k,paso) = i;
          
        # lo eliminamos de los nodos posibles
        s = p(paso-1);
        for i = 1:size(nodo,1)
          nodo(i,s) = 0;
        endfor
        
        for i = 1:size(nodo,2)
          nodo(s,i) = 0;
        endfor
        endif
     
      endfor
      
      # como no hay repeticiones no hay ciclos
      # calcular la longitud del camino econtrado f para cada conexión (i; j) =7
      
      
      # reducir por evaporación la cantidad de feromonas:
      feromona = (1-ro)*feromona;
      
      suma = 0;
      # depositar feromonas proporcionalmente a la bondad de la solución
      for a =1:n_m-1
        i = p(k,a);
        j = p(k,a+1);
        
        suma = suma + distancia(i,j); 
      endfor
      if min_sum > suma
        min_sum = suma;
        menor_d = p(k,:);
      endif
      
      for a =1:n_m-1
        i = p(k,a);
        j = p(k,a+1);
        feromona(i,j) = feromona(i,j) + distancia(i,j)/suma; 
      endfor
      
     endfor

  endfor
   
   
  
endfunction
