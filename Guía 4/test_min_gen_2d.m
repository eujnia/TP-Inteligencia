function [x_min, y_min, mejores_resultados] = min_gen_2d(funcion, x_ini_fin, y_ini_fin, nro_poblacion, nro_bits_individuo, nro_seleccion, 
                                     nro_competencia, prob_cruza, prob_muta_indiv, porcentaje_brecha, criterio_corte, 
                                     ventana, it_max)
                                     
funcion = @(x) -x .* sin(sqrt(abs(x)));
x_ini_fin = [-512 512];
nro_poblacion = 1000;
nro_bits_individuo = 6;
nro_seleccion = 20;
nro_competencia = 300;
prob_cruza = 0.9;
prob_muta_indiv = 0.01;
porcentaje_brecha = 0.3;
criterio_corte = 0.3;
ventana = 5;
it_max = 100;

[x_min,~,mejores_resultados]=min_gen_2d(funcion, x_ini_fin, [], nro_poblacion, nro_bits_individuo, nro_seleccion, nro_competencia, prob_cruza, 
                                        prob_muta_indiv, porcentaje_brecha, criterio_corte, ventana, it_max);
                                        
plot(mejores_resultados);                                        