function [q] = controlador(to_act, to_ant, tref)
  g=a=40/41; %dato
  %q puede estar entre [-7,7], capaz que tenga que ver con que las matrices S tienen ese dominio también
    q = (to_act - a*(to_ant − ti) - ti)/g; % formula del apunte 
   [q]= reglas_borrosas( x ,M1,S1,r); %lo que deberíamos usar para calcular q realmente 
  %DUDAS:
  %que sería x? 
  %que hacemos con r? usamos el mismo que en el ejercicio 6?

  endfunction
