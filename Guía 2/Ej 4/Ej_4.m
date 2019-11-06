%Ejercicio 4

datos=csvread('clouds.csv');
alto=10;
ancho=10;
nro_epocas=100;

SOM(alto, ancho, datos(1:3001,1:2), nro_epocas)