function [x_min, y_min, mejores_resultados] = min_gen_2d(funcion, x_ini_fin, y_ini_fin, nro_poblacion, nro_bits_individuo, nro_seleccion, 
                                     nro_competencia, prob_cruza, prob_muta_indiv, porcentaje_brecha, criterio_corte, 
                                     ventana, it_max)
%  |||
%  
%    Función que calcula el mínimo global de una función en 1d o en 2d.
%    
%    Entradas:
%      - funcion : función a evaluar.
%      - x_ini_fin : vector de dos valores que indicar el inicio y fin de los valores a evaluar en x.
%      - y_ini_fin : idem de x_ini_fin, para y.
%      - nro_poblacion : numero de individuos para la poblacion total.
%      - nro_bits_individuo : numero de bits que contiene el individuo.
%      - nro_seleccion : VERLO
%      - nro_competencia : cantidad de elementos tomados para la competencia
%      - prob_cruza : probabilidad de cruzar dos individuos
%      - prob_muta_indiv : probabilidad de mutacion por individuo (por gen)
%      - porcentaje_brecha : porcentaje de padres que pasan a la nueva generacion
%      - criterio_corte : criterio para terminar la busqueda, compara entre las últimas soluciones obtenidas.
%      - ventana : cantidad de muestras en donde evaluar si la solucion no cambia
%      - it_max : numero maximo de iteraciones.
%      
%    Salidas:
%      - x_min : Coordenada x del minimo.
%      - y_min : Coordenada y del minimo.
%  
%  |||
  

  
%  Se codifican los individuos de acuerdo a la cantidad de bits definida
%  Los individuos son cadenas de caracteres que representan un número binario,
%  se guardan en indiv
%  Los valores de x se corresponden por el índice en filas de los individuos
  x = linspace( x_ini_fin(1), x_ini_fin(2),  2^nro_bits_individuo )';
  indiv = [];
  for i = 1:2^nro_bits_individuo
    % dec2bin pasa de decimal a cadena de caracteres binarios, con cant_bits_individuo se agregan ceros al frente
    indiv = [indiv; dec2bin( i-1, nro_bits_individuo )]; 
  endfor
  
  
  
%  Inicialización aleatoria de la población
  poblacion = [];
  for i=1:nro_poblacion
    poblacion = [poblacion; indiv(randperm(2^nro_bits_individuo),:)];
  endfor
  
  mejores_resultados = [];
  mejor_fitness = 0;
  idx_mejor_fitness = 0;
  fitness = @(x) 1./(funcion(x) + 500);% Funcion de fitness para la primer funcion del ejercicio
  for i=1:nro_poblacion
    
    for j=1:2^nro_bits_individuo
      if indiv(j,:) == poblacion(i,:)
        idx = j;
      endif
    endfor
    
    fitness_eval = fitness(x(idx));
    if fitness_eval > mejor_fitness
      mejor_fitness = fitness_eval;
      idx_mejor_fitness = idx;
    endif
  endfor
  
%  Parametros para graficar
  figure;
  x_plot = [x_ini_fin(1):1:x_ini_fin(2)];
  plot(x_plot,funcion(x_plot), 'b','linewidth',1.2); hold on;
  for i=1:nro_poblacion
    for j=1:2^nro_bits_individuo
      if indiv(j,:) == poblacion(i,:)
        idx = j;
      endif
    endfor
    scatter(x(idx),funcion(x(idx)), 'k','linewidth',1.5); hold on;
  endfor
  
  nro_brecha = round(porcentaje_brecha * nro_poblacion);
  nro_hijos = nro_poblacion - nro_brecha - 1;
  
%  Ciclo que continua hasta que se cumple un criterio de comparacion entre resultados o se llega al nro maximo de iteraciones 
  for g=1:it_max
    
    
    
%    Seleccionar los individuos por el metodo de competencias
    seleccion = [];               % Individuos seleccionados para las posibles cruzas 
    
    for i=1:nro_seleccion
      competidores = [];  % Competidores para la seleccion i
      fitness_indiv = []; % Fitness de los individuos de la competencia
      for i=1:nro_competencia
        idx_indiv = randperm(nro_poblacion);                  % Indice del individuo que entra en la competencia
        competidores = [competidores; poblacion(idx_indiv,:)];  % Tomar el individuo
        
        for j=1:2^nro_bits_individuo
          if indiv(j,:) == poblacion(i,:)
            idx = j;
          endif
        endfor
%        poblacion(i,1)*2^4  + 
        
        fitness_indiv = [fitness_indiv; fitness(x(idx))]; % Tomar el fitness del individuo
      endfor
      [~,idx_ganador] = max(fitness_indiv);       % Seleccionar la posicion del competidor de mayor fitness
      seleccion = [seleccion; competidores(idx,:)]; % Guardar al competidor dentro de la seleccion
    endfor
    
%    Cruzas y mutaciones 
    nueva_generacion  = [];
    while ( size(nueva_generacion,1) < nro_hijos )
      prog1 = seleccion(randperm(size(seleccion,1)),:);
      prog2 = seleccion(randperm(size(seleccion,1)),:); % puede tener hijos él mismo
      punto_cruza = randperm(nro_bits_individuo);
      indiv1 = [prog1(1,1:punto_cruza) prog2(1,punto_cruza+1:nro_bits_individuo)];
      indiv2 = [prog2(1,1:punto_cruza) prog1(1,punto_cruza+1:nro_bits_individuo)];
      indiv1 = mutacion(indiv1, prob_muta_indiv);
      indiv2 = mutacion(indiv2, prob_muta_indiv);      
      nueva_generacion = [nueva_generacion; indiv1; indiv2];
      
    endwhile
    
%    Rellenar con la brecha y el mejor individuo
    nueva_generacion = [nueva_generacion; poblacion(idx_mejor_fitness,:)];
    
    for i=1:nro_brecha
      nueva_generacion = [nueva_generacion; seleccion(randperm(size(seleccion,1)),:);];
    endfor
    
%    Evaluar nueva_generacion
    for i=1:size(nueva_generacion,1)
      
      for j=1:2^nro_bits_individuo
        if indiv(j,:) == nueva_generacion(i,:)
          idx = j;
        endif
      endfor
      
      fitness_eval = fitness(x(idx));
      if fitness_eval > mejor_fitness
        mejor_fitness = fitness_eval;
        idx_mejor_fitness = idx;
      endif
    endfor
    
%    Evaluar finalización del algoritmo
    mejores_resultados = [mejores_resultados; x(idx)];
    if size(mejores_resultados,1)>ventana
      desvio = std(mejores_resultados(size(mejores_resultados,1)-ventana:size(mejores_resultados,1)));    
      if ( desvio < criterio_corte )
           x_min = x(idx);
           break;
      endif
    endif
    
%    Graficar
    hold off;
    plot(x_plot,funcion(x_plot),'b', 'linewidth', 1.2); hold on;
    for i=1:nro_poblacion
      for j=1:2^nro_bits_individuo
        if indiv(j,:) == nueva_generacion(i,:)
          idx = j;
        endif
      endfor
      scatter(x(idx),funcion(x(idx)),'k','linewidth',1.3); hold on;
    endfor
    scatter(mejores_resultados(size(mejores_resultados)),funcion(mejores_resultados(size(mejores_resultados))),'r','linewidth',1.3); hold on;
    titulo = strcat("Iteracion: ", num2str(g));    
    title(titulo); hold on;
    pause(.5);
    
  endfor
  
endfunction 