function [yg_trn,yg_tst] = capa_gaussiana(datos_trn, datos_tst, k, taza, desvio=1)  
   
  cant_patrones = size(datos_trn,1);
  tipo_patrones = size(datos_trn,2);
  
  g = zeros(cant_patrones,1); # cant de patrones

  # iniciacion de c forma 1  
  c=datos_trn(1:k,:);
  
  # iniciacion de centroides forma 2
  #  centroides a partir de prom de puntos del conj
   %  c(g(:),:) += entradas(:,:); 
   %  c /= cant_patrones;
  
  g_aux = zeros(cant_patrones,1);
  v_delta = []; 

  distintos=1;
  figure; axis([-1.25 1.25 -1.25 1.25]); hold on;
  for i = 1:k
       plot(c(i,1),c(i,2),'ro','linewidth',1.2); hold on;
       axis([-1.25 1.25 -1.25 1.25]); hold on
  %       pause(1);
   endfor
 #hold off;
 # comparar que el grupo haya sido modificado
  while distintos
     g_aux=g;
      
  %    grafica
     for i = 1:k
         plot(c(i,1),c(i,2),'ro','linewidth',1.2); hold on;
         axis([-1.25 1.25 -1.25 1.25]); hold on;
  %       pause(1);
     endfor
     hold off;
      
      # calculamos la distancia de cada patron a los k centroides
      for p=1:cant_patrones
        dist = [];  
        for nc=1:k
          dist_patron_centroide = norm(datos_trn(p,:) - c(nc,:) , 2);
          dist=[dist  dist_patron_centroide];
        endfor
        
        [~,pos] = min(dist(1,:)); # dist  = [0.5 4 45 0.7 4.3] -> min = 0.5 pos=1
        g(p) = pos; 
      endfor
      
      # promedio cada componente del punto del conj 
      delta = zeros(k,tipo_patrones); # centroides, tipo_patrones
      cont = zeros(k,1);
      
      for p=1:cant_patrones
          delta(g(p),:) += datos_trn(p,:); 
          cont(g(p)) += 1;
      endfor 
      
      for nc=1:k
        if cont(nc) == 0 
          c(nc,:)=zeros(1,tipo_patrones);
%          c(nc,:)=ones(1,tipo_patrones)*0.5;
          %ver ac�! que hacemos cuando no hay ning�n elemento m�s cerca que otro?
          %para m� le ponemos un centroide cualquiera. el primer centroide.
        else      
          c(nc,:)=delta(nc,:)/cont(nc);
        endif
      endfor
      
      if g==g_aux
        distintos=0;
      else
        distintos=1;
      endif
      
  endwhile
   
  yg_trn=zeros(cant_patrones,k);
  yg_tst=zeros(size(datos_tst,1),k);
 
  #delta es el promedio de los cambios del grupo
  for j=1:k
    for i=1:cant_patrones
     yg_trn(i,j) = exp((-0.5* mean((datos_trn(i,:)- c(j,:)))./ desvio).^2);
    endfor
   endfor
   
   for j=1:k
    for i=1:size(datos_tst,1)
     yg_tst(i,j) = exp((-0.5* mean((datos_tst(i,:)- c(j,:)))./ desvio).^2);
    endfor
   endfor
   
endfunction
