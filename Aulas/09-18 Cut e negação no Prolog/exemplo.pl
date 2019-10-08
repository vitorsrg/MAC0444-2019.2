concat_lists([], List, List).
concat_lists([Elem|List1], List2, [Elem|List3]) :-
   concat_lists(List1, List2, List3).

permutation([], []).
permutation(List, [Element | Permutation]) :-
   select(Element, List, Rest),
   permutation(Rest, Permutation).

remove_duplicates([], []).
remove_duplicates([Head | Tail], Result) :-
      member(Head, Tail),!,
      remove_duplicates(Tail, Result).
remove_duplicates([Head | Tail], [Head | Result]) :-
      remove_duplicates(Tail, Result).


add(X,Lista,L2):- 
    remove_duplicates([X|Lista],L2).

add1(X,Lista,Lista) :- 
    member(X,Lista),!.

add1(X,Lista,[X|Lista]).


add2(X,Lista,[X|Lista]) :- 
    \+member(X,Lista),!.

add2(_,Lista,Lista).
