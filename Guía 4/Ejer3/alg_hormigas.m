function [menor_d, min_sum,t_menor] = alg_hormigas(n_ciudades, distancia, n_hormigas, t_max, ro,  n_m)

  feromona = (rand(n_ciudades,n_ciudades) + 0.1);
  min_sum = 10000.1;
  
  nodo = zeros(n_ciudades, n_ciudades);  
  
  p = zeros(n_hormigas, n_ciudades); # p(hormiga, 2) = paso 2 de la hormiga
  
  prob = nodo * feromona;

  for t = 1:t_max
    ini = mod(t,n_ciudades)+1;
    
    # para cada hormiga
    for k = 1:n_hormigas
      
      #matriz de nodos
      nodo(:,:)= 1;
      for nod = 1: n_ciudades
         nodo(nod,nod) = 0;
      endfor
      
      p(k,1) = ini; 
      
      # para cada paso
      for paso = 1:n_m-2  
        
        ciudad_actual = p(k,paso);
        for ciudad_x = 1:n_ciudades
          prob(ciudad_actual, ciudad_x) = nodo(ciudad_actual,ciudad_x) * feromona(ciudad_actual, ciudad_x); # distancia(p(k,paso-1),n) 
        endfor 
        
        # seleccionamos el próximo nodo según la probabilidad 
        i = selec_nodo(prob(ciudad_actual,:)); 
        
        if i != 0 
          p(k,paso+1) = i;
          
          # lo eliminamos de los nodos posibles
          
          for i = 1:size(nodo,1)
            nodo(i,ciudad_actual) = 0;
          endfor
        
          for i = 1:size(nodo,2)
            nodo(ciudad_actual,i) = 0;
          endfor
        endif
     
      endfor
      p(k,n_m) = ini;
      
      feromona = ro * feromona;
      suma_x = suma = 0;
      for a =1:n_m-1
        i = p(k,a);
        j = p(k,a+1);
        
        suma_x = suma_x + 1/distancia(i,j);
       suma = suma + distancia(i,j);  
      endfor
      
      if min_sum > suma
        min_sum = suma;
        menor_d = p(k,:);
        t_menor = t;
      endif
      
      for a =1:n_m-1
        i = p(k,a);
        j = p(k,a+1);
        
        feromona(i,j) = feromona(i,j) + suma_x/distancia(i,j); 
      endfor
      
     endfor 
     

  endfor
   
   
  
endfunction
