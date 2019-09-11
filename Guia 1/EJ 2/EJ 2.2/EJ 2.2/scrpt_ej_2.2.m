 %%compara desempeños
 
 %desempeño 1
  d1 = desemp_part('spheres2d10.csv', 10, 0.8);

  for i=1:10
    plot(d1(i),d1(i),'ro');
    
    hold on;
  endfor
  
 %desempeño 2
  d2 = desemp_part('spheres2d50.csv', 10, 0.8);
  for i=1:10
    plot(d2(i),d2(i),'bo');
    
    hold on;
  endfor
  
 %desempeño 3
  d3 = desemp_part('spheres2d70.csv', 10, 0.8);
  for i=1:10
    plot(d3(i),d3(i),'go');
    
    hold on;
  endfor
 %la grafica tipo es ilustrativa del valor del desempeño con respecto a
 %si mismo. Podría hacerse mejor..
 title('Comparacion de los desempenios');
