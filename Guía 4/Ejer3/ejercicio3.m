#Ejercicio 3

n_ciudades = 7;
distancia = csvread('7cities.csv');
n_hormigas = 100;
t_min_max = [15 300];
ro = 0.99999; 
n= 8;

[menor_d,sum,t] = alg_hormigas(n_ciudades, distancia, n_hormigas, t_min_max,ro,n)

n_ciudades = 10;
distancia = csvread('10cities.csv');
n_hormigas = 100;
t_min_max = [15 300];
ro = 0.99999; 
n= 11;

[menor_d,sum,t] = alg_hormigas(n_ciudades, distancia, n_hormigas, t_min_max,ro,n)