
//
//
// First attempt
//
//
//cmds:" "vs''where["$"=i[;0]]_i:read0`:example.txt
//tree:flip `name`parent`size`typ!"SJJS"$/:()
//tree:tree upsert (`$"/";`;0N;`dir)
//.aoc.state:`curDir`parent`tree!(`$"/";`;tree)
//
//procCmds:{[cmd] $["ls"~cmd[0;1];ls cmd;cd cmd]}
//
//ls:{[cmd]
//	`.aoc.state.tree upsert 
//		addNode[.aoc.state.tree;.aoc.state.parent;;1b]each cmd where not "dir"~/:(cmd:1_cmd)[;0];
//	}
//
//cd:{[cmd]
//	$[".."~(cmd:first cmd)[2];
//		[.aoc.state.curDir:.aoc.state.parent;
//		.aoc.state.parent:exec first parent from .aoc.state.tree where name=.aoc.state.curDir];
//		[`.aoc.state.tree upsert addNode[.aoc.state.tree;.aoc.state.parent;cmd;0b];
//		.aoc.state.parent:.aoc.state.curDir;
//		.aoc.state.parent:`$last cmd]];
//	}
//
proc:{[wd;cmds] $["cd"~cmds[0;2 3];cd[wd;first cmds];ls[wd;cmds]]}
ls:{[wd;cmds] @[wd;`files;:;"J"$cmds[;0]where not "dir"~/:(cmds:1_ " "vs/:cmds)[;0]]}
cd:{[wd;cmd] cmd:" "vs cmd;$[".."~last cmd;wd:` sv -1_` vs wd;[wd:` sv wd,`$last cmd;wd set (1#.q),enlist[`files]!enlist 0#0]]}
getCmds:{where["$"=i[;0]]_i:read0 x}
getTotalSize:{[cur] $[`files in key cur;cur[`files],raze .z.s each` sv/:cur,/:key[cur];0]}
getDirPaths:{[root] $[count key root;root,raze .z.s each` sv/:root,/:key[root]except``files;()]}

f:{[x]
	proc/[`root;getCmds x];
	sum value[sizes]where value 100000>sizes::d!sum each getTotalSize each d:getDirPaths ` sv `root,`$"/"
	}

g:{[t;m] first l where m<=l+t-last l:asc sizes}
gargs:70000000 30000000

// Usage
// f`:input.txt
// g . gargs
