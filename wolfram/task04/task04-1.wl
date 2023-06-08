myFindRoot[fun_, xstart_, eps_] := 
     NestWhile[
        # - fun[#]/fun'[#] &, 
        N[xstart], 
        Abs[
            fun[#1] - fun[#2]
            ] > eps &, 2]