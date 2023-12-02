genTbl:{flip`gameID`red`green`blue!flip("J"$5_/:(":"vs/:x)[;0]),'{[x] value `red`green`blue#max each key[g]!raze["J"$x[;;0]] value g:group[`$raze[x[;;1]]]}each" "vs/:/:/:trim each","vs/:/:";"vs/:(":"vs/:x)[;1]}
f:{[i;r;g;b] sum ?[genTbl i;(((';~:;>);`red;r);((';~:;>);`green;g);((';~:;>);`blue;b));();`gameID]}
g:{[i] sum ?[genTbl i;();();(*;`red;(*;`green;`blue))]
