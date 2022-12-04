f:{sum{all[(in/)reverse x]|all (in/)x:("J"$"-"vs'x)[;0]+til each 1+abs value each x}each csv vs'read0 x}
g:{sum{any (in/)x:("J"$"-"vs'x)[;0]+til each 1+abs value each x}each csv vs'read0 x}


/ q)\ts f`:input.txt
/ 8 144672
/ q)\ts g`:input.txt
/ 7 144672
