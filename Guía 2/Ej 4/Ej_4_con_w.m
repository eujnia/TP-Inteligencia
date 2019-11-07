%Ejercicio 4 - dados los pesos, solamente clasificar

datos=csvread('clouds.csv');
wx=csvread("pesos_1x.csv");
wy=csvread("pesos_1y.csv");

w=zeros(size(w,2),size(w,2),2);
for i = size(w,1)
  for j = size(w,2)
    w(i,j,1)=wx(i,j);
    w(i,j,2)=wy(i,j);
  endfor
endfor


% clases_w matriz con la clase que le corresponde a cada neurona
clases_w = clasificar_SOM(w, datos(1:3000,:));

% toma un SOM clasificado y unos datos y devuelve la clasificacion
[y] = clasificador_SOM(datos(3001:end,1:2), w, clases_w);

% ver desempenio
desemp=0;
yd = datos(3001:end,3);
for i=1:length(y)
  if y(i)==yd(i)
    desemp += 1;
  endif
endfor
desempenio=desemp/length(y);

disp(strcat("Desempenio clasificador: ",num2str(desempenio)));
 