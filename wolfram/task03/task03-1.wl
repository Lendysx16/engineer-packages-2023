k = a*x^2 + b*x + c == 0
x1 = 2*c/(Sqrt[b^2 - 4*a*c] - b)
x2 =  2*c/(-Sqrt[b^2 - 4*a*c] - b)

res1 = k/.x -> x1
res2 = k/.x -> x2
res1 = Simplify[res1]
res2 = Simplify[res2]

Print[res1]
Print[res2]