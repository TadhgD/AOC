pr:('[();-1@])
d:{sqrt sum abs[x-y]xexp 2}
genState:{ `head`tail`vis!((0 0);(0 0);())}
dirToMoves:`R`L`U`D!({flip(x#1;x#0)};{flip(neg x#1;x#0)};{flip(x#0;x#1)};{flip(x#0;neg x#1)})
procMoves:{[state;move] / Calculate moves to head, apply to state
	pr .Q.s move;
	procMove/[state;dirToMoves[move 0]move 1] / Determine moves, call helper
	}

procMove:{[state;move] / Move head, move tail if necessary and modify grid, return state
	pr .Q.s state;
	state:@[state;`head;+;move]; / Move the head
	$[d[state`head;state`tail]>=2; / Determine if we need to move tail
		[state:@[state;`tail;+;signum state[`head]-state`tail]; / Move tail in appropriate direction
		@[state;`vis;,;enlist state`tail]]; / Update grid, return state
		state] / Otherwise, return unchanged state
	}

f:{ count procMoves/[genState[];flip("SJ";" ")0: x]`vis}
