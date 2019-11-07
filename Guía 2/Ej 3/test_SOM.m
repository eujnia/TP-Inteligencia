alto=20;
ancho=20;
datos=csvread('circulo.csv');
nro_epocas=100;
SOM(alto, ancho, datos, nro_epocas);


alto=20;
ancho=20;
datos=csvread('te.csv');
nro_epocas=100;
SOM(alto, ancho, datos, nro_epocas);

alto=400;
ancho=1;
datos=csvread('te.csv');
nro_epocas=100;
SOM(alto, ancho, datos, nro_epocas);
