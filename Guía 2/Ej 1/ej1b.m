#Ejercicio 1 - Problema iris

datos=csvread('irisbin.csv');
datos_trn=datos(1:120,:);
datos_tst=datos(121:end,:);
csvwrite('irisbin_trn.csv',datos_trn);
csvwrite('irisbin_tst.csv',datos_tst);

cant_entradas=4;
nro_k=10;
nro_epocas=1000;
tasa_apr=0.01;
criterio_corte=0.95;
dim_red=[3,3,3,3];

#desempe�o con RBF
tic();
desempenio_iris_RBF = RBF('irisbin_trn.csv', 'irisbin_tst.csv', cant_entradas, nro_k, nro_epocas, tasa_apr, criterio_corte);
tiempo_RBF = toc();
tic();
#desempe�o con MLP
[w,~,~] = retropropagacion(datos_trn, cant_entradas, dim_red, nro_epocas, criterio_corte, tasa_apr);
desempenio_iris_MLP = retropropagacion_tst(datos_tst, cant_entradas, dim_red, w);
tiempo_MLP = toc();

desempenio_iris_RBF
tiempo_RBF
desempenio_iris_MLP
tiempo_MLP