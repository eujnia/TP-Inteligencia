datos=csvread('merval.csv');
datos_tempo=[];
for i=6:size(datos,1)
  datos_tempo=[datos_tempo; datos(i-5:i)'];
endfor
csvwrite('merval_temp.csv',datos_tempo);