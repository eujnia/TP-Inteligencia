datos=csvread('merval_temp.csv');
datos_trn=datos(1:400,:);
datos_tst=datos(401:end,:);
csvwrite('merval_temp_trn.csv',datos_trn);
csvwrite('merval_temp_tst.csv',datos_tst);
cant_entradas=5;
k=100;
nro_epocas=500;
tasa_apr=0.1;
criterio_corte=0.7;

desempenio = RBF('merval_temp_trn.csv', 'merval_temp_tst.csv', cant_entradas, k, nro_epocas, tasa_apr, criterio_corte)