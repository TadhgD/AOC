f:{sum {x:get each x;$[any x:x[1] in x[0];2 xexp sum[x]-1;0]}each"|"vs/:(":"vs/:x)[;1]}
g:{c+sum count each group(raze/)value each(d\)d:(1+til c)!{[r;x] x:get each x;r+1+til sum x[1] in x 0}'[1+til c:count i;i:"|"vs/:(":"vs/:x)[;1]]}
