
datos = csvread('concentlite.csv');
d=[];
for i=1:size(datos,1)
  d=[d; sqrt((datos(i,1)-0.5)^2+(datos(i,2)-0.5)^2)];
endfor
d_trn=d(1:700);
d_tst=d(701:length(d));
yd_trn=datos(1:700,3);
yd_tst=datos(701:length(d),3);

[w]=train(d_trn,yd_trn,100,0.99,0.1);
[desempenio_prom] = test(w,d_tst,yd_tst) 