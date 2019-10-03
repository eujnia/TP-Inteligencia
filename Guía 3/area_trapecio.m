function area = area_trapecio(mem)
  
  areas=zeros(3,1);
  
  if mem(1) != mem(2)
      %área del triángulo base por altura sobre 2
      areas(1)=(mem(2)-mem(1))/2;
  endif
  
  if mem(2) != mem(3)
      %área del triángulo base por altura sobre 2
      areas(2)=mem(3)-mem(2);
  endif
  
  if mem(3) != mem(4) 
      %área del triángulo base por altura sobre 2
      areas(3)=(mem(4)-mem(3))/2;
  endif
  
  %cálculo del área total
  area=sum(areas);
  
endfunction