pr:a!1+til count a:.Q.a,.Q.A
f:{sum raze {distinct (inter). x(0,floor c%2)_til c:count x}each pr read0 x}
g:{sum {distinct (inter/) x}each (3*til "j"$count[l]%3)_l:pr read0 x}

// Optimized (not for use in competition)
fn:{sum{first(inter/)2 0N#x}each 1+.Q.an?read0 x}
gn:{sum{first(inter/)x}each 3 cut 1+.Q.an?read0 x}
