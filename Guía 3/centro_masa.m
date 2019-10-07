function [centro_masa_figura]= centro_masa(membresia);
  % membresia son los puntos que definen a la funcion de membresia
  
  % centroides de las tres partes (tecnicamente la coordenada en x del centroide)
  centroides=zeros(3,1);
  % areas de las tres partes
  areas=zeros(3,1);
  
  if membresia(1) != membresia(2) % esto indica que hay un triángulo formado entre a y b
      %centroide triangulo
      centroides(1)=(membresia(1)+membresia(2)+membresia(2))/3;
      %área del triángulo base por altura sobre 2
      areas(1)=(membresia(2)-membresia(1))/2;
  endif
  
  if membresia(2) != membresia(3) % esto significa que hay un rectángulo formado por b y c
      %centroide rectángulo
      centroides(2)=(membresia(2)+membresia(3))/2;
      %área del triángulo base por altura sobre 2
      areas(2)=membresia(3)-membresia(2);
  endif
  
  if membresia(3) != membresia(4) % esto indica que hay un triángulo formado entre c y d
      %centroide triangulo, en este caso se colocan 2 veces el primer x
      centroides(3)=(membresia(3)+membresia(3)+membresia(4))/3;
      %área del triángulo base por altura sobre 2
      areas(3)=(membresia(4)-membresia(3))/2;
  endif
  
  %cálculo del centro de masa
  %se suman los centroides por las áreas y se divide por la suma de las áreas
  centro_masa_figura=(centroides'*areas)/sum(areas);
  
endfunction
