criterio_corte = 0.1;
ventana = 10;
it_max = 100;
y_ini_fin = [];
for i=1:3
  switch i
    case 1
      x_ini_fin = [-512, 512];
    case 2
      x_ini_fin = [0, 20];
    case 3
      x_ini_fin = [-100, 100];
      y_ini_fin = [-100, 100];
  endswitch
  
  [mejor, lista_mejores, it] = gradiente(i, x_ini_fin,y_ini_fin, criterio_corte, ventana, it_max)
    
endfor