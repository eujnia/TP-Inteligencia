#Ejercicio 7 - test

%Responder para las 4 combinaciones de matrices de E S:
% presenta error final (alcanza el valor deseado)?
% oscila?
% tiene sobreimpulso? (es decir, inicialmente se pasa del valor final).


M1=[-20 -20 -10 -5;
    -10  -5  -5 -2;
     -5  -2  -2  0;
     -2   0   0  2;
      0   2   2  5;
      2   5   5 10;
      5  10  20 20];

M2=[-20 -20 -10 -5;
    -10  -5  -4 -2;
     -4  -2  -1  0;
     -1   0   0  1;
      0   1   2  4;
      2   4   5 10;
      5  10  20 20];

S1=[-7 -5 -5 -3;
    -5 -3 -3 -1;
    -3 -1 -1  0;
    -1  0  0  1;
     0  1  1  3;
     1  3  3  5;
     3  5  5  7];

S2=0.1*[-7 -5 -5 -4;
    -5 -4 -4 -3;
    -4 -3 -3  0;
    -3  0  0  3;
     0  3  3  4;
     3  4  4  5;
     4  5  5  7];
  %tref = temperatura a la que queremos llegar.   
  tref = zeros(200,1) + 25;
  tref(1:31,1) =  tref(1:30,1) - 10;
  
  for n=1:200
    %calculamos q, la cantidad de temperatura que debería agregar 
    %el acondicionador para llegar a la tref
     q = controlador(to(n), to(n-1), tref(n));
     %se la pasamos al acondicionador
     to(n) = st(q, ti);
  endfor
  
  
     