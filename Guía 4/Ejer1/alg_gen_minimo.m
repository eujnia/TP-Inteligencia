function [mejor, lista_mejores, it] = alg_gen_minimo(caso, x_ini_fin, y_ini_fin, nro_poblacion, nro_bits_individuo, nro_seleccion, 
                                          nro_competencia, prob_cruza, prob_muta_indiv, porcentaje_brecha, criterio_corte, 
                                          ventana, it_max)
  
    % 0. Parámetros iniciales
    switch caso
    case 1
      func = @(x) -x .* sin(sqrt(abs(x)));
%      fitness = @(x) 450./((-x .* sin(sqrt(abs(x)))) + 450); 
      fitness = @(x) exp(-(((x-424)/212).^2)); % gaussiana -> mejor convergencia
    case 2
      func = @(x) x + 5*sin(3*x) + 8*cos(5*x);
%      fitness = @(x) 10./((x + 5*sin(3*x) + 8*cos(5*x)) + 10); 
      fitness = @(x) exp(-(((x-1.8)/1.8).^2)); % gaussiana -> mejor convergencia
    case 3
      func = @(x,y) (x.^2 + y.^2).^(0.25) .* [(sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1];
%      fitness = @(x,y) 1./(((x.^2 + y.^2).^(0.25) .* ((sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1)) + 1); 
      fitness = @(x,y) exp(-(((x/50).^2)+((y/50).^2))); % gaussiana -> mejor convergencia
    endswitch
  
    nro_hijos = round((1-porcentaje_brecha) * nro_poblacion) - 1;
    lista_mejores = [];
    poblacion = [];
    fitness_mejor = 0;
    if caso != 3
      nro_individuos = 2^nro_bits_individuo;
    else
      nro_individuos = 2^(nro_bits_individuo/2);
    endif
    
    
    % 1. Generar individuos
    % Los índices de x representan la codificacion y los valores el correspondiente valor en x
    if caso != 3
      x = linspace( x_ini_fin(1), x_ini_fin(2), nro_individuos );
    else
      x = linspace( x_ini_fin(1), x_ini_fin(2), nro_individuos );
      y = linspace( y_ini_fin(1), y_ini_fin(2), nro_individuos );
    endif
    
   
   
    % 2. Asignar poblacion inicial
    for i=1:nro_poblacion
      if caso != 3
        idx = randperm(nro_individuos, 1);
        poblacion = [poblacion; idx-1];
        if fitness(x(idx)) > fitness_mejor
          idx_mejor = idx;
          fitness_mejor = fitness(x(idx));
        endif
      else
        % Hay que calcular los indices por separados para que se de el caso en que son iguales
        idx_x = randperm(nro_individuos/2, 1);
        idx_y = randperm(nro_individuos/2, 1);
        poblacion = [poblacion; idx_x-1, idx_y-1];
        if fitness(x(idx_x),y(idx_y)) > fitness_mejor
          idx_mejor = [idx_x idx_y];
          fitness_mejor = fitness(x(idx_x),y(idx_y));
        endif
      endif
    endfor
    lista_mejores = idx_mejor;
  
  
  
  % 3. Graficar poblacion
%    figure;
    if caso != 3
      x_plot = linspace(x_ini_fin(1), x_ini_fin(2), 1000);
      plot(x_plot, func(x_plot), 'b', 'linewidth',1.1); hold on;
      scatter(x(poblacion+1), func(x(poblacion+1)), 'k','linewidth',1.1); hold on;
      scatter(x(idx_mejor), func(x(idx_mejor)), 'r','linewidth',1.2); hold on;
    else
      x_plot = linspace(x_ini_fin(1), x_ini_fin(2), 1000);
      y_plot = linspace(y_ini_fin(1), y_ini_fin(2), 1000);
      [coord_x, coord_y] = meshgrid(x_plot, y_plot);
      contour(coord_x, coord_y, func(coord_x, coord_y), 5); hold on;
      scatter(x(poblacion(:,1)+1), y(poblacion(:,2)+1), func(x(poblacion(:,1)+1), y(poblacion(:,2)+1)), 'k','linewidth',1.1); hold on;
      scatter(x(idx_mejor(1)), y(idx_mejor(2)), func(x(idx_mejor(1)),y(idx_mejor(2))), 'r','linewidth',1.2); hold on;
    endif


    
  % 4. Iterar hasta el máximo de iteraciones
  for it=1:it_max
    
    
    
    % 4.1 Seleccionar progenitores
    seleccion = [];
    for i=1:nro_seleccion    
      if caso != 3
        % Tomar competidores
        % El indice corresponde a la poblacion
        % El nro de poblacion es por los valores que se asigna de forma aleatoria
        % El nro de competencia x la cantidad de elementos a tomar
        idx_comp = randperm(nro_poblacion, nro_competencia);  
        % Tomar competidores a partir de la poblacion
        competencia = poblacion(idx_comp);
        % Tomar la posicion del mejor competidor
        [~,mejor]=max(fitness(x(competencia+1)));
        seleccion = [seleccion; competencia(mejor)];
      else
        idx_comp = randperm(nro_poblacion, nro_competencia);
        competencia = poblacion(idx_comp,:);
        [~,mejor]=max(fitness(x(competencia(:,1)+1),y(competencia(:,2)+1)));
        seleccion = [seleccion; competencia(mejor,:)];    
      endif
    endfor  
    
    
    
    % 4.2 Cruzar y mutar
    nuevos_indiv = [];
    while length(nuevos_indiv) < nro_hijos
      prob = rand();
      if prob < prob_cruza
        
        n = randperm(size(seleccion,1),2);
        prog1 = seleccion(n(1),:);
        prog2 = seleccion(n(2),:);
          
        if caso != 3
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
        else
          bin_prog1_x = dec2bin(prog1(1),nro_bits_individuo/2); % parte x
          bin_prog1_y = dec2bin(prog1(2),nro_bits_individuo/2); % parte y
          bin_prog2_x = dec2bin(prog2(1),nro_bits_individuo/2);
          bin_prog2_y = dec2bin(prog2(2),nro_bits_individuo/2);
          
          bin_prog1 = [bin_prog1_x bin_prog1_y];
          bin_prog2 = [bin_prog2_x bin_prog2_y];
          
          punto_cruza = randperm(nro_bits_individuo,1);
          
          bin_hijo1 = [bin_prog1(1:punto_cruza) bin_prog2(punto_cruza+1:nro_bits_individuo)];
          bin_hijo2 = [bin_prog2(1:punto_cruza) bin_prog1(punto_cruza+1:nro_bits_individuo)];
          
          % mutamos
          prob1 = rand();
          prob2 = rand();
          punto_muta = randperm(nro_bits_individuo,1);
          [bin_hijo1, bin_hijo2] = mutador(prob1,prob2,punto_muta,prob_muta_indiv, bin_hijo1, bin_hijo2);

          hijo1_x = bin2dec(bin_hijo1(1:length(bin_hijo1)/2));
          hijo1_y = bin2dec(bin_hijo1(length(bin_hijo1)/2+1:end));
          hijo2_x = bin2dec(bin_hijo2(1:length(bin_hijo2)/2));
          hijo2_y = bin2dec(bin_hijo2(length(bin_hijo2)/2+1:end));          
          
          nuevos_indiv = [nuevos_indiv; [hijo1_x hijo1_y]; [hijo2_x hijo2_y]];
        endif
        
     endif  
    endwhile
    
    
    % 4.3 Armar nueva generacion
    nueva_generacion = nuevos_indiv;
    nueva_generacion = [nueva_generacion; idx_mejor];
    while length(nueva_generacion) < nro_poblacion
      nueva_generacion = [nueva_generacion; poblacion(randperm(nro_poblacion,1),:)];
    endwhile
    poblacion = nueva_generacion;
    
    
    
    % 4.4 Evaluar nueva generación
    if caso != 3
       [fitness_pob, idx_pob] = max(fitness(x(poblacion+1)));
        if fitness_pob > fitness_mejor
          idx_mejor = poblacion(idx_pob)+1;
          fitness_mejor = fitness_pob;
        endif
       lista_mejores = [lista_mejores; idx_mejor];
    else
      [fitness_pob, idx_pob] = max(fitness(x(poblacion(:,1)+1),y(poblacion(:,2)+1)));
        if fitness_pob > fitness_mejor
          idx_mejor = [poblacion(idx_pob,1)+1 poblacion(idx_pob,2)+1];
          fitness_mejor = fitness_pob;
        endif
       lista_mejores = [lista_mejores; idx_mejor];
    endif
    
    % 4.5 Graficar resultados
    if caso != 3
      hold off;
      plot(x_plot, func(x_plot), 'b', 'linewidth',1.1); hold on;
      scatter(x(poblacion+1), func(x(poblacion+1)), 'k','linewidth',1.1); hold on;
      scatter(x(idx_mejor), func(x(idx_mejor)), 'r','linewidth',1.2); hold on;
    else
      hold off;
      contour(coord_x, coord_y, func(coord_x, coord_y), 5); hold on;
      scatter(x(poblacion(:,1)+1), y(poblacion(:,2)+1), func(x(poblacion(:,1)+1), y(poblacion(:,2)+1)), 'k','linewidth',1.1); hold on;
      scatter(x(idx_mejor(1)), y(idx_mejor(2)), func(x(idx_mejor(1)),y(idx_mejor(2))), 'r','linewidth',1.2); hold on;
      
    endif
    title(strcat("Iteracion: ",num2str(it)));
    pause(0.5); 
    
    
    
    % 4.6 Cortar si se cumple el criterio  
    if size(lista_mejores,1) >= ventana
      mejor_final = lista_mejores(end,:);
      iguales = 1;
      for i=size(lista_mejores,1)-ventana+1:size(lista_mejores,1)-1
        if mejor_final != lista_mejores(i,:)
          iguales = 0;
        endif
      endfor
      if iguales
        break;
      endif
    endif
 
  endfor
  
  % 5. Resultados
  if caso != 3
    mejor = x(idx_mejor);
    lista_mejores = fitness(x(lista_mejores));
  else
    mejor = [x(idx_mejor)];
    lista_mejores = fitness(x(lista_mejores(:,1)), y(lista_mejores(:,2)));
  endif
  
endfunction