function area = area_trapecio(membresia)
  
  areas=zeros(3,1);
  
  if membresia(1) != membresia(2)
      %área del triángulo base por altura sobre 2
      areas(1)=(membresia(2)-membresia(1))/2;
  endif
  
  if membresia(2) != membresia(3)
      %área del triángulo base por altura sobre 2
      areas(2)=membresia(3)-membresia(2);
  endif
  
  if membresia(3) != membresia(4) 
      %área del triángulo base por altura sobre 2
      areas(3)=(membresia(4)-membresia(3))/2;
  endif
  
  %cálculo del área total
  area=sum(areas);
  
endfunction