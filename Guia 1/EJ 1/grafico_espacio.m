%% CASO OR ---------------------------------------------------------------------
figure;
axis([-2 2 -2 2]);
title('caso OR'); hold on;

datos=csvread('OR_trn.csv');
datos_test=csvread('OR_tst.csv');

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

xt=datos_test(:,1:2);
yt=datos_test(:,3);
for i=1:size(xt,1)
  if(yt(i)==1)
    scatter(xt(i,1),xt(i,2),'k'); hold on;
  else
    scatter(xt(i,1),xt(i,2),'r'); hold on;
  endif
endfor
pause(2);

[w]=train_g(x,y,nro_epocas,criterio,tasa_ap);

[dOR]=test(w,xt,yt);
disp(['   Desempeño: ',num2str(dOR*100),'%']);

%% CASO XOR --------------------------------------------------------------------
figure;
axis([-2 2 -2 2]);
title('caso XOR'); hold on;

datos=csvread('XOR_trn.csv');
datos_test=csvread('XOR_tst.csv');

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

xt=datos_test(:,1:2);
yt=datos_test(:,3);
for i=1:size(xt,1)
  if(yt(i)==1)
    scatter(xt(i,1),xt(i,2),'k'); hold on;
  else
    scatter(xt(i,1),xt(i,2),'r'); hold on;
  endif
endfor
pause(2);

[w]=train_g(x,y,nro_epocas,criterio,tasa_ap);

[dXOR]=test(w,xt,yt);
disp(['   Desempeño: ',num2str(dXOR*100),'%']);