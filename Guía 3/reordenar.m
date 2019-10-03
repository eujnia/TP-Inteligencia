function [m] = reordenar(m0, v)
  m=m0;
  for i=1:length(v)
    m(i,:) = m0(v(i),:);
  endfor
  
endfunction
