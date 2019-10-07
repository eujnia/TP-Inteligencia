%grafica ej_6 
x=[-20:0.1:20];
yS=[-15:0.1:15];

tipo=0;
r = [1; 2;3;4;5;6;7];

M1=[-20 -20 -10 -5;
    -10  -5  -5 -2;
     -5  -2  -2  0;
     -2   0   0  2;
      0   2   2  5;
      2   5   5 10;
      5  10  20 20];

M2=[-20 -20 -10 -5;
    -10  -5  -5 -2;
     -5  -2  -2  0;
     -2   0   0  2;
      0   2   2  5;
      2   5   5 10;
      5  10  20 20];

M3=[-20 -20 -10 -5;
    -10  -5  -5 -2;
     -5  -2  -2  0;
     -2   0   0  2;
      0   2   2  5;
      2   5   5 10;
      5  10  20 20];

S1=[-7 -5 -5 -3;
    -5 -3 -3 -1;
    -3 -1 -1  0;
    -1  0  0  1;
     0  1  1  3;
     1  3  3  5;
     3  5  5  7];

S2=[-9 -5 -5 -1;
    -7 -3 -3  1;
    -5 -1 -1  2;
    -3  0  0  3;
    -2  1  1  5;
    -1  3  3  7;
    1  5  5  9];
     
S3=[-13 -5 -5  1;
    -9 -3 -3  3;
    -7 -1 -1  4;
    -5  0  0  5;
    -4  1  1  7;
    -3  3  3  9;
    -1  5  5  13];

figure;
subplot(3,3,1);
grafica_conjuntos(M1,tipo,x);
subplot(3,3,4);
grafica_conjuntos(M2,tipo,x);
subplot(3,3,7);
grafica_conjuntos(M3,tipo,x);
subplot(3,3,2);
grafica_conjuntos(S1,tipo,yS);
subplot(3,3,5);
grafica_conjuntos(S2,tipo,yS);
subplot(3,3,8);
grafica_conjuntos(S3,tipo,yS);

y1= reglas_borrosas(x,M1,S1,tipo,r);
y2= reglas_borrosas(x,M2,S2,tipo,r);
y3= reglas_borrosas(x,M3,S3,tipo,r);

subplot(3,3,3);
plot(x,y1);
subplot(3,3,6);
plot(x,y2);
subplot(3,3,9);
plot(x,y3);

% membresias triangulares, cambio de r
r = [7 6 5 4 3 2 1];

figure;
subplot(3,3,1);
grafica_conjuntos(M1,tipo,x);
subplot(3,3,4);
grafica_conjuntos(M2,tipo,x);
subplot(3,3,7);
grafica_conjuntos(M3,tipo,x);
subplot(3,3,2);
grafica_conjuntos(S1,tipo,yS);
subplot(3,3,5);
grafica_conjuntos(S2,tipo,yS);
subplot(3,3,8);
grafica_conjuntos(S3,tipo,yS);

y1= reglas_borrosas(x,M1,S1,tipo,r);
y2= reglas_borrosas(x,M2,S2,tipo,r);
y3= reglas_borrosas(x,M3,S3,tipo,r);

subplot(3,3,3);
plot(x,y1);
subplot(3,3,6);
plot(x,y2);
subplot(3,3,9);
plot(x,y3);

% membresia gaussiana

tipo=1;
r = [1; 2;3;4;5;6;7];

M1=[-20 5;
    -10 5;
     -5 5;
     0 5;
      5 5;
      10 5;
      20 5];

M2=[-20 5;
    -10 5;
     -5 5;
     0 5;
      5 5;
      10 5;
      20 5];


M3=[-20 5;
    -10 5;
     -5 5;
     0 5;
      5 5;
      10 5;
      20 5];

S1=[-6 3;
    -5 2;
    -3 1;
    0 .5;
     3 1;
     5 2;
     6 3];
      
S2=[-6 3;
    -5 2;
    -3 1;
    0 .5;
     3 1;
     5 2;
     6 3];
     
S3=[-6 3;
    -5 2;
    -3 1;
    0 .5;
     3 1;
     5 2;
     6 3];
     
figure;
subplot(3,3,1);
grafica_conjuntos(M1,tipo,x);
subplot(3,3,4);
grafica_conjuntos(M2,tipo,x);
subplot(3,3,7);
grafica_conjuntos(M3,tipo,x);
subplot(3,3,2);
grafica_conjuntos(S1,tipo,yS);
subplot(3,3,5);
grafica_conjuntos(S2,tipo,yS);
subplot(3,3,8);
grafica_conjuntos(S3,tipo,yS);

y1= reglas_borrosas(x,M1,S1,tipo,r);
y2= reglas_borrosas(x,M2,S2,tipo,r);
y3= reglas_borrosas(x,M3,S3,tipo,r);

subplot(3,3,3);
plot(x,y1);
subplot(3,3,6);
plot(x,y2);
subplot(3,3,9);
plot(x,y3);

% membresias gaussianas, cambio de r
r = [7 6 5 4 3 2 1];

figure;
subplot(3,3,1);
grafica_conjuntos(M1,tipo,x);
subplot(3,3,4);
grafica_conjuntos(M2,tipo,x);
subplot(3,3,7);
grafica_conjuntos(M3,tipo,x);
subplot(3,3,2);
grafica_conjuntos(S1,tipo,yS);
subplot(3,3,5);
grafica_conjuntos(S2,tipo,yS);
subplot(3,3,8);
grafica_conjuntos(S3,tipo,yS);

y1= reglas_borrosas(x,M1,S1,tipo,r);
y2= reglas_borrosas(x,M2,S2,tipo,r);
y3= reglas_borrosas(x,M3,S3,tipo,r);

subplot(3,3,3);
plot(x,y1);
subplot(3,3,6);
plot(x,y2);
subplot(3,3,9);
plot(x,y3);