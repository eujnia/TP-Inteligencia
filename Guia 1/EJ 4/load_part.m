function [v_elem_trn,v_elem_tst] = load_part(file_data, file_indx_trn, file_indx_tst, n_part)

  v_elem_trn = [];
  v_elem_tst = [];
  
  data     = csvread(file_data); 
  indx_trn = csvread(file_indx_trn); 
  indx_tst = csvread(file_indx_tst);
  
  ntrn = size(indx_trn,1);
  ntst = size(indx_tst,1);

  v_elem_trn = data(indx_trn(:,n_part),:);
  
  v_elem_tst = data(indx_tst(:,n_part),:);
 
endfunction
