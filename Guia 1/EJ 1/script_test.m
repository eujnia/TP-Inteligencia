%% CASO OR ---------------------------------------------------------------------
datos=csvread('OR_trn.csv');

x=datos(:,1:2);
y=datos(:,3);
nro_epocas=10;
criterio=0.99;
tasa_ap=0.001;
disp(' ');
disp('  Caso OR:');
disp('    Datos:');
disp(['      Numero de epocas: ',num2str(nro_epocas)]);
disp(['      Criterio de finalizacion: ',num2str(criterio)]);
disp(['      Tasa de aplicacion: ',num2str(tasa_ap)]);

[w]=train(x,y,nro_epocas,criterio,tasa_ap);

datos_test=csvread('OR_tst.csv');

xt=datos_test(:,1:2);
yt=datos_test(:,3);

[dOR]=test(w,xt,yt);
disp(['   Desempeño: ',num2str(dOR*100),'%']);

%% CASO XOR --------------------------------------------------------------------
datos=csvread('XOR_trn.csv');

x=datos(:,1:2);
y=datos(:,3);
nro_epocas=10;
criterio=0.75;
tasa_ap=0.001;
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
disp(['   Desempeño: ',num2str(dXOR*100),'%']);