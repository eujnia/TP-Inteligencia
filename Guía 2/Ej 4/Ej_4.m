%Ejercicio 4

datos=csvread('clouds.csv');

mapa=csvread('mapa_som.csv');
etiqueta=csvread('etiqueta_som.csv');

[s,d]=SOM(datos(3001,1:3), alto, ancho, mapa, etiqueta)