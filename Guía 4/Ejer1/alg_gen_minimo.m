function [mejor, lista_mejores, it] = alg_gen_minimo(caso, x_ini_fin, y_ini_fin, nro_poblacion, nro_bits_individuo, nro_seleccion, 
                                          nro_competencia, prob_cruza, prob_muta_indiv, porcentaje_brecha, criterio_corte, 
                                          ventana, it_max)
  
    func = @(x) -x .* sin(sqrt(abs(x)));
    fitness = @(x) 450./((-x .* sin(sqrt(abs(x)))) + 450);
    nro_individuos = 2^nro_bits_individuo;
  
    nro_hijos = round((1-porcentaje_brecha) * nro_poblacion) + 1;
  
    % 1. Generar individuos
  
    x = linspace( x_ini_fin(1), x_ini_fin(2), nro_individuos );
    lista_mejores = [];
    indiv = [1:nro_individuos];
   
   
    % 2. Asignar poblacion inicial
   
    poblacion = [];
    fitness_mejor = 0;
    
    for i=1:nro_poblacion
      idx = randperm(nro_individuos, 1);
      poblacion = [poblacion; indiv(idx)];
      if abs(fitness(x(idx))) > abs(fitness_mejor)
        idx_mejor = idx;
        fitness_mejor = fitness(x(idx));
      endif
    endfor
    
    mejores_individuos = fitness_mejor;
  
  
  % 3. Graficar poblacion
  
    figure;
    x_plot = linspace(x_ini_fin(1), x_ini_fin(2), 1000);
    plot(x_plot, func(x_plot), 'b', 'linewidth',1.1); hold on;
    for i=1:length(poblacion)
      idx = find(indiv,poblacion(i));
      scatter(x(idx), func(x(idx)), 'k','linewidth',1.1); hold on;
    endfor
    
  
  % 4. Iterar hasta el máximo de iteraciones
  for it=1:it_max
    
    % 4.1 Seleccionar progenitores
    seleccion = [];
    for i=1:nro_seleccion
      fitness_competencia = 0;
      for j=1:nro_competencia 
        pos = 0;
        while pos == 0
           n = randperm(size(poblacion,1),1);
          [tf, pos] = ismember(n,indiv);
        endwhile
        
        idx = pos;
        
        fitness_indiv = fitness(x(idx));
        if abs(fitness_indiv) > abs(fitness_competencia)
          fitness_competencia = fitness_indiv;
          idx_ganador = idx;
        endif
        
      endfor
      seleccion = [seleccion; indiv(idx_ganador)];
      
    endfor  
    
    % 4.2 Cruzar y mutar
    nuevos_indiv = [];
    while length(nuevos_indiv) < nro_hijos
      prob = rand();
      if prob < prob_cruza
        
        n = randperm(size(seleccion,1));
        prog1 = seleccion(n,1);
        prog2 = seleccion(n,1);
         
        
        bin_prog1 = dec2bin(prog1,nro_bits_individuo)';
        bin_prog2 = dec2bin(prog2,nro_bits_individuo)';
        
        punto_cruza = randperm(nro_bits_individuo,1);
        
        bin_hijo1 = [bin_prog1(1:punto_cruza) bin_prog2(punto_cruza+1:nro_bits_individuo)];
        bin_hijo2 = [bin_prog2(1:punto_cruza) bin_prog1(punto_cruza+1:nro_bits_individuo)];
      
        % mutamos
        
        prob1 = rand();
        prob2 = rand();
        punto_muta = randperm(nro_bits_individuo,1);
        [bin_hijo1, bin_hijo2] = mutador(prob1,prob2,punto_muta,prob_muta_indiv, bin_hijo1, bin_hijo2);

        hijo1 = bin2dec(bin_hijo1);
        hijo2 = bin2dec(bin_hijo2);
          
        nuevos_indiv = [nuevos_indiv; hijo1; hijo2];
          
     endif
      
    endwhile
    nuevos_indiv
    
    
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
        
         n = nueva_generacion(i);
        [tf, pos] = ismember(n,indiv);
        idx = pos;
        if idx != 0
          scatter(x(idx), func(x(idx)), 'k','linewidth',1.1); hold on;
        endif
      endfor
      scatter(x(idx_mejor), func(x(idx_mejor)), 'r','linewidth',1.2); hold on;
      
    endif
    pause(0.5); 
    
    % 4.6 Cortar si se cumple el criterio 
    
   
    poblacion = nueva_generacion; 
    [mejor, pos] = max(fitness(x(poblacion)));
    mejor = x(pos);
    
    lista_mejores = [lista_mejores;  x(pos)];
    if it >= 50 && median(lista_mejores(it-9:end)) == mejor
      it_final = it;
      break
    endif
  
  endfor

  [mejor, pos] = max(fitness(x(poblacion)));
  mejor = x(pos);
  
  
endfunction