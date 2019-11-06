%Ejercicio 4

datos=csvread('clouds.csv');
alto=20;
ancho=20;
nro_epocas=100;

w=SOM(alto, ancho, datos(1:3001,1:2), nro_epocas);
ww=[w(:,:,1); w(:,:,2)];
csvwrite("pesos.csv",ww);

clases_w = clasificar_SOM(w, datos(1:3001,:));
