#Ejercicio 3
n_ciudades = 7;
distancia = csvread('7cities.csv');
n_hormigas = 60;
t_max = 300;
ro = 0.99999;
n= 8; # cantidad de ciudades a visitar

[menor_d,sum,t] = alg_hormigas(n_ciudades, distancia, n_hormigas, t_max,ro,n);

menor_d
sum
t


# Obtenemos:
# >> ejercicio3
# menor_d =

#   7   1   3   2   5   4   6   7

# sum =  30.719
# t =  76
