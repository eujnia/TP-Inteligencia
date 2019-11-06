function [dist] = distancia(v, b, caso)
  switch caso
    case 1
      dist = norm(v(1)-b(1), v(2)-b(2), 2);
    case 2
      dist = norm(v(1)-b(1), v(2)-b(2));
    case 3
      dist = abs(v(1)-b(1)) + abs(v(2)-b(2));
  endswitch
endfunction  