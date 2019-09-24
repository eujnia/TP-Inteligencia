alto=7;
ancho=7;
datos=csvread('te.csv');
nro_epocas=1000;
radio=5;
tasa=0.1;

SOM(alto, ancho, datos, nro_epocas, radio, tasa);