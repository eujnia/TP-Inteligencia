warning off

caso = 1;
switch caso
  case 1
    x_ini_fin = [-512 512];
    y_ini_fin = [];
  case 2
    x_ini_fin = [0 20];
    y_ini_fin = [];
  case 3
    x_ini_fin = [-100 100];
    y_ini_fin = [-100 100];
endswitch
    

nro_poblacion = 10;
nro_bits_individuo = 6;
nro_seleccion = 5;
nro_competencia = 2;
prob_cruza = 0.9;
prob_muta_indiv = 0.01;
porcentaje_brecha = 0.3;
criterio_corte = 0.3;
ventana = 10;
it_max = 100;

[x_min,~,mejores_resultados]=ag_minimo(caso, x_ini_fin, y_ini_fin, nro_poblacion, nro_bits_individuo, nro_seleccion, 
                                        nro_competencia, prob_cruza, prob_muta_indiv, porcentaje_brecha, criterio_corte, 
                                        ventana, it_max);
               
figure;               
plot(mejores_resultados);                                        