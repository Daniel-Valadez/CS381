/***************************************/
%     CS 381 - Programming Lab #5       %
%                                       %
%  < Daniel Valadez >                   %
%  < valadezd@oregonstate.edu >         %
%                                       %
/***************************************/

% load family tree
:- consult('royal.pl').

% enables piping in tests
portray(Term) :- atom(Term), format("~s", Term).



% your code here...
%man(socrates).
%mortal(X) :- man(X).
%write('Hello World')
%mother/2
mother(M, C) :- parent(M, C), female(M).
%?- mother(X, 'Queen Elizabeth II').

%father/2
father(F, C) :- parent(F, C), male(F).
%?- father(X, 'Queen Elizabeth II').

%Immediate Family:

%spouse(X, Y) :- married(X, Y), male(X) ; married(X, Y), female(Y).
spouse(X, Y) :- married(Y, X), male(Y) ; married(X, Y), female(Y).
%?- spouse(X, 'Queen Elizabeth II').
%?- spouse('Prince Phillip: Duke of Edinburgh', Y).

child(X, Y) :- parent(Y, X).
%?- child('King George V', Y).
son(X, Y) :- child(X, Y), male(X).
daughter(X, Y) :- child(X, Y), female(X).
%?- daughter('King George V', Y).
%?- son('King George V', Y).
sibling(X, Y) :- father(F, Y), child(X, F), X\==Y.
%?- sibling('King George VI', Y).
sister(X, Y) :- sibling(Y, X), female(X), X\==Y.
brother(X, Y) :- sibling(Y, X), male(X), X\==Y.

%Immediate Family End. 
%
%Extended family start

%by-blood aunt and uncle 
aunt(X, Y) :- 
    parent(Z, Y), 
    sibling(Z, X), 
    female(X).
aunt(X, Y) :-
    parent(Z, Y),
    sibling(Z, G),
    spouse(G, X),
    female(X).

%aunt(X, Y) :- uncle(Z, X), spouse(Z, Y).
uncle(X, Y) :- 
    parent(Z, Y), 
    sibling(Z, X), 
    male(X).
uncle(X, Y) :-
    parent(Z, Y),
    sibling(Z, G),
    spouse(G, X),
    male(X).

grandparent(X, Y) :- parent(Z, Y), parent(X, Z).
grandmother(X, Y) :- grandparent(X, Y), female(X).
grandfather(X, Y) :- grandparent(X, Y), male(X).
grandchild(X, Y) :- parent(Y, Z), parent(Z, X).


%uncle(X, Y) :- aunt(Z, X), spouse(Z, Y).

%?- uncle(X, 'Queen Elizabeth II').
%?- aunt(X, 'Queen Elizabeth II').


ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

%This one was a little more confusing so I had to spell it out. 
descendant(Person, Descendent) :- parent(Descendent, Person).
descendant(Person, Descendent) :- parent(Descendent, Someone), descendant(Person, Someone).

older(X, Y) :- born(X, Z), born(Y, A), Z < A.
younger(X, Y) :- born(X, Z), born(Y, A), Z > A. 
regentWhenBorn(X, Y) :- born(Y, A), reigned(X, M, N), M<A, N>A.






