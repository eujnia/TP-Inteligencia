function [cg,yg] = capa_gaussiana(entradas, k, taza, desvio=1)  

  # cg: salida real 
    
  cant_patrones = size(entradas,1);
  tipo_patrones = size(entradas,2);
  
  c = zeros(k,tipo_patrones); # cant de gausianas, tipos de entradas
  g = zeros(cant_patrones,1); # cant de patrones
  w = ones(k,cant_patrones); # cant de gausianas, cant de patrones
  
  g(1:cant_patrones) = int32(rand(cant_patrones,1)*k +0.5);

  # iniciacion de c forma 1  
  c(:,:)=entradas(1:k,:);
  
  # iniciacion de centroides forma 2
  #  centroides a partir de prom de puntos del conj
   %  c(g(:),:) += entradas(:,:); 
   %  c /= cant_patrones;
  
   
  c_aux = zeros(k,tipo_patrones); 
  v_delta = []; 
   
 # la comparación c!=c_aux no funca 
 for i = 1:30
   c_aux=c;
    
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
    
    # promedio cada componente del punto del conj 
    delta = zeros(k,tipo_patrones); # centroides, tipo_patrones
    cont = zeros(k,1);
    
    for p=1:cant_patrones
        delta(g(p),:) += entradas(p,:); 
        cont(g(p)) += 1;
    endfor 
   
    for nc=1:k
      if cont(nc) == 0 
        delta(nc,:)=zeros(1,tipo_patrones);
      else      
        delta(nc,:) /= cont(nc);
      endif
    endfor
    
    # para cada centroide incremento c
    for nc=1:k
      c(g(p),:) = c(g(p),:) + taza*delta(nc);
    endfor
    
     v_delta = [v_delta ; delta];
     delta = []; 
    
    if(c==c_aux)
      break
    endif
  
  endfor
   
  yg=[];
  # cada vez son más chicos los cambios
  v_delta
  #delta es el promedio de los cambios del grupo
   for i=1:k
     yg = [yg exp((-0.5* mean((v_delta(i,:)-c(i,:)))./ desvio).^2)];
    # yg = [yg  mean( v_delta(i) - c(i,:) )];
   endfor
   cg = zeros(cant_patrones,1);
   
  for i=1:cant_patrones
    
    #si la salida del patron es igual al maximo de yg 
    # va 1 sino -1
    if ( yg(g(i)) == max(yg))
      cg(i,1) = 1;
    else 
      cg(i,1) = -1;
     endif
    endfor
   
endfunction