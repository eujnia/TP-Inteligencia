alto=5;
ancho=5;
datos=csvread('te.csv');
nro_epocas=1000;
radio=2;
tasa=0.1;

SOM(alto, ancho, datos, nro_epocas, radio, tasa);