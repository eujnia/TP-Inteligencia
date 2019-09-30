function [y] = defuzzificacion(conjunto_salida,tipo,a)
  
  cant_fila = size(conjunto_salida,1);
  y_cg = zeros(cant_fila,1);
  tipo = 0;
  Atot = 0;

  for i = 1:cant_fila
   conjunto_actual = conjunto_salida(i,:);
   
   m_eval = membresia(conjunto_actual,tipo,conjunto_actual);
   if a(i) != 0
     m_escala = a(i)*m_eval;
     
     y_cg(i) = cg_aux(conjunto_actual, a(i));
   #  A(i) = area(conjunto_actual, m_escala);
     
    # Atot += A(i);
   endif

   
  endfor
  y_cg
 #  y = y_cg.*A;
 #  y = y / A_tot;
  
endfunction
