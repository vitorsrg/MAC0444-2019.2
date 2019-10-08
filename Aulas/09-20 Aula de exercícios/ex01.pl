criminal(X) :- american(X), weapon(Y), hostile(Z), sells(X, Y, Z).
enemy(nono, america).
missile(m).
owns(nono, m).
sells(west, V, nono) :- missile(V), owns(nono, V).
american(west).
weapon(U) :- missile(U).
hostile(T) :- enemy(T, america).
