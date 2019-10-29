funcion=@(x) -x.*sqrt(abs(x));

x_ini_fin = [-512 512];
nro_part = 10;
c = [.5 .5];
condicion_de_finalizacion = 0.1;
it_max = 100;
[mejor_pos] = swarm_opt(funcion, x_ini_fin, nro_part, c, funcion, condicion_de_finalizacion, it_max)