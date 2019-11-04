function [mejor_pos, t] = swarm_opt(caso, funcion, ini_fin, nro_particulas, c, fit, cond_fin, t_max)

  # inicializamos las parti�culas
  dimensiones = size(ini_fin,1);
  x = zeros(nro_particulas, dimensiones);
  aux = ini_fin(:,2) - ini_fin(:,1);
  
  for i=1:nro_particulas
    for j = 1:dimensiones
       x(i,j) = aux * rand() + ini_fin(1,j);
    endfor
  endfor

  # iniciamos mejores locales
  y = x;
  
  # mejor global (vector que contiene el mejor en cada t)
  y_glob = zeros(t_max, dimensiones);
  mejor_pos = x(1,:);
  
  # v0
  v = zeros(nro_particulas, dimensiones);
  
  figure;
  if caso != 3
    x_plot=linspace( ini_fin(1,1), ini_fin(1,2), 1000 );
    plot(x_plot, funcion(x_plot), 'k', 'linewidth', 1.1); hold on;
    for i=1:size(x,1)
      for j=1:size(x,2)
        scatter(x(i,j),funcion(x(i,j)),'b','linewidth',1.2); hold on;
      endfor
    endfor 
  else
     x_plot=linspace( ini_fin(1,1), ini_fin(1,2), 1000 );
     y_plot=linspace( ini_fin(2,1), ini_fin(2,2), 1000 );
     [coordx, coordy]=meshgrid(x_plot,y_plot);
     contour(coordx, coordy, funcion(coordx, coordy), 5); hold on;
     for i=1:size(x,1)
       for j=1:size(x,2)
         scatter(x(i,j),funcion(x(i,j)),'b','linewidth',1.2); hold on;
       endfor
     endfor
  endif
  
  t=1;
  # enjambre
  while (t <= t_max)
    if t != 1
      y_glob(t,dimensiones) = y_glob(t-1,dimensiones);
    endif
    
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
    
    hold off; 
    plot(x_plot, funcion(x_plot), 'k', 'linewidth', 1.1); hold on;
    for i=1:size(x,1)
      scatter(x(i),funcion(x(i)),'b','linewidth',1.2); hold on;
    endfor
    title(strcat("Iteración: ",num2str(t))); hold on;
    pause(.5);
    
    if t == t_max
      mejor_pos = y_glob(t,:);
    endif 
    
    # criterio de corte
    if t > 11
      if abs(mean(y_glob(t-11:1:t-1,:)) - y_glob(t-1,:)) < cond_fin
        mejor_pos = y_glob(t,:);  
        break;
      endif       
     
    endif
    
    t = t + 1;
    
  endwhile
  
  t=t-1;
  
endfunction
