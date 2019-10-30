#EJ 3
n_ciudades = 7;
distancia = csvread('7cities.csv');
n_hormigas = 15;
t_max = 50;
ro = 0.9;
n= 7; # cantidad de ciudades a visitar

[menor_d] = sACO(n_ciudades, distancia, n_hormigas, t_max,ro,n);

menor_d

