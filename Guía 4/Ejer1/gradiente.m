function [mejor, lista_mejores, it] = gradiente(caso, x_ini_fin, y_ini_fin, criterio_corte, ventana, it_max)
    
    % 0. Parámetros iniciales
    switch caso
    case 1
      func = @(x) -x .* sin(sqrt(abs(x)));
%      fitness = @(x) 450./((-x .* sin(sqrt(abs(x)))) + 450); 
      fitness = @(x) exp(-(((x-424)/212).^2)); % gaussiana -> mejor convergencia
      dfunc = @(x) -(x.^2*cos(sqrt(abs(x)))./(2*(abs(x)).^(3/2))) - sin(sqrt(abs(x)));
    case 2
      func = @(x) x + 5*sin(3*x) + 8*cos(5*x);
%      fitness = @(x) 10./((x + 5*sin(3*x) + 8*cos(5*x)) + 10); 
      fitness = @(x) exp(-(((x-1.8)/1.8).^2)); % gaussiana -> mejor convergencia
      dfunc = @(x) -40*sin(5*x) + 15*cos(3*x) + 1;
    case 3
      func = @(x,y) (x.^2 + y.^2).^(0.25) .* [(sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1];
%      fitness = @(x,y) 1./(((x.^2 + y.^2).^(0.25) .* ((sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1)) + 1); 
      fitness = @(x,y) exp(-(((x/50).^2)+((y/50).^2))); % gaussiana -> mejor convergencia
      dx1 = @(x,y) .5.*x.*(sin(50.*(x.^2+y.^2).^(.1)).^2+1)./(x.^2+y.^2).^(.75);
      dx2 = @(x,y) 12.*x.*(100.*(x.^2+y.^2).^(.1))./(x.^2+y.^2).^(.65);
      dx = dx1 + dx2;
      dy1 = @(x,y) .5.*y.*(sin(50.*(x.^2+y.^2).^(.1)).^2+1)./(x.^2+y.^2).^(.75);
      dy2 = @(x,y) 12.*y.*(100.*(x.^2+y.^2).^(.1))./(x.^2+y.^2).^(.65);
      dy = dy1 + dy2;
      dfunc = [dx, dy];
    endswitch
    lista_mejores = [];
    mejor = rand();
    
    if caso != 3
      x = [x_ini_fin(1) + (x_ini_fin(2) - x_ini_fin(1)) *rand()];
    else
      x = [x_ini_fin(1) + (x_ini_fin(2) - x_ini_fin(1)) *rand(),
           y_ini_fin(1) + (y_ini_fin(2) - y_ini_fin(1)) *rand()];
    endif
    
    figure;
    if caso != 3
      x_plot = linspace( x_ini_fin(1), x_ini_fin(2), 1000 );
      plot( x_plot, func(x_plot), 'k', 'linewidth', 1.1); hold on;
    endif
    
    for i=1:it_max
      
      if caso != 3
        grad_x = dfunc(x);
      else
        grad_x = dfunc(x(1),x(2));
      endif
      x = x - grad_x;
      lista_mejores = [lista_mejores; x];
      if i>1 && fitness(x) > fitness(lista_mejores(i-1))
        mejor = x;
      endif
      
      if caso != 3
        hold off;
        plot( x_plot, func(x_plot), 'k', 'linewidth', 1.1); hold on;
        scatter( mejor, func(mejor), 'b', 'linewidth', 1.1); hold on;
        pause(.5)
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
    
    it = i;
    
endfunction