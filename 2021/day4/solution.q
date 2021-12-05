//
// tdowney, Advent of Code 2021, problem 4 part 1,
// Bingo player
//
findIndices:{[boards;num] cind:raze raze where''[num in'''boards[0]];rind:raze where each b:num in''boards[0];bind:where any'[b];(bind;rind;cind)}
markBoard:{[boards;bind;rind;cind] .[boards;(1;bind;rind;cind);:;1b]}
markBoards:{[boards;bind;rind;cind] markBoard/[;bind;rind;cind]boards}
hasWon:{[boards;bind;rind;cind] all[boards[1][bind]rind]|all flip[boards[1]bind]cind}
calcScore:{[boards;bind;num] num*sum sum each boards[0;bind]@'where each not boards[1;bind]}
genBoard:{[pool;size] (size*til size)_ neg[size*size]?pool} //! Might be broken
genBinaryBoard:{[size] size#enlist size#0b}
displayScores:{[boards;bind;num;score] show"Bingo! For board ",string[1+bind]," with number: ",string[num], ", score: ",string[score]}
boardSize:5 // Board size (given)

parseData:{[f]
	numbers:"J"$csv vs first 1#text:read0 f; / Read text file, grab numbers
	lines:lines where 0<count each lines:{[l] if[l~"";:()];l where not null l:"J"$" " vs l}each 2_ text;
	boards:((5*til nb:count[lines]div boardSize)_lines); / Parse boards
	boards:(boards;genBinaryBoard'[nb#boardSize]);
	(numbers;boards)
	}

bingo:{[f]
	`numbers`boards set'parseData f; / Parse data, save to variables
	play/[;numbers]boards;
	}


play:{[boards;num]
	if[(::)~boards;:(::)]; / Stop if we're finished
	$[count sum indices:findIndices[boards;num]; / Determine if and where the given number is on each board
		[
			`bind`rind`cind set'indices; / Set index variables
			boards:markBoards[boards;bind;rind;cind]; / Update boards with new state
			$[any b:hasWon[boards]'[bind;rind;cind]; / Determine if anyone has won
			[
				`bind`rind`cind set'flip flip[(bind;rind;cind)]where b; / Filter bind,rind,cind by b
				scores:calcScore[boards;;num]each bind; / Calc score based on that
				displayScores[boards;;num;]'[bind;scores];
				/ {[] show"Board ",string[1+bind]," wins with number: ",string[num], " and score: ",string[score]};
			];
			boards] / No winners, return the modified boards
		];
		boards] / The number doesn't exist on any board, return the unmodified boards
	}

bingo2:{[f]
	`numbers`boards set'parseData f;
	play2/[;numbers]boards;
	}

play2:{[boards;num]
	if[(::)~boards;:(::)]; / Stop if we're finished
	if[0=count boards;:(::)]; / Stop if no more boards
        $[count sum indices:findIndices[boards;num]; / Determine if and where the given number is on each board
                [
                        `bind`rind`cind set'indices; / Set index variables
                        boards:markBoards[boards;bind;rind;cind]; / Update boards with new state
                        $[any b:hasWon[boards]'[bind;rind;cind]; / Determine if anyone has won
                        [
				`bind`rind`cind set'flip flip[(bind;rind;cind)]where b; / Filter bind,rind,cind by b
                                scores:calcScore[boards;;num]each bind; / Calc score based on that
				displayScores[boards;;num;]'[bind;scores];
				boards[0]:boards[0]j:i where not (i:til count[boards[0]])in bind;
				boards[1]:boards[1]j;
				show "Boards left: ",string count boards[0];
				boards
                        ];
                        boards] / No winners, return the modified boards
                ];
                boards] / The number doesn't exist on any board, return the unmodified boards
        }
	
