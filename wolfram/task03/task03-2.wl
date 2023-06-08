Clear[x, y];
eqs = {x^2*y + x*y^2 == 2, x^3*y + x*y^3 == 3};
pts = {x, y} /. 
  NSolve[{x^2*y + x*y^2 == 2, x^3*y + y^2/4 - 2 == 0}, {x, y}];
realpts = Select[pts, Im[#[[1]]] == 0 && Im[#[[2]]] == 0 & ];
ContourPlot[{x^2*y + x*y^2 == 2, x^3*y + x*y^3 == 3}, {x, -10, 10}, {y, -10, 10}, 
 ContourStyle -> {{Red}, {Blue}}, 
 Epilog -> {PointSize[Large], Black, Point[realpts]}];