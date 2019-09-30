function [y] = defuzzificacion(conjunto_salida,tipo,a)
  
  cant_fila = size(conjunto_salida,1);
  y_cg = [];
  A = [];
  Atot = 0;
  y=0; 
    
  if tipo == 0 %trapezoidal
    for i = 1:cant_fila
      conjunto_actual = conjunto_salida(i,:);
      y_cg(i)=(conjunto_actual(1) +conjunto_actual(2)*4 +conjunto_actual(4))/6;
      A(i)=(conjunto_actual(4)-conjunto_actual(1))*a(i); 
      Atot += A(i);   
    
      y += y_cg(i)*A(i);
    endfor 
    y = y / Atot;
     
  endif
  if tipo == 1 %gousian
    for i = 1:cant_fila
      conjunto_actual = conjunto_salida(i,:);
    %  y_cg(i)=sum(conjunto_actual)/4;
     % A(i) = sigma*(2*pi)^0.5;
    endfor
    
  endif
  
  
endfunction
