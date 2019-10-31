function [bin_hijo1, bin_hijo2] = mutador(prob1,prob2,punto_muta, prob_muta_indiv, bin_hijo1, bin_hijo2)
 
  if prob1 < prob_muta_indiv
    if bin_hijo1(punto_muta)=='0'
      bin_hijo1(punto_muta)='1';
    else
      bin_hijo1(punto_muta)='0';
    endif
  endif
  
  if prob2 < prob_muta_indiv
    if bin_hijo2(punto_muta)=='0'
      bin_hijo2(punto_muta)='1';
    else
      bin_hijo2(punto_muta)='0';
    endif
  endif
endfunction
      