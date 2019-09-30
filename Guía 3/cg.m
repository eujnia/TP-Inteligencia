function [y_cg]= cg(conjunto_x);
  y_cg=0;
  for i = 1:4
    y_cg += conjunto_x(i);
  endfor
  y_cg= y_cg / 4;
  
  
  %forma 2
  A=0;
  y_cg1=0; 
  for i = 1:3
    if conjunto_x(i) != conjunto_x(i+1)
      if i == 1 
        x_cg=conjunto_x(i) + conjunto_x(i+1) + conjunto_x(i+1);
        x_cg=x_cg /3;
        A_aux=(conjunto_x(i+1) - conjunto_x(i))/2;
      endif
      if i == 2 
        x_cg=conjunto_x(i) + conjunto_x(i+1);
        x_cg = x_cg /2;
        A_aux=conjunto_x(i+1) - conjunto_x(i);
      endif
      if i == 3
        x_cg=conjunto_x(i) + conjunto_x(i+1) + conjunto_x(i+1);
        x_cg = x_cg /3;
        A_aux=(conjunto_x(i+1) - conjunto_x(i))/2;
      endif  
      x_cg
      A += A_aux;    
      y_cg1 += A_aux*x_cg;
    endif
  endfor
  y_cg1 = y_cg1/A;
  
endfunction
