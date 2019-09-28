function [cant_part] = leave_k_out(file, k, trn_file, tst_file)
  
  datos = csvread(file);
  n_pat = size(datos,1); %patrones
  n_col = size(datos,2); 
  cant_dat_tst = k; 
  cant_part = int16( n_pat / cant_dat_tst - 0.5); 
   
  %matrices de tranning y test por particion 
 
  idx_tst_m = [];
  idx_trn_m = [];
    
  indx = randperm(n_pat);
  
  for i=1:cant_part  
    
    idx_tst=indx(1:cant_dat_tst);
    idx_trn=indx(cant_dat_tst+1:n_pat);
    
    idx_tst_m = [idx_tst_m idx_tst'];
    idx_trn_m = [idx_trn_m idx_trn'];
    
    %mover el k hacia abajo
    
    indx_aux = indx(cant_dat_tst+1:n_pat); %muevo xd
    indx_aux = [indx_aux indx(1:cant_dat_tst)]; %copio los primeros de indx en el final de aux 
    
    indx = indx_aux;
  endfor 

  csvwrite(tst_file,idx_tst_m);
  csvwrite(trn_file,idx_trn_m);
  
endfunction
