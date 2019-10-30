function [binario] = numeric_dec2bin(decimal)
  binario=0;
  if decimal!=0
    resto=[];
    while decimal!=0
      if mod(decimal,2)<2
        resto = [resto; mod(decimal,2)];
        decimal = (decimal-mod(decimal,2))/2;
      endif
    endwhile
    for i=1:length(resto)
      binario += resto(i) * 10^(i-1);
    endfor
  endif
endfunction