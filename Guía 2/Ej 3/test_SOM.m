alto=10;
ancho=10;
datos=csvread('te.csv');
nro_epocas=1000;
radio=5;
tasa=0.1;

SOM(alto, ancho, datos, nro_epocas, radio, tasa);