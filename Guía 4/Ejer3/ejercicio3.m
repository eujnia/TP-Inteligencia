#Ejercicio 3
n_ciudades = 10 #7; #10
distancia = csvread('10cities.csv'); #('10cities.csv');
n_hormigas = 60;
t_min_max = [15 300];# [15 300];
ro = 0.99999; 
n= 11; # cantidad de ciudades a visitar #11

[menor_d,sum,t] = alg_hormigas(n_ciudades, distancia, n_hormigas, t_min_max,ro,n);

menor_d
sum
t


# Obtenemos:
# >> ejercicio3
# menor_d =

#   7   1   3   2   5   4   6   7

# sum =  30.719
# t =  76
