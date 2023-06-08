difur[x_] = 
 y[x] /. First[
   DSolve[
    {y [x] Tan[x] + Derivative[1][y][x] == Sin[2 x], y[0] == 2},
     y, x]
     ]
Plot[difur[x], {x, -4 Pi, 4 Pi}]
