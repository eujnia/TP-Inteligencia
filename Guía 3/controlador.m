function [q] = controlador(to, tref, c)
  
  err = tref - to;
  r = [1;2;3;4;5;6;7];
  [M,S] = par_M_S(c);
  [q]= reglas_borrosas(err,M,S,0,r);
   
endfunction
