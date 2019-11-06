%Ejercicio 4

datos=csvread('clouds.csv');
alto=10;
ancho=10;
nro_epocas=30;

SOM(alto, ancho, datos(3001,1:3), nro_epocas)