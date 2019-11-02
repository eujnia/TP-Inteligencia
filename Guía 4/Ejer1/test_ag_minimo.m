warning off

    nro_poblacion = 10;
    nro_bits_individuo = 10;
    nro_seleccion = 10;
    nro_competencia = 5;
    prob_cruza = 0.9;
    prob_muta_indiv = 0.1;
    porcentaje_brecha = 0.3;
    criterio_corte = 0.3;
    ventana = 20;
    it_max =100;

for i=1:3

  switch i
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
  
  [ mejor,mejores_resultados,it ]=alg_gen_minimo(i, x_ini_fin, y_ini_fin, nro_poblacion, nro_bits_individuo, nro_seleccion, 
                                        nro_competencia, prob_cruza, prob_muta_indiv, porcentaje_brecha, criterio_corte, 
                                        ventana, it_max);              
                                        
  figure;               
  title('Fitness mejores individuos'); hold on;
  plot(mejores_resultados,'linewidth',1.1);
  disp(strcat("Minimo encontrado: ", num2str(mejor)));
  
endfor