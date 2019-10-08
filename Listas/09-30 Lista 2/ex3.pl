#!/home/carlo/bin/swipl


result([A, E | L], [E | M]) :- 
    writef("result([%t, %t | %t], [%t | %t])\n", [A, E, L, E, M]),
    !, 
    result(L, M).
result(A, []) :-
    writef("result(%t, [])\n", [A]),
    true.

% :- set_prolog_flag(verbose, silent).
:- initialization(main).

main :-
    forall(result([a, b, c, d, e, f, g], X), writef("%t\n", [X])),

    forall(result([a, b, c, d, e, f], X), writef("%t\n", [X])),

    forall(result([], X), writef("%t\n", [X])),

    forall(result([a, b, c, d, e, f], [a]), writef("\n")),

    halt.
main :-
    halt.
