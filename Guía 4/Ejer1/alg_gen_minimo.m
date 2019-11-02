function [mejor, lista_mejores, it] = alg_gen_minimo(caso, x_ini_fin, y_ini_fin, nro_poblacion, nro_bits_individuo, nro_seleccion, 
                                          nro_competencia, prob_cruza, prob_muta_indiv, porcentaje_brecha, criterio_corte, 
                                          ventana, it_max)
  
    % 0. Parámetros iniciales
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
  
    nro_individuos = 2^nro_bits_individuo; 
    nro_hijos = round((1-porcentaje_brecha) * nro_poblacion) + 1;
    lista_mejores = [];
    poblacion = [];
    fitness_mejor = 0;

  
    
    % 1. Generar individuos
    % Los índices de x representan la codificacion y los valores el correspondiente valor en x
    x = linspace( x_ini_fin(1), x_ini_fin(2), nro_individuos );
    
   
   
    % 2. Asignar poblacion inicial
    for i=1:nro_poblacion
      idx = randperm(nro_individuos, 1);
      poblacion = [poblacion; idx];
      if fitness(x(idx)) > fitness_mejor
        idx_mejor = idx;
        fitness_mejor = fitness(x(idx));
      endif
    endfor
    mejores_individuos = fitness_mejor;
  
  
  
  % 3. Graficar poblacion
    figure;
    x_plot = linspace(x_ini_fin(1), x_ini_fin(2), 1000);
    plot(x_plot, func(x_plot), 'b', 'linewidth',1.1); hold on;
    scatter(x(poblacion), func(x(poblacion)), 'k','linewidth',1.1); hold on;
    

    
  % 4. Iterar hasta el máximo de iteraciones
  for it=1:it_max
    
    
    
    % 4.1 Seleccionar progenitores
    seleccion = [];
    for i=1:nro_seleccion    
      % Tomar competidores
      % El indice corresponde a la poblacion
      % El nro de poblacion es por los valores que se asigna de forma aleatoria
      % El nro de competencia x la cantidad de elementos a tomar
      idx_comp = randperm(nro_poblacion, nro_competencia);  
      % Tomar competidores a partir de la poblacion
      competencia = poblacion(idx_comp);
      % Tomar la posicion del mejor competidor
      [~,mejor]=max(fitness(x(competencia)));
      seleccion = [seleccion; competencia(mejor)];
    endfor  
    
    
    
    % 4.2 Cruzar y mutar
    nuevos_indiv = [];
    while length(nuevos_indiv) < nro_hijos
      prob = rand();
      if prob < prob_cruza
        
        n = randperm(length(seleccion),2);
        prog1 = seleccion(n(1),1);
        prog2 = seleccion(n(2),1);
        
        bin_prog1 = dec2bin(prog1,nro_bits_individuo);
        bin_prog2 = dec2bin(prog2,nro_bits_individuo);
        
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
    
    
    
    % 4.3 Armar nueva generacion
    nueva_generacion = nuevos_indiv;
    nueva_generacion = [nueva_generacion; idx_mejor];
    while length(nueva_generacion) < nro_poblacion
      nueva_generacion = [nueva_generacion; poblacion(randperm(nro_poblacion,1))];
    endwhile
    poblacion = nueva_generacion;
    
    
    
    % 4.4 Evaluar nueva generación
    if caso == 3
    
    else
      [fitness_pob, idx_pob] = max(fitness(x(poblacion)));
      if fitness_pob > fitness_mejor
        idx_mejor = idx_pob;
        fitness_mejor = fitness_pob;
      endif
      mejores_individuos = [mejores_individuos; fitness_mejor];
    endif
    
    % 4.5 Graficar resultados
    if caso == 3
    
    else
      hold off;
      plot(x_plot, func(x_plot), 'b', 'linewidth',1.1); hold on;
      scatter(x(poblacion), func(x(poblacion)), 'k','linewidth',1.1); hold on;
      scatter(x(idx_mejor), func(x(idx_mejor)), 'r','linewidth',1.2); hold on;
      
    endif
    title(strcat("Iteracion: ",num2str(it)));
    pause(0.5); 
    
    
    
    % 4.6 Cortar si se cumple el criterio  
%    [mejor, pos] = max(fitness(x(poblacion)));
%    mejor = x(pos);
%    
%    lista_mejores = [lista_mejores;  x(pos)];
%    if it >= 50 && median(lista_mejores(it-9:end)) == mejor
%      it_final = it;
%      break
%    endif
%  
  endfor
%
%  [mejor, pos] = max(fitness(x(poblacion)));
%  mejor = x(pos);
  
endfunction