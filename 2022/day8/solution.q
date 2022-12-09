f:{(sum/)(|/)(flip reverse(>':)maxs reverse fi;reverse(>':)maxs reverse i;flip(>':)maxs fi:flip i;(>':)maxs i:read0 x)}
g:{(max/)prd(flip reverse each rvd each reverse each fi;reverse each rvd each reverse each i;flip rvd each fi:flip i;rvd each i:read0 x)}
rvd:{v'[t;reverse t:til count x;nxtGr[x]]}
nxtGr:{[l] {[l;i] first w where (w:where[l>=l i])>i}[l]each til count l}
