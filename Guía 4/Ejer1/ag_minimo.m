function [mejores_resultados] = ag_minimo(caso, x_ini_fin, y_ini_fin, nro_poblacion, nro_bits_individuo, nro_seleccion, 
                                          nro_competencia, prob_cruza, prob_muta_indiv, porcentaje_brecha, criterio_corte, 
                                          ventana, it_max)
                                          
  switch caso
    case 1
      func = @(x) -x .* sin(sqrt(abs(x)));
      fitness = @(x) 450./((-x .* sin(sqrt(abs(x)))) + 450);
    case 2
      func = @(x) x + 5*sin(3*x) + 8*cos(5*x);
      fitness = @(x) 10./((x + 5*sin(3*x) + 8*cos(5*x)) + 10);
    case 3
      func = @(x,y) (x.^2 + y.^2).^(0.25) .* ((sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1);
      fitness = @(x,y) 1./(((x.^2 + y.^2).^(0.25) .* ((sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1)) + 1); 
  endswitch
  
  nro_hijos = round((1-porcentaje_brecha) * nro_poblacion) + 1;
  
  % 1. Generar individuos
  if caso == 3
    % COMPLETAR
  else
    x = linspace( x_ini_fin(1), x_ini_fin(2), 2^nro_bits_individuo );
    indiv = [1:2^nro_bits_individuo];
  endif 
  
  % 2. Asignar poblacion inicial
  if caso == 3
    % COMPLETAR
  else
    poblacion = [];
    fitness_mejor = 0;
    for i=1:nro_poblacion
      idx = randperm(size(indiv));
      poblacion = [poblacion; indiv(idx)];
      if fitness(x(idx)) > fitness_mejor
        idx_mejor = idx;
        fitness_mejor = fitness(x(idx));
      endif
    endfor
    mejores_individuos = fitness_mejor;
      
  endif 
  
  % 3. Graficar poblacion
  if caso == 3
    % COMPLETAR
  else
    figure;
    x_plot = linspace(x_ini_fin(1), x_ini_fin(2), 1000);
    plot(x_plot, func(x_plot), 'b', 'linewidth',1.1); hold on;
    for i=1:length(poblacion)
      idx = find(indiv,poblacion(i));
      scatter(x(idx), func(x(idx)), 'k','linewidth',1.1); hold on;
    endfor
  endif
  
  % 4. Iterar hasta el máximo de iteraciones
  for it=1:it_max
    
    % 4.1 Seleccionar progenitores
    seleccion = [];
    for i=1:nro_seleccion
      fitness_competencia = 0;
      for j=1:nro_competencia
        idx = find(poblacion(randperm(length(poblacion))), indiv);
        fitness_indiv = fitness(x(idx));
        if fitness_indiv > fitness_competencia
          fitness_competencia = fitness_indiv;
          idx_ganador = idx;
        endif
        
      endfor
      seleccion = [seleccion; indiv(idx)];
      
    endfor
    
    % 4.2 Cruzar y mutar
    nuevos_indiv = [];
    while length(nuevos_indiv) < nro_hijos
      prob = rand();
      if prob < prob_cruza
        prog1 = seleccion(randperm(length(seleccion)));
        prog2 = seleccion(randperm(length(seleccion)));
        bin_prog1 = dec2bin(prog1)';
        bin_prog2 = dec2bin(prog2)';
        punto_cruza = randperm(nro_bits_individuo);
        bin_hijo1 = [bin_prog1(1:punto_cruza) bin_prog2(punto_cruza+1:end)];
        bin_hijo2 = [bin_prog2(1:punto_cruza) bin_prog1(punto_cruza+1:end)];
        prob = rand();
        if prob < prob_muta_indiv
          punto_muta = randperm(nro_bits_individuo);
          if bin_hijo1(punto_muta)=='0'
            bin_hijo1(punto_muta)='1';
          else
            bin_hijo1(punto_muta)='0';
          endif
        endif
        if prob < prob_muta_indiv
          punto_muta = randperm(nro_bits_individuo);
          if bin_hijo2(punto_muta)=='0'
            bin_hijo2(punto_muta)='1';
          else
            bin_hijo2(punto_muta)='0';
          endif
        endif
        hijo1 = bin2dec(bin_hijo1);
        hijo2 = bin2dec(bin_hijo2);
        
        nuevos_indiv = [nuevos_indiv; hijo1; hijo2];
        
      endif
      
    endwhile
    
    % 4.3 Armar nueva generacion
    nueva_generacion = nuevos_indiv;
    nueva_generacion = [nueva_generacion; indiv(idx_mejor)];
    while length(nueva_generacion) < nro_poblacion
      nueva_generacion = [nueva_generacion; poblacion(randperm(nro_poblacion))];
    endwhile
    
    % 4.4 Evaluar nueva generación
    if caso == 3
    
    else
      for i=1:nro_poblacion
        for j=1:2^nro_bits_individuo
          if indiv(j) == nueva_generacion(i)
            idx=j;
          endif
        endfor
        if fitness(x(idx)) > fitness_mejor
          idx_mejor = idx;
          fitness_mejor = fitness(x(idx));
        endif
      endfor
      mejores_individuos = [mejores_individuos fitness_mejor];
    endif
    
    % 4.5 Graficar resultados
    if caso == 3
    
    else
      hold off;
      plot(x_plot, func(x_plot), 'b', 'linewidth',1.1); hold on;
      for i=1:length(poblacion)
        idx = find(indiv,nueva_generacion(i));
        scatter(x(idx), func(x(idx)), 'k','linewidth',1.1); hold on;
      endfor
      scatter(x(idx_mejor), func(x(idx_mejor)), 'r','linewidth',1.2); hold on;
      
    endif
    
    % 4.6 Cortar si se cumple el criterio 
    
   
    poblacion = nueva_generacion; 
  
  endfor
  
endfunction