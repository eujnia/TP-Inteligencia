alto=10;
ancho=10;
datos=csvread('clouds.csv');
nro_epocas=500;
radio=2;
 
%Entrenamos con 300 epocas
[mapa, etiqueta]=trn_SOM(alto, ancho, datos(1:500,1:3), nro_epocas, radio);
csvwrite('mapa_som.csv',mapa);
csvwrite('etiqueta_som.csv',etiqueta);


