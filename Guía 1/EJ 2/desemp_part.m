function [data_trn,data_tst] = m_part(file_trn, file_tst, cant_entrada, cant_part)

  datos_trn=csvread(file_trn);
  datos_tst=csvread(file_tst);
  
  %para generalizar los datos
  d = size(datos_trn,2)/cant_part;
  ini=1;
  fin=d;
   
  for i=1:cant_part
   
    elem_trn = datos_trn(:,ini:fin);
 
    x_trn= elem_trn(:,1:cent_entrada);
    y_trn= elem_trn(:,cant_entrada:size(elem_trn,2));
    
    w=train(x_trn,y_trn,nro_epocas,criterio,tasa_ap);
  
    elem_tst = datos_tst(:,ini:fin);
    x_tst= elem_tst(:,1:3);
    y_tst= elem_tst(:,4);
     
    desemp= test(w,x_tst,y_tst);
    v_desemp = [v_desemp desemp];
    
    ini=ini+d;
    fin=fin+d;
    
    figure;
    grafica_datos([elem_trn(:,1:3) elem_trn(:,4)]);
    x1=x2=linspace(-1.5,1.5,10);
    [xx1,xx2]=meshgrid(x1,x2);
    x3=(1/w(4))*(w(1)-xx1*w(2)-xx2*w(3));
    mesh(x1,x2,x3);
    axis([-1.5 1.5 -1.5 1.5 -1.5 1.5]); 
  endfor
  
  v_desemp = v_desemp';
  
endfunction
