Cases[x /. NSolve[x^9 + 3.4*x^6 - 25*x^5 - 213 x^4 - 477*x^3 + 1012 x^2 + 111*x - 123, x], 
n_ /; Re[n] < 0 && Im[n] == 0
]