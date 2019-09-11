function [v_desemp] = desemp_part(file, cant_part, p_trn)
  
  nro_epocas=10;
  criterio=0.9;
  tasa_ap=0.005; 
  
  v_desemp = [];
  
  [file_trn, file_tst] = particionar(file, cant_part, p_trn);

  datos_trn=csvread(file_trn);
  datos_tst=csvread(file_tst);

  %para c particion
  %size(datos_trn) da 800 x 20
  %como tiene los datos consecutivos, tengo que barrer así 
  
  %para generalizar los datos
  d = size(datos_trn,2)/cant_part; %da 4
  ini=1;
  fin=d;
   
  for i=1:cant_part
   
    elem_trn = datos_trn(:,ini:fin);
 
    x_trn= elem_trn(:,1:3);
    y_trn= elem_trn(:,4);
    
    w=train(x_trn,y_trn,nro_epocas,criterio,tasa_ap);
  
    elem_tst = datos_tst(:,ini:fin);
    x_tst= elem_tst(:,1:3);
    y_tst= elem_tst(:,4);
     
    desemp= test(w,x_tst,y_tst);
    v_desemp = [v_desemp desemp];
    
    ini=ini+d;
    fin=fin+d;
  endfor
  
  v_desemp = v_desemp';
  
endfunction
