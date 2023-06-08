syracuse[num_] := 
 NestWhileList[
    If[
        EvenQ[#], #/2, 3*# + 1
        ] &, 
    num, 
    # != 1 &
    ]