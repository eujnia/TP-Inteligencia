
x1 = [-512 512];
f1 = @(x) -x .* sin(sqrt(abs(x)))+450;


x2 = [0 20];
f2 = @(x) x + 5*sin(3*x) + 8*cos(5*x);


xy3 = [-100 100];
[xcoord, ycoord] = meshgrid(xy3, xy3);
f3 = @(x,y) (x.^2 + y.^2).^(0.25) .* [(sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1];


nro_part = 10;
c = [.05 .05];
condicion_de_finalizacion = 0.1;
t_max = 500;

[mejor_pos, t] = swarm_opt(f1, x1, nro_part, c, f1, condicion_de_finalizacion, t_max)
funcion(mejor_pos)