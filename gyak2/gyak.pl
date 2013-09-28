%1.
seq(N, N, L) :- L = [N].
seq(A, B, [A|T]) :- B>A, A1 is A+1, seq(A1, B, T).

%2.
max(X,X) :- X>0.
max(N,X) :- N>0, N1 is N-1, max(N1, X).

%3.
hatv(_, 0, 1).
hatv(A, N, S1) :- N>0, N1 is N-1, hatv(A, N1, S), S1 is A*S.

%4.
fa_pontszama(leaf(_), 0).
fa_pontszama(node(C1, C2), S) :-
  fa_pontszama(C1, S1),
  fa_pontszama(C2, S2),
  S is S1+S2+1.

%5.
fa_noveltje(leaf(L), leaf(L1)) :- L1 is L+1.
fa_noveltje(node(C1, C2), node(C3, C4)) :-
  fa_noveltje(C1, C3),
  fa_noveltje(C2, C4).

%6.
lista_hossza([], 0).
lista_hossza([_|T], L) :- lista_hossza(T, L1), L is L1+1.

%7.
lista_noveltje([X], [X1]) :- X1 is X+1.
lista_noveltje([H|T], [H1|T1]) :- lista_noveltje(T, T1), H1 is H+1.

%8.
lista_utolso_eleme([X], X).
lista_utolso_eleme([_|T], X) :- lista_utolso_eleme(T, X).

%9.
fa_levelerteke(leaf(L), L).
fa_levelerteke(node(C, _), C1) :- fa_levelerteke(C, C1).
fa_levelerteke(node(_, C), C1) :- fa_levelerteke(C, C1).

%10.
fa_reszfaja(T, T).
fa_reszfaja(node(C, _), C1) :- fa_reszfaja(C, C1).
fa_reszfaja(node(_, C), C1) :- fa_reszfaja(C, C1).

fa_levelerteke2(T, L) :-  fa_reszfaja(T, leaf(L)).

%11.
lista_prefixuma([H|_], [H]).
lista_prefixuma([H|T], [H|T2]) :- lista_prefixuma(T, T2).

