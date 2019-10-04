function [to] = acondicionador(q,to_ant)
  % constantes
  ag=40/41;
  ti=15;
  
  % calcular la nueva salida
  to = ti + ag*q + ag*(to_ant - ti);
endfunction  