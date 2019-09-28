datos=csvread('merval.csv');
datos_tempo=[];
for i=6:size(datos,1)
  datos_tempo=[datos_tempo; datos(i-5:i)'];
endfor
csvwrite('merval_temp.csv',datos_tempo);
datos_tempo
for i=1:size(datos_tempo,1)
  plot(i,datos_tempo(i,1)); hold on;
  plot(i,datos_tempo(i,2)); hold on;
  plot(i,datos_tempo(i,3)); hold on;
  plot(i,datos_tempo(i,4)); hold on;
  plot(i,datos_tempo(i,5)); hold on;
  plot(i,datos_tempo(i,6)); hold on;
endfor