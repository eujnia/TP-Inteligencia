function [yg] = capa_gaussiana(entradas, k, taza, desvio=1)  

   
  cant_patrones = size(entradas,1);
  tipo_patrones = size(entradas,2);
  
  g = zeros(cant_patrones,1); # cant de patrones
  w = ones(k,cant_patrones); # cant de gausianas, cant de patrones
  
  g(1:cant_patrones) = int32(rand(cant_patrones,1)*k +0.5);

  # iniciacion de c forma 1  
  c=entradas(1:k,:);
  
  # iniciacion de centroides forma 2
  #  centroides a partir de prom de puntos del conj
   %  c(g(:),:) += entradas(:,:); 
   %  c /= cant_patrones;
  
  g_aux = zeros(cant_patrones,1);
  v_delta = []; 

  distintos=1;
  figure; axis([-1.25 1.25 -1.25 1.25]); hold on;
  for i = 1:k
       axis([-1.25 1.25 -1.25 1.25]);
       plot(c(i,1),c(i,2),'ro'); hold on;
       pause(1);
   endfor
   hold off;
 # comparar que el grupo haya sido modificado
while distintos
   g_aux=g;
   
    # promedio cada componente del punto del conj 
    delta = zeros(k,tipo_patrones); # centroides, tipo_patrones
    cont = zeros(k,1);
    
    for p=1:cant_patrones
        delta(g(p),:) += entradas(p,:); 
        cont(g(p)) += 1;
    endfor 
    
    for nc=1:k
      if cont(nc) == 0 
        c(nc,:)=zeros(1,tipo_patrones);
      else      
        c(nc,:)=delta(nc,:)/cont(nc);
      endif
    endfor
    
%    grafica
   for i = 1:k
       axis([-1.25 1.25 -1.25 1.25]);
       plot(c(i,1),c(i,2),'ro'); hold on;
       pause(1);
   endfor
   hold off;
    
    # calculamos la distancia de cada patron a los k centroides
    for p=1:cant_patrones
      dist = [];  
      for nc=1:k
        dist_patron_centroide = norm(entradas(p,:) - c(nc,:) , 2);
        dist=[dist  dist_patron_centroide];
      endfor
      
      [~,pos] = min(dist(1,:)); # dist  = [0.5 4 45 0.7 4.3] -> min = 0.5 pos=1
      g(p) = pos; 
    endfor
    
    if g==g_aux
      distintos=0;
    else
      distintos=1;
    endif
    
endwhile
   
  yg=zeros(cant_patrones,k);
  
  #delta es el promedio de los cambios del grupo
  for j=1:k
    for i=1:cant_patrones
     y  = exp((-0.5* mean((entradas(i,:)- c(j,:)))./ desvio).^2);
     yg(i,j) = y;
    # yg = [yg  mean( v_delta(i) - c(i,:) )];
    endfor
   endfor
   
endfunction
