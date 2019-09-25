hold off;
plot(1000,1000,'.y');
axis([-2 2 -2 2]);
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
  pause(1);