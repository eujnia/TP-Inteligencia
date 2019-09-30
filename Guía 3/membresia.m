function [mval]=membresia(conjunto, tipo, xval)
  mval=zeros(size(xval));
  for x=1:length(xval)
    if tipo==0
      if xval(x) < conjunto(1) && xval(x) > conjunto(4)
        mval(x) = 0;
      endif
      if conjunto(1) <= xval(x) && xval(x) < conjunto(2)
        mval(x) =(xval(x)-conjunto(1))/(conjunto(2)-conjunto(1));
      endif
      if conjunto(2) <= xval(x) && xval(x) <= conjunto(3)
        mval(x)=1;
      endif
      if conjunto(3) < xval(x) && xval(x) <= conjunto(4)
        mval(x) = 1 - ((xval(x)-conjunto(3))/(conjunto(4)-conjunto(3)));
      endif
     
    else #(gausseana) conjunto 1 = media , conjunto 2 = desvio
      mval(x) = exp(-0.5*((xval(x)-conjunto(1))/conjunto(2))^2);
    endif
    
  endfor
    
endfunction
