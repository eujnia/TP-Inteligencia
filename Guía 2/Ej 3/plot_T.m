data=csvread("te.csv");
for i=1:size(data,1)
  plot(data(i,1),data(i,2),'or'); hold on;
endfor
