datos=csvread('concentlite.csv');
datos_trn=datos(1:500,:);
datos_tst=datos(501:size(datos,1),:);
cant_entradas=2;
dim_red=[8,7,1];
cant_epocas=500;
criterio=0.99;
tasa_apr=0.1;

[w,e2,desempenio_trn]=retropropagacion(datos_trn, cant_entradas, dim_red, cant_epocas, criterio, tasa_apr);
[desempenio_tst]=retropropagacion_tst(datos_tst, cant_entradas, dim_red, w);

%figure;
%semilogy([1:length(e2)],e2); hold on;
%title('error cuadratico total entrenamiento concentlite');

desempenio_trn
desempenio_tst