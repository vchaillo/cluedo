swap(g, d).
swap(d, g).
swap(droite, gauche).
swap(gauche, droite).

traverse([X, X, Chevre, Choux], ' avec le loup.', [Y, Y, Chevre, Choux]) :-
	swap(X, Y).
traverse([X, Loup, X, Choux], ' avec la chevre.', [Y, Loup, Y, Choux]) :-
	swap(X, Y).
traverse([X, Loup, Chevre, X], ' avec le choux.', [Y, Loup, Chevre, Y]) :-
	swap(X, Y).
traverse([X, Loup, Chevre, O], ' seul.', [Y, Loup, Chevre, O]) :-
	swap(X, Y).


explain(X, L) :-
	X = [].
explain(X, L) :-
	[Term|Y] = X,
	write('Le peon traverse vers la rive '),
	write(L),
	writenl(Term),
	swap(L, Nl),
	explain(Y, Nl).

test(X, X, _).
test(X, _, X).

safe([Peon, Loup, Chevre, Choux]) :-
	test(Peon, Loup, Chevre),
	test(Peon, Chevre, Choux).

solve :- 
	length(X, 7),
	transfert([d,d,d,d], X),
	writenl('Tout le monde est sur la rive gauche.'),
	explain(X, droite),
	writenl('Tout le monde est sur la rive droite!'), !.

transfert([g, g, g, g], []).
transfert(Place, [Move|Suite])	 :-
	traverse(Place, Move, New_place),
	safe(New_place),
	transfert(New_place, Suite).