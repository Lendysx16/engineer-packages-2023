bisect[f_, {a_, b_, eps_}] := Module[{low = a, high = b, c, fc},
  While[
    Abs[high - low] > eps, 
    c = Evaluate[low + (high - low)/2]; 

   fc = f[c];

    If[fc == 0, 
        Return[c], 
        If[
            f[low]*fc < 0, 
            high = c, 
            low = c]
        ]
    ];
  Return[
    Evaluate[low + (high - low)/2
        ]
    ]
]