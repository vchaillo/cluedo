% Enigme d'Einstein.

% - L’Anglais vit dans la maison rouge.
% - Le Suédois a des chiens.
% - Le Danois boit du thé.
% - La maison verte est à gauche de la maison blanche.
% - Le propriétaire de la maison verte boit du café.
% - La personne qui fume des Pall Mall a des oiseaux.
% - Le propriétaire de la maison jaune fume des Dunhill.
% - La personne qui vit dans la maison du centre boit du lait.
% - Le Norvégien habite dans la première maison.
% - L’homme qui fume des Blend vit à côté de celui qui a des chats.
% - L’homme qui a un cheval est le voisin de celui qui fume des Dunhill.
% - Le propriétaire qui fume des Blue Master boit de la bière.
% - L’Allemand fume des prince.
% - Le Norvégien vit juste à côté de la maison bleue.
% - L’homme qui fume des Blend a un voisin qui boit de l’eau.

color_look(X, Color) :-
	soluce(L),
	member((A, B, C, D, Color), L),
	X = [A, B, C, D, Color].

nat_look(X, Nat) :-
	soluce(L),
	member((Nat, A, B, C, D), L),
	X = [Nat, A, B, C, D].

drink_look(X, Drink) :-
	soluce(L),
	member((A, B, C, Drink, D), L),
	X = [A, B, C, Drink, D].

smoke_look(X, Smoke) :-
	soluce(L),
	member((A, B, Smoke, C, D), L),
	X = [A, B, Smoke, C, D].

pet_look(X, Pet) :-
	soluce(L),
	member((A, Pet, B, C, D), L),
	X = [A, Pet, B, C, D].

poisson_owner(Owner) :-
	soluce(L),
	member((Owner,poisson,_,_,_), L).

soluce(L) :-
	length(L, 5),
	member((anglais,_,_,_,rouge), L),
	member((suedois,chiens,_,_,_), L),
	member((_,_,_,cafe,verte), L),
	member((danois,_,_,the,_), L),
	gauche((_,_,_,_,verte), (_,_,_,_,blanche), L),
	member((_,oiseaux,pall_mall,_,_), L),
	member((_,_,dunhill,_,jaune), L),
	L = [_,_,(_,_,_,lait,_),_,_],
	L = [(norvegien,_,_,_,_)|_],
	voisin((_,chats,_,_,_), (_,_,blend,_,_), L),
	voisin((_,_,dunhill,_,_), (_,cheval,_,_,_), L),
	member((_,_,blue_master,biere,_), L),
	member((allemand,_,prince,_,_), L),
	voisin((norvegien,_,_,_,_), (_,_,_,_,bleue), L),
	voisin((_,_,blend,_,_), (_,_,_,eau,_), L),
	member((_,poisson,_,_,_), L).

voisin(A, B, Ls) :- append(_, [A,B|_], Ls).
voisin(A, B, Ls) :- append(_, [B,A|_], Ls).
gauche(A, B, Ls) :- append(_, [A,B|_], Ls).
