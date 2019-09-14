 %%compara desempenios
 
 nro_epocas=50;
 criterio=0.99;
 tasa_ap=0.1; 
 
 %desempenio 1
  d1 = desemp_part('spheres2d10.csv', 10, 0.8,nro_epocas,criterio,tasa_ap);

  #figure;
  #datos1=csvread('spheres2d10.csv');
  #grafica_datos(datos1);
  
 %desempenio 2
  d2 = desemp_part('spheres2d50.csv', 10, 0.8,nro_epocas,criterio,tasa_ap);
  #figure;
  #datos2=csvread('spheres2d50.csv');
  #grafica_datos(datos2);
  
 %desempenio 3
  d3 = desemp_part('spheres2d70.csv', 10, 0.8,nro_epocas,criterio,tasa_ap);
  #figure;
  #datos3=csvread('spheres2d70.csv');
  #grafica_datos(datos3);
 
 d=[d1';d2';d3'];
 dprom=[];
 
 for i=1:size(d,1)
   dprom=[dprom; mean(d(i,:))];
 endfor
