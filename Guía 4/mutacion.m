function [gen] = mutacion(gen, prob_muta_indiv)
  prob_muta = rand();
  if (prob_muta <= prob_muta_indiv)
    idx_rand = randperm(length(gen));
    if (gen(1,idx_rand)=="1")
      gen(1,idx_rand)="0";
    else
      gen(1,idx_rand)="1";
    endif
  endif
endfunction