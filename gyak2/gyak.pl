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
fa_noveltje(leaf(L), leaf(L1)) :-
  L1 is L+1.
fa_noveltje(node(C1, C2), node(C3, C4)) :-
  fa_noveltje(C1, C3),
  fa_noveltje(C2, C4).

%6.
lista_hossza([], 0).
lista_hossza([_|T], L) :-
  lista_hossza(T, L1),
  L is L1+1.

%7.
lista_noveltje([X], [X1]) :- X1 is X+1.
lista_noveltje([H|T], [H1|T1]) :-
  lista_noveltje(T, T1),
  H1 is H+1.

%8.
lista_utolso_eleme([X], X).
lista_utolso_eleme([_|T], X) :-
  lista_utolso_eleme(T, X).

%9.
fa_levelerteke(leaf(L), L).
fa_levelerteke(node(C, _), C1) :-
  fa_levelerteke(C, C1).
fa_levelerteke(node(_, C), C1) :-
  fa_levelerteke(C, C1).

%10.
fa_reszfaja(T, T).
fa_reszfaja(node(C, _), C1) :-
  fa_reszfaja(C, C1).
fa_reszfaja(node(_, C), C1) :-
  fa_reszfaja(C, C1).

fa_levelerteke2(T, L) :-
  fa_reszfaja(T, leaf(L)).

%11.
lista_prefixuma([H|_], [H]).
lista_prefixuma([H|T], [H|T2]) :-
  lista_prefixuma(T, T2).

%+1
fa_melysege(leaf(_),0).
fa_melysege(node(C1, C2), D) :-
  fa_melysege(C1, D1),
  fa_melysege(C2, D2),
  D is max(D1, D2)+1.

%+2
fa_balerteke(leaf(L), L).
fa_balerteke(node(C, _), L) :-
  fa_balerteke(C, L).

%+3
fa_jobberteke(leaf(L), L).
fa_jobberteke(node(_, C), L) :-
  fa_jobberteke(C, L).

%+4.
fa_rendezett(leaf(_)).
fa_rendezett(node(C1, C2)) :-
  fa_rendezett(C1),
  fa_rendezett(C2),
  fa_balerteke(C1, L1),
  fa_balerteke(C2, L2),
  fa_jobberteke(C1, R1),
  fa_jobberteke(C2, R2),
  L1 =< R1,
  R1 < L2,
  L2 =< R2.

%+5.
fa_tukorkepe(leaf(L), leaf(L)).
fa_tukorkepe(node(C1, C2), node(C3, C4)) :-
  fa_tukorkepe(C1, C4),
  fa_tukorkepe(C2, C3).

%+6.
fa_tukros(T) :- fa_tukorkepe(T, T).

%+7.
prefix_length(_, [], 0).
prefix_length([H|T], [H|P], X) :-
  X > 0,
  X1 is X-1,
  prefix_length(T, P, X1).

%+8.
suffix_before(L, L, 0).
suffix_before([_|T], L, X) :-
  X>0,
  X1 is X-1,
  suffix_before(T, L, X1).

%+9.
sublist(L, P, B, Len) :-
  suffix_before(L, P1, B),
  prefix_length(P1, P, Len).

%+10.
lnko(A, 0, A).
lnko(A, B, L) :-
  B > 0,
  A1 is A mod B,
  lnko(B, A1, L).
