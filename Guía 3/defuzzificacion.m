function [y] = defuzzificacion(conjunto_salida,tipo,a)
  
  cant_fila = size(conjunto_salida,1);
  y_cg = zeros(cant_fila);
  tipo = 0;
  
  for i = 1:cant_fila
   conjunto_actual = conjunto_salida(i,:);
  
  m_eval = membresia(conjunto_actual,tipo,conjunto_actual);
  y_cg(i) = cg(conjunto_actual, m_eval);
   

  endfor
  
  for i = 1:cant_fila
    y(i) = y_g.*a;
    y(i) /= a;
  endfor
  
endfunction
