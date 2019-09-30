conjunto=[1.1 2 3 5];
x=[0:0.1:4];
tipo=0;

[y_cg]=cg(conjunto)
mu=membresia(conjunto,tipo,x);

plot(x,mu); hold on;
stem(y_cg,1); hold on;
stem(y_cg1,1); hold on;
legend('mem','y_cg','y_cg1');