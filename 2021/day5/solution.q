/ Day 5

parseNums:{[f] "J"$csv vs''{"->"vs x}each read0 f}
genGrid:{[nums] m#enlist (m:1+(max/)nums)#0}
vhLines:{[nums] nums where max each (=/)each nums}
calcPoints:{[p1;p2] m:max count each r:{(::;neg)[y<x]til (abs x-y)+1}.'flip(p1;p2);flip p1+m#'r}
add1:{[grid;point] .[grid;reverse point;+;1]}

f_:{[n] (sum/)1<{.[x;y;+;1]}/[;raze calcPoints .'n]genGrid n}
f1:{f_ vhLines parseNums x}
f2:{f_ parseNums x}
