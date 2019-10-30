function [decimal] = numeric_bin2dec(binario)
  decimal=0;
  if binario!=0
    resto = [];
    while binario != 0
      resto = [resto; mod(binario,10)];
      binario = round(binario/10);
      if binario == 0
        resto = [resto; 0];
      endif
    endwhile
    for i=1:size(resto,1)
      decimal += resto(i) * 2^(i-1);
    endfor
  endif
endfunction