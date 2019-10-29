function [mejor_pos] = swarm_opt(funcion, x_ini_fin, nro_part, c, fit, cond_fin, it_max)
  mejor_pos = -1;
  %Inicializamos las partículas
  aux = x_ini_fin(2) - x_ini_fin(1);
  
  x = zeros(nro_part,1);
  for i=1:nro_part
    x(i) = rand(1);
    x(i) = aux*x(i) + x_ini_fin(1);
  endfor
  %mejores locales
  y = x;
  %mejores globales /vector que contiene el mejor en cada iteracion
  y_sombrero = zeros(it_max,1);
  y_sombrero(1) = x(1);
  %velocidad inicial
  v=zeros(size(x),1);
  
  figure;
  for i=1:size(x,1)
    scatter(x(i),0,'b','linewidth',1.2); hold on;
  endfor 
  
  it=1;
  %enjambre
  while (it != it_max)
    %evaluamos si el fitness actual es mayor que el mejor
    if it > 1
     y_sombrero(it,1) = y_sombrero(it-1,1);
    endif
   
    for i=1:nro_part
     if fit(x(i)) > fit(y(i))
       y(i) = x(i);
     endif
     if fit(x(i)) > fit(y_sombrero(it))
       y_sombrero(it,1) = x(i);
     endif
    endfor
    r = rand(1);  
    for i=1:nro_part
      v(i) = v(i) + c(1)*r*(y(i)-x(i)) + c(2)*(1-r)*(y_sombrero(it,1)-x(i));
      r = rand(1);
      x(i) = x(i) + v(i);
    endfor
    it= it+1;
    
    hold off; scatter(x(1),0,'b','linewidth',1.2); hold on; 
    for i=1:size(x,1)
      scatter(x(i),0,'b','linewidth',1.2); hold on;
    endfor
    if it >= 11
      if abs(median(y_sombrero(it-10:1:it,1)) - y_sombrero(it,1)) <= cond_fin
        mejor_pos = y_sombrero(it,1);  
        break;
      endif
    endif
  
  endwhile
  if mejor_pos == -1
    mejor_pos = y_sombrero(it_max-1,1);
  endif  
endfunction
