x1 = [-512:1:512];
f1 = @(x) -x .* sin(sqrt(abs(x)));
%fit1 = @(x) 450./(f1(x) + 450);
fit1 = @(x) exp(-(((x-420)/420).^2));

x2 = [0:0.1:20];
f2 = @(x) x + 5*sin(3*x) + 8*cos(5*x);
# derivada df2 = @(x) -40*sin(5*x) + 15*cos(3*x) + 1;
%fit2 = @(x) 10./(f2(x) + 10);
fit2 = @(x) exp(-(((x-1.8)/1.8).^2));

xy3 = [-100:2:100];
[xcoord, ycoord] = meshgrid(xy3, xy3);
f3 = @(x,y) (x.^2 + y.^2).^(0.25) .* [(sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1];
%fit3 = @(x,y) 1./(f3(x,y) + 1);
fit3 = @(x,y) exp(-(((x/50).^2)+((y/50).^2)));

figure;
subplot(3,2,1);
plot(x1, f1(x1), 'linewidth', 1.2);
subplot(3,2,2);
plot(x1, fit1(x1), 'linewidth', 1.2);

subplot(3,2,3);
plot(x2, f2(x2), 'linewidth', 1.2);
subplot(3,2,4);
plot(x2, fit2(x2), 'linewidth', 1.2);

subplot(3,2,5);
mesh(xcoord, ycoord, f3(xcoord, ycoord));
subplot(3,2,6);
mesh(xcoord, ycoord, fit3(xcoord, ycoord));