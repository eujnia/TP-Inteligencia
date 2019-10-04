function [] = sistema_borroso(c)
  %tref = temperatura a la que queremos llegar.   
  tref = zeros(201,1) + 25;
  tref(1:31,1) =  tref(1:31,1) - 10;
  
  to = q = zeros(size(tref));
  to(1)=15;
  
 for n=1:200
    %calculamos q, la cantidad de temperatura que debería agregar 
    %el acondicionador para llegar a la tref
     q(n) = controlador(to(n), tref(n), c);
     %se la pasamos al acondicionador
     to(n+1) = acondicionador(q(n), to(n));
     
 endfor
 err = tref-to;
 
 % Graficas
 tiempo = [0:1:200];
 tipo = 0;
 [M,S] = par_M_S(c);

 figure;
  
  %for i=1:1%length(tiempo)
  
  subplot(3,2,1); 
  stem(tiempo,to,'b');
  %stem(tiempo(i),to(i),'r');
  hold on;
  title("to con respecto al tiempo");
  
  subplot(3,2,2); 
  grafica_conjuntos(M, tipo, [-20:1:20]);
  hold on;
  title("conjunto M");
  
  subplot(3,2,3);
  stem(tiempo,q,'b');
 % stem(tiempo(i),q(i),'r');
  hold on;
  title("q con respecto al tiempo");
    
  subplot(3,2,4); 
  grafica_conjuntos(S, tipo, [-7:1:7]);
  hold on;
  title("conjunto S");
  
  subplot(3,2,5);
  stem(tiempo,err,'b');
 % stem(tiempo(i),err(i),'r');
  hold on;
  title("err con respecto al tiempo");
  
 % pause(.5);
  
  %endfor
 
 endfunction