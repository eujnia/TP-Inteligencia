function grafica_datos(datos)
   for i = 1:size(datos,1)
     if(datos(i,4) == 1)
       plot3(datos(i,1),datos(i,2),datos(i,3),'ro');
     endif
     if(datos(i,4) == -1)
       plot3(datos(i,1),datos(i,2),datos(i,3),'bo');
     endif
     hold on;
     
   endfor
 endfunction
