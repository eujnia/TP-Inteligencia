warning('off');

nro_epocas=2000;
criterio=0.875;
tasa_ap=0.1; 
disp('Resolucion del inciso a):');
des=desemp_part('spheres1d10.csv',5,0.8,nro_epocas,criterio,tasa_ap);
disp('  Desempeño por particion:');
disp('   P1        P2        P3        P4        P5');
disp(des');
disp(['  Desempeño promedio: ', num2str(mean(des))]);

disp(' ');
disp('Resolucion del inciso b):');
scrpt_ej_22
disp('  Matriz de desempeños:');
disp(d);
disp('  Desempeño promedio:');
disp(dprom);