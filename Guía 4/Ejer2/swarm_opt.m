function [mejor_pos, t] = swarm_opt(funcion, ini_fin, nro_particulas, c, fit, cond_fin, t_max)

  # inicializamos las parti­culas
  dimensiones = size(ini_fin,1);
  x = zeros(nro_particulas, dimensiones);
  aux = ini_fin(:,2) - ini_fin(:,1);
  
  for i=1:nro_particulas
    for j = dimensiones
      x(i,j) = rand(1);
      x(i,j) = aux * x(i,j) + ini_fin(1,j);
    endfor
  endfor

  # iniciamos mejores locales
  y = x;
  
  # mejor global (vector que contiene el mejor en cada t)
  y_glob = zeros(t_max, dimensiones);
  y_glob(1,:) = x(1,:);
  mejor_pos = x(1,:);
  
  # v0
  v = zeros(nro_particulas, dimensiones);
  
  figure;
  axis([-512 512 -1 1]);
  for i=1:size(x,1)
     for j=1:size(x,2)
      scatter(x(i,j),0,'b','linewidth',1.2); hold on;
     endfor
  endfor 
  
  t=2;
  # enjambre
  while (t != t_max)
    y_glob(t,dimensiones) = y_glob(t-1, dimensiones);
    
    for i=1:nro_particulas
      for j=1:dimensiones
       # evaluamos si el fitness actual es menor que el mejor local

       if abs(fit(x(i,:))) < abs(fit(y(i,:)))
         y(i,j) = x(i,j);
       endif
       # evaluamos si el fitness actual es menor que el mejor global
       if abs(fit(x(i,j))) <  abs(fit(y_glob(t,j)))
         y_glob(t,j) = x(i,j);
       endif
     endfor
    endfor
    
    r = rand(1);  

    v = v + c(1)*r*(y - x) + c(2)*(1-r)*(y_glob(t,:) - x);
    
    for j = 1:size(x,1)
      for i = 1:size(x,2)
       aux_x = x(j,i) + v(j,i);
       if aux_x <= ini_fin(1,2) && aux_x >= ini_fin(1,1) 
          x(j,i) = aux_x;
        else
           if aux_x < ini_fin(1,2)
           x(j,i) = ini_fin(1,1);
           else
            x(j,i) = ini_fin(1,2);
           endif
        endif 
     endfor
      
    endfor
    
##    if t>4 && abs(y_glob(t,:) - x) <= 1
##      x = x + v*0.1;
##    else
##      x = x + v;
##    endif
     
    t = t + 1;
    
    hold off; scatter(x(1),0,'b','linewidth',1.2); hold on; 
    
  axis([-512 512 -1 1]);

    for i=1:size(x,1)
      scatter(x(i),0,'b','linewidth',1.2); hold on;
      
    endfor
    pause(.5);
    # criterio de corte
     s= 0;
    if t >= 11
     
      for j = 1:dimensiones  
        if abs(median(y_glob(t-10:1:t,j)) - y_glob(t,j)) <= cond_fin
          mejor_pos = y_glob(t,:);  
          s= 1;
          break;
        endif  
      endfor
     
    endif
   if s==1
        break
      endif
  endwhile

  if t == t_max
    mejor_pos = y_glob(t_max-1,:);
  endif  
  
endfunction
