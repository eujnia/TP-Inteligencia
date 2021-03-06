nro_part = 20;
c = [1 1];
condicion_de_finalizacion = .1;
t_max = 100;
figure;

for i=1:3
  switch i
    case 1
      x = [-512 512];
      f = @(x) -x .* sin(sqrt(abs(x)))+450;
      fit = f;
%      fit = @(x) 1 - exp(-(((x-420)/420).^2));
    case 2
      x = [0 20];
      f = @(x) x + 5*sin(3*x) + 8*cos(5*x);
      fit = f;
%      fit = @(x) 1 - exp(-(((x-1.8)/1.8).^2));
    case 3
      x = [-100 100;-100 100];
      f = @(x,y) (x.^2 + y.^2).^(0.25) .* [(sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1];
      fit = @(x,y) (x.^2 + y.^2).^(0.25) .* [(sin(50 .* (x.^2 + y.^2).^(0.1) )).^2 + 1];
%      fit = @(x,y) 1 - exp(-(((x/50).^2)+((y/50).^2)));
  endswitch
  
  subplot(2,3,i);
  [mejor_pos, mejores, t] = swarm_opt(i, f, x, nro_part, c, fit, condicion_de_finalizacion, t_max);
  
  subplot(2,3,i+3);
  title('Mejores globales'); hold on;
  plot(mejores,'linewidth',1.1);
  disp(strcat("Caso ",num2str(i),": "));
  disp(strcat("   Minimo encontrado: ", num2str(mejor_pos)));
  
endfor



