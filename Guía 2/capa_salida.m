 function [desempenio]=capa_salida(trn,tst,cant_entradas,nro_epocas,criterio,tasa_apr)
   
   x_trn=trn(:,1:cant_entradas);
   y_trn=trn(:,cant_entradas+1:end);
   
   x_tst=tst(:,1:cant_entradas);
   y_tst=tst(:,cant_entradas+1:end);
   
   % entrenamiento del percceptrón simple
   [w] = train(x_trn,y_trn,nro_epocas,criterio,tasa_apr);
   
   % prueba del perceptron
   [desempenio] = test(w,x_tst,y_tst);
   
 endfunction