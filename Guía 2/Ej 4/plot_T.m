data=csvread("clouds.csv");
for i=1:size(data,1)
  if data(i,3) == 1
  plot(data(i,1),data(i,2),'or'); hold on;
endif
 if data(i,3) == 0
  plot(data(i,1),data(i,2),'og'); hold on;
  endif
endfor
