alto=10;
ancho=10;
datos=csvread('te.csv');
nro_epocas=10;
SOM(alto, ancho, datos, nro_epocas);

alto=10;
ancho=10;
datos=csvread('circulo.csv');
nro_epocas=10;
SOM(alto, ancho, datos, nro_epocas);

alto=100;
ancho=1;
datos=csvread('te.csv');
nro_epocas=10;
SOM(alto, ancho, datos, nro_epocas);
