datos=csvread('concentlite.csv');
datos_trn=datos(1:500,:);
datos_tst=datos(501:size(datos,1),:);
cant_entradas=2;
dim_red=[8,7,1];
cant_epocas=1000;
criterio=0.8;
tasa_apr=0.1;

coef_momento1=0.5;
coef_momento2=0.6;
coef_momento3=0.7;

we={rand(dim_red(1),cant_entradas+1)-0.5};
for i=2:length(dim_red)
  we=[we rand(dim_red(i),dim_red(i-1)+1)-0.5];
endfor

[w1,e2_m1,desempenio_trn_m1]=retropropagacion_momento(datos_trn, cant_entradas, dim_red, cant_epocas, criterio, tasa_apr, coef_momento1,we);
[w2,e2_m2,desempenio_trn_m2]=retropropagacion_momento(datos_trn, cant_entradas, dim_red, cant_epocas, criterio, tasa_apr, coef_momento2,we);
[w3,e2_m3,desempenio_trn_m3]=retropropagacion_momento(datos_trn, cant_entradas, dim_red, cant_epocas, criterio, tasa_apr, coef_momento3,we);

[desempenio_tst_m1]=retropropagacion_tst(datos_tst, cant_entradas, dim_red, w1);
[desempenio_tst_m2]=retropropagacion_tst(datos_tst, cant_entradas, dim_red, w2);
[desempenio_tst_m3]=retropropagacion_tst(datos_tst, cant_entradas, dim_red, w3);


[w,e2,desempenio_trn]=retropropagacion(datos_trn, cant_entradas, dim_red, cant_epocas, criterio, tasa_apr, we);
[desempenio_tst]=retropropagacion_tst(datos_tst, cant_entradas, dim_red, w);

figure;
semilogy([1:length(e2)],e2,'linewidth',1.2,[1:length(e2_m1)],e2_m1,'linewidth',1.2,[1:length(e2_m2)],e2_m2,'linewidth',1.2,[1:length(e2_m3)],e2_m3,'linewidth',1.2); hold on;
title('error cuadratico total entrenamiento con y sin momento');
legend('sin momento','momento 0.5','momento 0.6','momento 0.7');

desempenio_trn_m1
desempenio_tst_m1

desempenio_trn_m2
desempenio_tst_m2

desempenio_trn_m3
desempenio_tst_m3

desempenio_trn
desempenio_tst