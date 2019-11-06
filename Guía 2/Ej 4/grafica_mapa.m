hold off;
for i=1:2:size(entradas,1) % graficar algunos de los datos, si se grafican todos va muy lento
  scatter(entradas(i,1), entradas(i,2), 'c'); hold on;
endfor
axis([-3 4 -4 6]);
hold on;
  for i=1:alto
    for j=1:ancho
      if i != alto && j!=ancho
        plot(w(i,j,1),w(i,j,2),'ob','linewidth',1.1);
        line([w(i,j,1) w(i+1,j,1)],[w(i,j,2) w(i+1,j,2)],"linestyle","--","color","r"); 
        line([w(i,j,1) w(i,j+1,1)],[w(i,j,2) w(i,j+1,2)],"linestyle","--","color","r");
     endif
    
      if i!=alto && j==ancho
        plot(w(i,j,1),w(i,j,2),'ob','linewidth',1.1);
        line([w(i,j,1) w(i+1,j,1)],[w(i,j,2) w(i+1,j,2)],"linestyle","--","color","r");
      endif
      
      if i==alto && j!=ancho
        plot(w(i,j,1),w(i,j,2),'ob','linewidth',1.1);
        line([w(i,j,1) w(i,j+1,1)],[w(i,j,2) w(i,j+1,2)],"linestyle","--","color","r");
      endif
      
      if i==alto && j==ancho
        plot(w(i,j,1),w(i,j,2),'ob','linewidth',1.1);
      endif
      
    endfor
  endfor
  