function [q] = controlador_temperatura(to, tref)
  g=a=40/41;
  tref = zeros(200,1) + 25;
  tref(1:31,1) =  tref(1:30,1) - 10;
  %q = [-7,7]
  q=;
  ti=15;
  
  to(1)=15;
  for n=2:200
     to(n) = ti + gq + a*(to(n-1) − ti);
     e = tref(n)-to(n);
  endfor
  
  
  endfunction
