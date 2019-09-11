function [file_trn,file_tst] = particionar(file, cant_part, p_trn)
     
  datos = csvread(file);
  n_pat = size(datos,1); %patrones
  n_col = size(datos,2); 
  
  cant_dat_trn = n_pat * p_trn;
  
  %matrices de tranning y test por partición  
  m_part_trn=[];
  m_part_tst=[];
  
  for k=1:cant_part
    
    indx = randperm(n_pat);
    idx_trn=indx(1:cant_dat_trn)';
    idx_tst=indx(cant_dat_trn+1:n_pat)';
    
    v_elem_trn=[];
    v_elem_tst=[];
    
    n_trn = size(idx_trn(:,1),1); %800
    n_tst = size(idx_tst(:,1),1); %200 
    
    %tranning
    
    for i=1:1:n_trn
      
      elem = datos(idx_trn(i,1), :)'; %[elem será columna un ratito]
      v_elem_trn = [v_elem_trn elem]; %vector de los elem  matriz de (4,800)
      
    endfor
    
    v_elem_trn = v_elem_trn'; %queda de (800,4)
    m_part_trn = [m_part_trn v_elem_trn]; %(lo agregamos a la matriz)
    %test
    
    for i=1:1:n_tst
      
      elem = datos(idx_tst(i,1), :)';
      v_elem_tst = [v_elem_tst elem];
      
    endfor
    v_elem_tst = v_elem_tst';
    m_part_tst = [m_part_tst v_elem_tst];

    
  endfor
  %m_part_trn tiene los elementos dato uno al lado del otro (mat de 800,20)

  csvwrite('p_trn.csv',m_part_trn);
  csvwrite('p_tst.csv',m_part_tst);
  
  file_trn= 'p_trn.csv';
  file_tst= 'p_tst.csv';

endfunction
