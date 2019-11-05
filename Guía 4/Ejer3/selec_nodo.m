function [t] = selec_nodo(prob_ciudades)

  suma = 0;
  n_ciudades = size(prob_ciudades,2);
  
  for i = 1:n_ciudades
   suma = suma + prob_ciudades(i);
  endfor
    
  # promediamos el vectro de probabilidades
  
  if suma != 0
    prob_ciudades = prob_ciudades./suma;
  endif   
  
  # ordenamos el vector de probabilidades
  sort_prob = [];
  prob_ciudades_a = prob_ciudades;
  for i = 1:n_ciudades
    [elem, p] = max(prob_ciudades_a);
    sort_prob(i,1) = elem;
    sort_prob(i,2) = p;
    prob_ciudades_a(p) = -1;
  endfor
  
  # elegimos un elemento al azar considerando las probabilidades de cada uno 
  r = rand();
  t = t_aux = 0;
  suma_aux = 0;
  
  while (r > suma_aux) 
    t_aux = t_aux + 1;
    
    if sort_prob(t_aux,1) != 0
      t = sort_prob(t_aux,2);
    endif
    # mientras la suma aux no alcance el valor r, se suma la prob siguiente
    suma_aux = suma_aux + sort_prob(t_aux,1);  
    if t_aux == n_ciudades
      break
    endif
  endwhile

   
endfunction
