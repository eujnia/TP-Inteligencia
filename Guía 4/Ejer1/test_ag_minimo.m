warning off

caso = 2;
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
    

nro_poblacion = 50;
nro_bits_individuo = 7;
nro_seleccion = 10;
nro_competencia = 5;
prob_cruza = 0.9;
prob_muta_indiv = 0.01;
porcentaje_brecha = 0.3;
criterio_corte = 0.3;
ventana = 10;
it_max = 50;

%[x_min,~,mejores_resultados]=ag_minimo(caso, x_ini_fin, y_ini_fin, nro_poblacion, nro_bits_individuo, nro_seleccion, 
%                                        nro_competencia, prob_cruza, prob_muta_indiv, porcentaje_brecha, criterio_corte, 
%                                        ventana, it_max);
               
               
 
[ mejor,mejores_resultados,it ]=alg_gen_minimo(caso, x_ini_fin, y_ini_fin, nro_poblacion, nro_bits_individuo, nro_seleccion, 
                                        nro_competencia, prob_cruza, prob_muta_indiv, porcentaje_brecha, criterio_corte, 
                                        ventana, it_max);              
%figure;               

%if caso == 1
%   func = @(x) -x .* sin(sqrt(abs(x)));
%   fitness = @(x) 450./((-x .* sin(sqrt(abs(x)))) + 450);
%   nro_individuos = 2^nro_bits_individuo;   
%   x = linspace( -512, 512 , nro_individuos )
%   stem(mejores_resultados,func(mejores_resultados));
%endif