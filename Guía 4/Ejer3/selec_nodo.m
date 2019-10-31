function [t] = selec_nodo(v)
  c = a = [];
    for i = 1:size(v,2)
      if v(i) != 0
        c = [c ; i];
      endif
    endfor
    
    if size(c) != size(a)
      suma = 0;
      for i = 1:size(c)
        v(c(i)) = 1/v(c(i));
        suma = suma + v(c(i));
      endfor
      
      v = v./suma;
      
      r = rand(1);
      j=t = 0;
      su = 0;
      while (r > su) # for j = 1:size(v)
        j = j + 1;
        if v(j) != 0
          t = j;
        endif
        su = su + v(j); # c(round(rand(1)*(size(c,2)-1)) + 1 ,1);
        if j == size(v)
          break
        endif
      endwhile
       
    endif
    
endfunction
