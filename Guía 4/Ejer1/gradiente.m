function [mejor, lista_mejores, it] = gradiente(caso, x_ini_fin, y_ini_fin, criterio_corte, ventana, it_max)
    
    % 0. Parametros iniciales
    switch caso
    case 1
      func = @(x) -x .* sin(sqrt(abs(x)));
%      error = @(x) 450./((-x .* sin(sqrt(abs(x)))) + 450); 
      error = @(x) exp(-(((x-424)/212).^2)); % gaussiana -> mejor convergencia
      dfunc = @(x) -(x.^2*cos(sqrt(abs(x)))./(2*(abs(x)).^(3/2))) - sin(sqrt(abs(x)));
    case 2
      func = @(x) x + 5*sin(3*x) + 8*cos(5*x);
%      error = @(x) 10./((x + 5*sin(3*x) + 8*cos(5*x)) + 10); 
      error = @(x) exp(-(((x-1.8)/1.8).^2)); % gaussiana -> mejor convergencia
      dfunc = @(x) -40*sin(5*x) + 15*cos(3*x) + 1;
    case 3
      func = @(x,y) (x.^2 + y.^2).^(0.25) .* [(sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1];
%      error = @(x,y) 1./(((x.^2 + y.^2).^(0.25) .* ((sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1)) + 1); 
      error = @(x,y) exp(-(((x/50).^2)+((y/50).^2))); % gaussiana -> mejor convergencia
      dx = @(x,y) .5.*x.*(sin(50.*(x.^2+y.^2).^(.1)).^2+1)./(x.^2+y.^2).^(.75) + 12.*x.*(100.*(x.^2+y.^2).^(.1))./(x.^2+y.^2).^(.65);
      dy = @(x,y) .5.*y.*(sin(50.*(x.^2+y.^2).^(.1)).^2+1)./(x.^2+y.^2).^(.75) + 12.*y.*(100.*(x.^2+y.^2).^(.1))./(x.^2+y.^2).^(.65);
    endswitch
    lista_mejores = [];
    
    # inicializamos el x y el mejor con rand
    if caso != 3 # caso 1D
      mejor = [x_ini_fin(1) + (x_ini_fin(2) - x_ini_fin(1)) * rand()];
      x = [x_ini_fin(1) + (x_ini_fin(2) - x_ini_fin(1)) * rand()];
    else
      mejor = [x_ini_fin(1) + (x_ini_fin(2) - x_ini_fin(1)) *rand(),
               y_ini_fin(1) + (y_ini_fin(2) - y_ini_fin(1)) *rand()];
           
      x = [x_ini_fin(1) + (x_ini_fin(2) - x_ini_fin(1)) *rand(),
           y_ini_fin(1) + (y_ini_fin(2) - y_ini_fin(1)) *rand()];
    endif
    
    figure;
    if caso != 3 # caso 1D
      x_plot = linspace( x_ini_fin(1), x_ini_fin(2), 1000 );
      plot( x_plot, func(x_plot), 'k', 'linewidth', 1.1); hold on;
    else # caso 2D
      x_plot = linspace( x_ini_fin(1), x_ini_fin(2), 1000 );
      y_plot = linspace( y_ini_fin(1), y_ini_fin(2), 1000 );
      
      [coordx, coordy] = meshgrid(x_plot, y_plot);
      contour(coordx, coordy, func(coordx, coordy), 5); hold on;
      pause(.5);
    endif
    
    for i=1:it_max
      
      # gradiente 
      if caso != 3 
        grad_x = dfunc(x);
      else
        grad_x = [dx(x(1),x(2)), dy(x(1),x(2))];
      endif
      
      alpha = actualizar_alpha(x,grad_x,caso);
      x_aux = x - grad_x.*alpha;
      
      if caso != 3
        if x_aux >= x_ini_fin(1) && x_aux <= x_ini_fin(2) 
          x=x_aux;
        endif        
        if i>1 && error(x(1)) > error(lista_mejores(i-1,1))
          mejor = x;
        endif
      else
        
        if x_aux(1) >= x_ini_fin(1) && x_aux(1) <= x_ini_fin(2) &&  x_aux(2) >= y_ini_fin(1) && x_aux(2) <= y_ini_fin(2) 
            x=x_aux;
          
        else 
          if x_aux(1) < x_ini_fin(1)
            x=[x_ini_fin(1), y_ini_fin(1)];
          else
            x=[x_ini_fin(2), y_ini_fin(2)];
          endif 
        endif
        
       
        if i>1 && error(x(1),x(2)) > error(lista_mejores(i-1,1),lista_mejores(i-1,2))
          mejor = x;
        endif
      endif
      
      lista_mejores = [lista_mejores; x];
      
      if caso != 3
        hold off;
        plot( x_plot, func(x_plot), 'k', 'linewidth', 1.1); hold on;
        scatter( mejor, func(mejor), 'b', 'linewidth', 1.1); hold on;
      else
        hold off;
        contour(coordx, coordy, func(coordx, coordy), 5); hold on;
        scatter( mejor(1), mejor(2), func(mejor(1),mejor(2)), 'b', 'linewidth', 1.1); hold on;
      endif
      pause(.5)
      
      if size(lista_mejores,1) > ventana+1
        if abs(mean(lista_mejores(i-1:i-1,:)) - lista_mejores(i,:)) <= criterio_corte
          break;
        endif
      endif
      
      if i == it_max
        mejor = lista_mejores(it_max,:);
      endif
      
    endfor
    
    it = i;
    
endfunction