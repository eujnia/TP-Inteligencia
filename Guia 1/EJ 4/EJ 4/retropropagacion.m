function [w,e2,desempenio] = retropropagacion(datos,cant_entradas,dim_red,cant_epocas,criterio,tasa_apr,we=0)
  % funcion que realiza la retropropagacion dado
  % datos : un archivo con los datos para entrenar la red neuronal
  % cant_entradas : cantidad de entradas en los datos (x1,x2,x3,...x(cant_entradas),y1,y2,y3...(cant_salidas))
  % dim_red : vector con el nro de neuronas por capa de la red
  % cant_epocas : numero de epocas maximo
  % crtiterio : diferencia entre error para cortar el algoritmo
  % tasa_apr : tasa de aprendizaje de la red
  % we : pesos iniciales
  
  %% INICIALIZAR LA RED
  % cada red esta dada por un conjunto de 
  % y : celdas de salidas de la red
  % d : celdas de gradientes de error local instantaneo para las neuronas de la red
  % w : celdas de pesos sinapticos para cada capa de la red
  
  e2=[];
  nro_capas=length(dim_red);

  %primer elemento 
  y={zeros(dim_red(1)+1,1)};
  d={zeros(dim_red(1),1)};
  w={rand(dim_red(1),cant_entradas+1)-0.5}; %este es el unico necesario afuera 
  
  for i=2:nro_capas
    y=[y zeros(dim_red(i)+1,1)]; %recordar que y en la ultima capa tiene un -1 demás
    d=[d zeros(dim_red(i),1)];
    w=[w rand(dim_red(i),dim_red(i-1)+1)-0.5]; 
  endfor
  
  if size(we)>1
    w = we;
   endif
  
  %Carga de datos
  cant_patrones = size(datos,1);
  x = [-ones(cant_patrones,1) datos(:,1:cant_entradas)];
  yd = datos(:,cant_entradas+1:size(datos,2));
  
  for i=1:nro_capas
    y{i}(1,1)=-1;
  endfor
  
  %-----------------------
  for e=1:cant_epocas
  
    for j=1:cant_patrones
      %Propagacion hacia adelante - calculo de los y
      %w*x=y
      z=w{1}*x(j,:)';
      y{1}(2:dim_red(1)+1,1) = 2./(1+exp(-z)) -1; 
      
      for i=2:nro_capas
        z=w{i}*y{i-1};
        y{i}(2:dim_red(i)+1,1) = 2./(1+exp(-z)) -1; 
      endfor
      
     %propagacion hacia atrás - calculo de gradientes
      cola = 0.5 .* (1-y{nro_capas}(2:dim_red(nro_capas)+1,1)) .* (1+y{nro_capas}(2:dim_red(nro_capas)+1,1));
      d{nro_capas} = (yd(j,:)' - y{nro_capas}(2:dim_red(nro_capas)+1,1)) .* cola;
      
      for i=nro_capas-1:-1:1
        cola = 0.5 .* (1-y{i}(2:dim_red(i)+1,:)) .* (1+y{i}(2:dim_red(i)+1,:));
        d{i}=w{i+1}(:,2:dim_red(i)+1)'*d{i+1} .* cola;
      endfor
      
      %ajuste de pesos
      w{1}=w{1}+tasa_apr*d{1}.*x(j,:);
      for i=2:nro_capas
        w{i}=w{i}+tasa_apr*d{i}.*y{i-1}';
      endfor
    endfor
    
    %validacion
    ye=[];
    % calcular la salida con los pesos ajustados
    for i=1:cant_patrones
      z=w{1}*x(i,:)';
      y{1}(2:dim_red(1)+1,1) = 2./(1+exp(-z)) -1; 
      
      for i=2:nro_capas-1
        z=w{i}*y{i-1};
        y{i}(2:dim_red(i)+1,1) = 2./(1+exp(-z)) -1; 
      endfor
      
      z=w{nro_capas}*y{nro_capas-1};
      y{nro_capas}(2:dim_red(nro_capas)+1,1) = 2./(1+exp(-z)) -1;
      %la matriz tiene como fila la o las salidas de cada patron (finales de la ultima capa)
      ye=[ye; y{nro_capas}(2:dim_red(nro_capas)+1,1)']; 
    endfor
    
    % calcular el error cuadrático medio
    e_aux=sum(sum((yd-ye).^2)/length(yd));
    e2=[e2; e_aux];
    
    % calcular desempenio
    desempenio=0;
    if size(yd,2)==1
      
      yh=sign(ye);
      for i=1:size(yh,1)
        if yh(i)==yd(i)
          desempenio+=1;
        endif
      endfor
      
    else
      %one hot
      yh=-ones(size(ye));
      [~,pos]=max(ye'); %max valor en una fila
      %pos da un vector con las posiciones de los max en cada fila 
      for i=1:size(yh,1)
        yh(i,pos(i))=1;
      endfor
      for i=1:size(yh,1)
        if yh(i,:)==yd(i,:)
          desempenio+=1;
        endif
      endfor
      
    endif
    
    desempenio=desempenio/size(yd,1);
    
    if desempenio>=criterio
      break
    endif
    
  endfor
  
endfunction