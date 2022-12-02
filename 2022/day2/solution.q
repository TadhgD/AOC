p1Score:`A`B`C`X`Y`Z!(1 2 3 1 2 3)
p1Outcome:(rps cross rps:1+til 3)!3 6 0 0 3 6 6 0 3
p2Score:`A`B`C`X`Y`Z!(1 2 3 0 3 6)
p2Outcome:(1 2 3 cross 0 3 6)!(3 1 2 1 2 3 2 3 1)
d2:{[f;s;o] sum scores[1]+o flip scores:s("SS";" ")0:f}
