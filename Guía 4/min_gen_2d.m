function [x_min, y_min] = min_gen_2d(funcion, x_ini_fin, y_ini_fin, nro_poblacion, nro_bits_individuo, nro_seleccion, 
                                     nro_competencia, prob_cruza, prob_muta_indiv, porcentaje_brecha, criterio_corte, 
                                     it_max)
%  |||
%  
%    Función que calcula el mínimo global de una función en 1d o en 2d.
%    
%    Entradas:
%      - funcion : función a evaluar.
%      - x_ini_fin : vector de dos valores que indicar el inicio y fin de los valores a evaluar en x.
%      - y_ini_fin : idem de x_ini_fin, para y.
%      - nro_poblacion : numero de individuos para la poblacion inicial.
%      - criterio_corte : criterio para terminar la busqueda, compara entre las últimas soluciones obtenidas.
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
  
  mejor_fitness = 0;
  f = @(x) -x .* sin(sqrt(x));  % Primera funcion del ejercicio
  fitness = @(x) 1/(f(x) + 500);% Funcion de fitness para la primer funcion del ejercicio
  for i=1:nro_poblacion
    
  
%  Ciclo que continua hasta que se cumple un criterio de comparacion entre resultados o se llega al nro maximo de iteraciones 
  for g=1:it_max
    
    
    
%    Seleccionar los individuos por el metodo de competencias
    seleccion = [];               % Individuos seleccionados para las posibles cruzas 
    
    for i=1:nro_seleccion
      competidores = [];  % Competidores para la seleccion i
      fitness_indiv = []; % Fitness de los individuos de la competencia
      for i=1:nro_competencia
        idx_indiv = randperm(nro_poblacion,:);                  % Indice del individuo que entra en la competencia
        competidores = [competidores; poblacion(idx_indiv,:)];  % Tomar el individuo
        fitness_indiv = [fitness_indiv; fitness(x(idx_indiv))]; % Tomar el fitness del individuo
      endfor
      [~,idx_ganador] = max(fitness_indiv);       % Seleccionar la posicion del competidor de mayor fitness
      seleccion = [seleccion; competidores(idx,:)]; % Guardar al competidor dentro de la seleccion
    endfor
    
    
    
%    Cruzas y mutaciones     
    for i=1:2:nro_seleccion     % Se van a cruzar (o no) cada dos individuos del vector 
      if (i!=nro_seleccion-1)
        prob = rand();          % Probabilidad de cruza
        if (prob <= prob_cruza)
          prog1 = seleccion(i,:);                                                       % Progenitor 1
          prog2 = seleccion(i+1,:);                                                     % Progenitor 2
          punto_cruza = randperm(nro_bits_individuo);                                   % Punto de cruza
          indiv1 = [prog1(1,1:punto_cruza) prog2(1,punto_cruza+1:nro_bits_individuo)];  % Hijo 1
          indiv2 = [prog2(1,1:punto_cruza) prog1(1,punto_cruza+1:nro_bits_individuo)];  % Hijo 1
          
          % Probabilidades de mutación de los hijos y mutaciones
          prob_muta1 = rand();                                                                
          prob_muta2 = rand();
          if (prob_muta1 <= prob_muta_indiv)
            idx_rand = randperm(nro_bits_individuo);
            if (indiv1(1,idx_rand)=="1")
              indiv1(1,idx_rand)="0";
            else
              indiv1(1,idx_rand)="1";
            endif
          endif
          if (prob_muta2 <= prob_muta_indiv)
            idx_rand = randperm(nro_bits_individuo);
            if (indiv2(1,idx_rand)=="1")
              indiv2(1,idx_rand)="0";
            else
              indiv2(1,idx_rand)="1";
            endif
          endif
          
          nueva_gen = [nueva_gen; indiv1; indiv2]; % Agregar los hijos a la nueva generacion
        endif
      endif
    endfor
    
    
    
  endfor
  
  
endfunction 