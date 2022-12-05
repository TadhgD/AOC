getInput:{
  l:(0,where 0=count each l)_ l:read0 x;
  state:trim flip reverse state[;where not 10=.Q.n?last state:l 0];
  moves:"J"$string(`$" "vs'1_ l 1)[;1 3 5];
  (state;moves)
  }
f:{i:getInput x;last each iter/[i 0;i 1]}
g:{i:getInput x;last each iter2/[i 0;i 1]}

// Helpers
iter:{[acc;move] add[;move;] . sub[acc;move]}
add:{[acc;move;val] @[acc;move[2]-1;,;val]}
sub:{[acc;move] val:reverse (m:neg move 0)#@[acc;move[1]-1];(@[acc;move[1]-1;_[m]];val)}
sub2:{[acc;move] val:(m:neg move 0)#@[acc;move[1]-1];(@[acc;move[1]-1;_[m]];val)}
iter2:{[acc;move] add[;move;] . sub2[acc;move]}
