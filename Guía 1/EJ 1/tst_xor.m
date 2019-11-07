%% CASO XOR --------------------------------------------------------------------
datos=csvread('XOR_trn.csv');

x=datos(:,1:2);
y=datos(:,3);
nro_epocas=30;
criterio=0.75;
tasa_ap=0.01;
disp(' ');
disp('  Caso XOR:');
disp('    Datos:');
disp(['      Numero de epocas: ',num2str(nro_epocas)]);
disp(['      Criterio de finalizacion: ',num2str(criterio)]);
disp(['      Tasa de aplicacion: ',num2str(tasa_ap)]);

[w]=train(x,y,nro_epocas,criterio,tasa_ap);

datos_test=csvread('XOR_tst.csv');

xt=datos_test(:,1:2);
yt=datos_test(:,3);

[dXOR]=test(w,xt,yt);
disp(['   Desempenio: ',num2str(dXOR*100),'%']);