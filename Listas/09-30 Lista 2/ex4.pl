#!/home/carlo/bin/swipl

% #region knowledge database
    man(americo).
    man(daniel).
    man(paulo).
    man(carlos).
    man(joaquim).
    man(felipe).

    woman(teresa).
    woman(sonia).
    woman(ana).
    woman(carla).
    woman(barbara).
    woman(maria).

    age(americo, 18).
    age(daniel, 60).
    age(paulo, 25).
    age(carlos, 37).
    age(joaquim, 80).
    age(felipe, 32).
    age(teresa, 18).
    age(sonia, 28).
    age(ana, 17).
    age(carla, 26).
    age(barbara, 51).
    age(maria , 79).

    siblings(americo, paulo).
    siblings(carlos, sonia).

    father(carlos, teresa).
    father(daniel, americo).
    father(daniel, paulo).
    father(joaquim, daniel).

    mother(maria, daniel).
    mother(barbara, ana).

    married(filipe, carla).
    married(americo, teresa).
    married(joaquim, maria).
% #endregion

% #region database extension
    vitor.
        mother(claudia, vitor).
            mother(jurema, claudia).
                mother(rosa, jurema).
                father(miro, jurema).
            father(raimundo, claudia).
        father(alberto, vitor).
            mother(neusa, alberto).
            father(albertopai, alberto).
    
    anabeatriz.
        mother(fabiana, anabeatriz).
        father(fabio, anabeatriz).
            mother(jurema, fabio).
            father(raimundo, fabio).

    catarina.
        mother(marcia, catarina).
            mother(jurema, marcia).
            father(raimundo, marcia).
        father(alexandre, catarian).

    priscila.
        mother(cida, priscila).
            mother(rosa, cida).
            father(miro, cida).
% #endregion

% #region 4a
    parent(A, B) :-
        father(A, B);
        mother(A, B).

    grandmother(X, Y) :-
        mother(X, Z),
        parent(Z, Y).
% #endregion

% #region 4b
    grandfather(X, Y) :-
        father(X, Z),
        parent(Z, Y).
% #endregion

% #region 4c
    greatgrandfather(X, Y) :-
        grandfather(X, Z),
        parent(Z, Y).
% #endregion

% #region 4d
    cousin_deg1(A, B) :-
        parent(C, A),
        parent(D, B),
        \+ parent(D, A),
        \+ parent(C, B),
        setof(E, (parent(E, C), parent(E, D)), _).
% #endregion

% #region 4e
    cousin(A, B) :-
        cousin_deg1(A, B).
    cousin(A, B) :-
        (parent(C, A), cousin(C, B));
        (parent(C, B), cousin(A, C)).
% #endregion

% #region 4f
    adult(A) :-
        age(A, B),
        B >= 18.
% #endregion

% #region 4g
    people(L) :-
        setof(A, (man(A); woman(A)), L).
% #endregion

% #region 4h
    elder(A) :-
        age(A, B),
        forall(age(_, D), B >= D).
% #endregion

% #region 4h
    list_people(L, m) :-
        findall([A, B], (man(A), age(A, B)), L).
    list_people(L, f) :-
        findall([A, B], (woman(A), age(A, B)), L).
% #endregion

% #region 4i
    appropriate(A, B) :-
        man(A),
        woman(B),
        age(A, C),
        age(B, D),
        (C >= D - 2),
        (D >= C - 10).
% #endregion

% :- set_prolog_flag(verbose, silent).
:- initialization(main).

main :-
    write("4a: all grandmothers\n"),
    forall(grandmother(X, Y), writef("%t %t\n", [X, Y])),
    write("\n"),

    write("4b: all grandfathers\n"),
    forall(grandfather(X, Y), writef("%t %t\n", [X, Y])),
    write("\n"),

    write("4c: all greatgrandfathers\n"),
    forall(greatgrandfather(X, Y), writef("%t %t\n", [X, Y])),
    write("\n"),

    write("4d: all cousin_deg1s\n"),
    forall(cousin_deg1(X, Y), writef("%t %t\n", [X, Y])),
    write("\n"),

    write("4e: all cousins\n"),
    forall(cousin(X, Y), writef("%t %t\n", [X, Y])),
    write("\n"),

    write("4f: all adults\n"),
    forall((adult(X), age(X, Y)), writef("%t %t\n", [X, Y])),
    write("\n"),

    write("4g: list people\n"),
    forall(people(L), writef("%t\n", [L])),
    write("\n"),

    write("4h: all elders\n"),
    forall((elder(X), age(X, Y)), writef("%t %t\n", [X, Y])),
    write("\n"),

    write("4i: list men\n"),
    forall(list_people(L, m), writef("%t\n", [L])),
    write("4i: list women\n"),
    forall(list_people(L, f), writef("%t\n", [L])),
    write("\n"),

    write("4h: all appropriate couples\n"),
    forall(appropriate(X, Y), writef("%t %t\n", [X, Y])),
    write("\n"),

    halt.
main :-
    halt.
