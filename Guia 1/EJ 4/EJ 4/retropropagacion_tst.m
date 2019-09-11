function [desempenio] = retropropagacion_tst(datos, cant_entradas, dim_red, w)
  
  nro_capas=length(dim_red);
  y={};
  for i=1:nro_capas
    y=[y zeros(dim_red(i)+1,1)];
  endfor
  
  cant_patrones = size(datos,1);
  x = [-ones(cant_patrones,1) datos(:,1:cant_entradas)];
  yd = datos(:,cant_entradas+1:size(datos,2));
  
  for i=1:nro_capas
    y{i}(1,1)=-1;
  endfor
  %no es por epoca 
  ye=[];
  
  %para cada patron para cada capa calculo las salidas y guardo la ultima y para calcular el desempeño
  for i=1:cant_patrones
      z=w{1}*x(i,:)';
      y{1}(2:dim_red(1)+1,1) = 2./(1+exp(-z)) -1; 
      
      for i=2:nro_capas-1
        z=w{i}*y{i-1};
        y{i}(2:dim_red(i)+1,1) = 2./(1+exp(-z)) -1; 
      endfor
      
      z=w{nro_capas}*y{nro_capas-1};
      y{nro_capas}(2:dim_red(nro_capas)+1,1) = 2./(1+exp(-z)) -1;
      ye=[ye; y{nro_capas}(2:dim_red(nro_capas)+1,1)']; 
  endfor
  
  desempenio=0;
  if size(yd,2)==1
      
    yh=sign(ye);
    for i=1:size(yh,1)
      if yh(i)==yd(i)
        desempenio+=1;
      endif
    endfor
    
    if size(x,2)==3
      
      % grafica
%      figure;
%      for i=1:length(yh)
%        if yh(i)==yd(i)
%          if yh(i)==1
%            scatter(x(i,2),x(i,3),"k","x","linewidth",1.2); hold on; 
%          else
%            scatter(x(i,2),x(i,3),"r","s","linewidth",1.2); hold on;
%          endif
%        else
%          if yh(i)==1
%            scatter(x(i,2),x(i,3),"b","s","linewidth",1.2); hold on;
%          else
%            scatter(x(i,2),x(i,3),"m","x","linewidth",1.2); hold on;
%          endif
%        endif
%      endfor
      
   else 
      
      print("tiene más de dos datos de entrada");
   
   endif
   
  else %caso one hot
      
    yh=-ones(size(ye));
    [~,pos]=max(ye');
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
  
  
  
endfunction