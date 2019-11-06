function [alpha] = actualizar_alpha(x,grad_x,tipo)
  alpha=0.9;  
  x_aux = x - grad_x*alpha;
  if tipo == 1
    while abs(x-x_aux) < 5
      alpha = alpha*1.1;
       x_aux = x - grad_x*alpha;
    endwhile
  else 
    if tipo == 2
     if abs(x-x_aux) > 0.1
       alpha = 1/55;
     else
       alpha = 0.05;
     endif
     
    else %caso 3
     cambio = abs(grad_x - x);
     
      alpha =  [ 1 / cambio(1), 1 /cambio(2) ];

    endif
  endif
endfunction
 