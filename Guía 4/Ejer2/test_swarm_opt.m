funcion=@(x) -x.*sqrt(abs(x));
funcion(0.029761)
ini_fin = [-512 512];
nro_part = 10;
c = [.05 .05];
condicion_de_finalizacion = 0.1;
t_max = 500;
[mejor_pos, t] = swarm_opt(funcion, ini_fin, nro_part, c, funcion, condicion_de_finalizacion, t_max)