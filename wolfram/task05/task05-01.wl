Cases[
    Range[100], 
    (x_ /; Divisible[x, 2]) | (x_ /; Divisible[x, 3]) | (x_ /; Divisible[x, 5])
    ]