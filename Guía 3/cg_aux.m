function [y_cg]= cg_aux(conjunto_x, a);
  y_cg=0;
  for i = 1:4
    y_cg += conjunto_x(i);
  endfor
  y_cg= y_cg / 4;
  y_cg = y_cg * a ;
endfunction

  