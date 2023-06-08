fib10num = 55;
f = 2*x*y^4 + x^2 * y^3 - 2* x^3 * y^2 - y ^ 5 - x^4 * y + 2y;
pts = {x, y}/. Solve[f == fib10num && x > 0, {x, y}, Integers ];
pts