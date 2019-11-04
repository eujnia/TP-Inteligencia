function [mejor, lista_mejores, it] = gradiente(caso, x_ini_fin, y_ini_fin, criterio_corte, ventana, it_max)
    
    % 0. Parámetros iniciales
    switch caso
    case 1
      syms xx;
      func = @(x) -x .* sin(sqrt(abs(x)));
%      fitness = @(x) 450./((-x .* sin(sqrt(abs(x)))) + 450); 
      fitness = @(x) exp(-(((x-424)/212).^2)); % gaussiana -> mejor convergencia
      
      f = -xx .* sin(sqrt(abs(xx)));
    case 2
      syms xx;
      func = @(x) x + 5*sin(3*x) + 8*cos(5*x);
%      fitness = @(x) 10./((x + 5*sin(3*x) + 8*cos(5*x)) + 10); 
      fitness = @(x) exp(-(((x-1.8)/1.8).^2)); % gaussiana -> mejor convergencia
      
      f = xx + 5*sin(3*xx) + 8*cos(5*xx);
    case 3
      syms xx;
      syms yy;
      func = @(x,y) (x.^2 + y.^2).^(0.25) .* [(sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1];
%      fitness = @(x,y) 1./(((x.^2 + y.^2).^(0.25) .* ((sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1)) + 1); 
      fitness = @(x,y) exp(-(((x/50).^2)+((y/50).^2))); % gaussiana -> mejor convergencia
      
      f = (xx.^2 + yy.^2).^(0.25) .* [(sin(50 .* (xx.^2 + yy.^2).^(0.1) )).^2 + 1];
    endswitch
    lista_mejores = [];
    
    if caso != 3
      x = [x_ini_fin(1) + (x_ini_fin(2) - x_ini_fin(1)) *rand()];
    else
      x = [x_ini_fin(1) + (x_ini_fin(2) - x_ini_fin(1)) *rand(),
           y_ini_fin(1) + (y_ini_fin(2) - y_ini_fin(1)) *rand()];
    endif
    
    for i=1:it_max
      
      if caso != 3
        grad_x = diff(f,x);
      else
        grad_x = diff(f,x(1),x(2));
      endif
      x = x - grad_x;
      lista_mejores = [lista_mejores; x];
      if fitness(x) > fitness(lista_mejores(i-1))
        mejor = x;
      endif
      
      if size(lista_mejores,1) > ventana+1
        if abs(mean(lista_mejores(i-ventana-1:i-1)) - lista_mejores(i)) <= criterio_corte
          break;
        endif
      endif
      
      if i == it_max
        mejor = lista_mejores(it_max);
      endif
      
    endfor
      
    
endfunction