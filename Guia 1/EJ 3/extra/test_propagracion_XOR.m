datos_trn=csvread('XOR_trn.csv');
datos_tst=csvread('XOR_tst.csv');
cant_entradas=2;
dim_red=[2,1];
cant_epocas=50;
criterio=0.1;
tasa_apr=0.1;

[w,e2_trn]=retropropagacion(datos_trn, cant_entradas, dim_red, cant_epocas, criterio, tasa_apr);
[e2_tst]=retropropagacion_tst(datos_tst, cant_entradas, dim_red, w);

figure;
plot([1:length(e2_trn)],e2_trn); hold on;
plot(e2_tst*ones(length(e2_trn),1));
title('error cuadratico total en XOR');
legend('error entrenamiento','error prueba');