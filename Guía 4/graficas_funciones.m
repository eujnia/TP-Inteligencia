x1 = [-512:1:512];
f1 = @(x) -x .* sin(sqrt(abs(x)));
fit1 = @(x) 450./(f1(x) + 450);

x2 = [0:0.25:20];
f2 = @(x) x + 5*sin(3*x) + 8*cos(5*x);
fit2 = @(x) 10./(f2(x) + 10);

xy3 = [-100:2:100];
[xcoord, ycoord] = meshgrid(xy3, xy3);
f3 = @(x,y) (x.^2 + y.^2).^(0.25) .* [(sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1];
fit3 = @(x,y) 1./(f3(x,y) + 1); 

figure;
plot(x1, f1(x1), 'linewidth', 1.2);
figure;
plot(x1, fit1(x1), 'linewidth', 1.2);

figure;
plot(x2, f2(x2), 'linewidth', 1.2);
figure;
plot(x2, fit2(x2), 'linewidth', 1.2);

figure;
mesh(xcoord, ycoord, f3(xcoord, ycoord));
figure;
mesh(xcoord, ycoord, fit3(xcoord, ycoord));