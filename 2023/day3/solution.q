n:{[i;r] (i-r+1;i-r;i-r-1;i-1;i+1;i+r-1;i+r;i+r+1)}
fnn:{[l;rc]
	s:distinct l where not l in .Q.n,"."; / Compute symbols

    //
    // Compute all neighbours of all symbols, returning those
    // the indices of neighbours which are numbers
    //
    numnbrs:nbrs@'where each l[nbrs:flip n[where l in s;rc]]in\:.Q.n;

    numinds:(where 1<>deltas w)cut w:where l in .Q.n; / Split up the runs of numbers into sublists

	{[ni;nn] ni where any each ni in\:nn}[numinds]each numnbrs / Return sublists whose indices intersect with any in the numbers list
	}

f:{[input]
	l:raze p,(".",/:input,'"."),p:enlist(rc:2+count input 0)#"."; / Pad and flatten
	sum "J"$raze l each fnn[l;rc] / Sum numeric neighbours
	}

g:{[input]
	l:raze p,(".",/:input,'"."),p:enlist(rc:2+count input 0)#"."; / Pad and flatten
	sum prd each "J"$l each res where 2=count each res:fnn[l;rc] / Sum products of gears
	}
