%Ejercicio 4

datos=csvread('clouds.csv');
alto=20;
ancho=20;
nro_epocas=10;

w=SOM(alto, ancho, datos(1:3000,1:2), nro_epocas);
ww=[w(:,:,1); w(:,:,2)];
csvwrite("pesos.csv",ww);
w=csvread("pesos.csv");
w_aux=w;
w=zeros(size(w,2),size(w,2),2);
w(:,:,1)=w_aux(1:size(w,1),:);
w(:,:,2)=w_aux(size(w,1)+1:end,:);

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

disp(strcat("Desempeño clasificador: ",num2str(desempenio)));

%figure;
%title("Resultado clasificador"); hold on;
%for i=1:size(datos,1)
%  if i>3000
%    
%    if datos(i,3)==0 && datos(i,3)==y(i-3000)
%      scatter(datos(i,1), datos(i,2), "k", "o"); hold on;
%    else
%      scatter(datos(i,1), datos(i,2), "r", "o"); hold on;
%    endif
%    
%    if datos(i,3)==1 && datos(i,3)==y(i-3000)
%      scatter(datos(i,1), datos(i,2), "b", "x"); hold on;
%    else
%      scatter(datos(i,1), datos(i,2), "m", "x"); hold on;
%    endif
%    
%  else
%    
%    if datos(i,3)==0
%      scatter(datos(i,1), datos(i,2), "k", "o"); hold on;
%    else
%      scatter(datos(i,1), datos(i,2), "b", "x"); hold on;
%    endif
%    
%  endif
%endfor