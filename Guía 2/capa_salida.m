 function [desempenio]=capa_salida(trn,tst,cant_entradas,nro_epocas,criterio,tasa_apr)
   
   % entrenamiento del percceptrón simple
   [w] = train(trn(1:cant_entradas),trn(cant_entradas+1:end),nro_epocas,criterio,tasa_apr);
   
   % prueba del perceptron
   [desempenio] = test(w,tst(1:cant_entradas),tst(cant_entradas+1:end));
   
 endfunction