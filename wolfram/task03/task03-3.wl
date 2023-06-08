f = Sin[x ^ 2] - Cos[x ^ 3] == 0;
f2 = Sin[x ^ 2] - Cos[x ^ 3];
res = NSolve[f && 0 <= x <= Pi ];
Plot[f2, {x, 0, Pi},
 Epilog -> {Blue, AbsolutePointSize[4], Point[{x, 0} /. res]}]