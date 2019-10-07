function [y] = defuzzificacion(conjunto_salida,tipo,a)
  
  % cantidad de conjuntos de salida
  cant_fila = size(conjunto_salida,1);
  % inicialización en cero de la suma de centroides por áreas
  y_cg = 0;
  % inicialización en cero del área total
  Atot = 0;
  % por las dudas
  y = 0;
    
  % condicional de acuerdo a si usamos trapecios o gaussianas
  if tipo == 0
    for i=1:cant_fila
      % se usa el índice i no r(i) porque ese corresponde solo a las funciones de activación
      conjunto_actual = conjunto_salida(i,:);
      centro_masa_actual = centro_masa(conjunto_actual);
      % esto es área por activación, de acuerdo al mapeo de las reglas en r
      area_membresia = a(i)*area_trapecio(conjunto_actual);
      % suma de centros por áreas
      y_cg += centro_masa_actual*area_membresia;
      % suma de áreas
      Atot += area_membresia;
    endfor
    if Atot != 0
      y = y_cg/Atot;
    endif
    
  else
    % same que arriba pero para gaussianas
    for i=1:cant_fila
      conjunto_actual = conjunto_salida(i,:);
      % la media es el centroide que corresponde al primer elemento de los que definen el conjunto
      centro_masa_actual = conjunto_actual(1);
      % el área es desvio*(2pi)^(1/2), el segundo elemento que define el conjunto es el desvío
      area_membresia = a(i)*conjunto_actual(2)*(2*pi)^(1/2);
      y_cg += centro_masa_actual*area_membresia;
      Atot += area_membresia;
    endfor
    if Atot != 0
      y = y_cg/Atot;
    endif
  
  endif
  
endfunction

