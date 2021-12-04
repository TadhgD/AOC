f:{(*/)"j"$0b sv'{((8-count[x]mod 8)#0b),x}each not scan avg'[flip x]>0.5}
g:{ (*/)"j"$0b sv'{((8-count[x]mod 8)#0b),x}each {[l;fn] i:0;while[(count[l]<>1)& i<>count first l;r:flip[l]i;l:l where r=fns[0]fn avg[r]>=0.5;i+:1];first l}[x]each(('[not;not]);not)}
