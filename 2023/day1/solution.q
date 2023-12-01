f:{sum "J"$flip (first each x;last each x:trim .Q.n .Q.n?x)}
nums:("one";"two";"three";"four";"five";"six";"seven";"eight";"nine")
map:nums!1_.Q.n
findNums:{[i] W:map nums where count each iW:i ss/:nums;N:.Q.n where count each iN:i ss/:.Q.n;"J"$(first r;last r:raze[W,N]iasc raze iW,iN)}
g:{sum findNums each x}


/q)f:{sum "J"$flip (first each x;last each x:trim .Q.n .Q.n?x)}
/q)nums:("one";"two";"three";"four";"five";"six";"seven";"eight";"nine")
/q)map:nums!1_.Q.n
/q)findNums:{[i] W:map nums where count each iW:i ss/:nums;N:.Q.n where count each iN:i ss/:.Q.n;"J"$(first r;last r:raze[W,N]iasc raze iW,iN)}
/q)g:{sum findNums each x}
/q)f read0`:input.txt
/55130
/q)g read0`:input.txt
/54985
