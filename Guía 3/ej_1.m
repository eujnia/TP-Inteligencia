%Ejercicio 1 - test
a = 0;b = 1;c = 2;d = 3;
%conjunto = [a b c d];
conjunto = [1 1 2 3];
xval = [-4:0.1:4];
tipo=0;
mu_eval=membresia(conjunto,tipo,xval);
plot(xval,mu_eval);
