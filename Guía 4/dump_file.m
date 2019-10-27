x1 = [-512:1:512];
f1 = @(x) -x .* sin(sqrt(x));

x2 = [0:0.25:20];
f2 = @(x) x + 5*sin(3*x) + 8*cos(5*x);

xy3 = [-100:2:100];
[xcoord, ycoord] = meshgrid(xy3, xy3);
f3 = @(x,y) (x.^2 + y.^2).^(0.25) .* [(sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1];

figure;
plot(x1, f1(x1), 'linewidth', 1.2);

figure;
plot(x2, f2(x2), 'linewidth', 1.2);

figure;
mesh(xcoord, ycoord, f3(xcoord, ycoord));

%x_ini_fin = [-3 6];
%cant_bits_individuo = 6;
%nro_poblacion = 10;
%
%%  Se codifican los individuos de acuerdo a la cantidad de bits definida
%%  Los individuos son cadenas de caracteres que representan un número binario,
%%  se guardan en indiv
%%  Los valores de x se corresponden por el índice en filas de los individuos
%  x = linspace( x_ini_fin(1), x_ini_fin(2),  2^cant_bits_individuo )';
%  indiv = [];
%  for i = 1:2^cant_bits_individuo
%    indiv = [indiv; dec2bin( i-1, cant_bits_individuo )];
%  endfor
%  
%%  Inicialización aleatoria de la población
%  poblacion = [];
%  for i=1:nro_poblacion
%    poblacion = [poblacion; indiv(randperm(2^cant_bits_individuo),:)];
%  endfor