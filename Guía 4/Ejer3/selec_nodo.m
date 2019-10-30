function [t] = selec_nodo(v)
  c = a = [];
    for i = 1:size(v)
      if v(i) != 0
        c = [c , i];
      endif
    endfor
    c
    t = 7;
    if c != a
      t = c(round(rand(1)*(size(c,2)-1)) + 1 ,1);
    endif
    
endfunction
