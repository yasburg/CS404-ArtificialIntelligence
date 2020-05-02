%Yasin AYDIN - 04/23/2020

man(ali).
man(mehmet).
man(yunus).

woman(elif).
woman(nelin).
woman(zeynep).

person(X) :- man(X).
person(X) :- woman(X).

%Making sure that program understands that each person is unique (will be used for intruments as well)->

all_unique(A, B, C, D, E, F) :- person(A), person(B), person(C), person(D), person(E), person(F),
	\+ A=B, \+ A=C, \+ A=D, \+ A=E, \+ A=F,
	\+ B=C, \+ B=D, \+ B=E, \+ B=F,
	\+ C=D, \+ C=E, \+ C=F,
	\+ D=E, \+ D=F,
	\+ E=F.

location(kitchen).
location(diningroom).
location(study).
location(bathroom).
location(pantry).
location(livingroom).

instrument(hammer).
instrument(knife).
instrument(handsaw).
instrument(chemical).
instrument(gun).
instrument(weldingmachine).

findsuspect(X) :- 	all_unique(Kitchen, Diningroom, Study, Bathroom, Pantry, Livingroom),
			all_unique(Hammer, Knife, Handsaw, Chemical, Gun, Weldingmachine),
													%Clue 1:
			man(Kitchen),									%'The man in the kitchen'
			\+ Kitchen=Knife, \+ Kitchen=Hammer, \+ Kitchen=Weldingmachine, \+ Kitchen=Gun,	%'not found with the knife, hammer, or welding machine'

													%Clue 2:
			woman(Bathroom), woman(Study),							%Guaranteed to have woman in these rooms
			\+ nelin=Bathroom, \+ nelin=Study,						%Nelin cannot be in these rooms
			\+ elif=Diningroom, \+ elif=Kitchen, \+ elif=Livingroom, \+ elif=Pantry,	%Elif cannot be in other rooms
			\+ zeynep=Diningroom, \+ zeynep=Kitchen, \+ zeynep=Livingroom, \+ zeynep=Pantry,%Zeynep cannot be in other rooms

													%Clue 3:
			\+ Hammer=Bathroom, \+ Hammer=Diningroom, 					%'hammer was not in the bathroom nor dining room'
			\+ elif=Hammer, \+ ali=Hammer,							%'this person was nor Elif or Ali'
			
													%Clue 4:
			Weldingmachine=Study,							%'welding machine was found in study'
			woman(Weldingmachine),							%'with a woman'

													%Clue 5:
			man(Livingroom),								%both candidates are man
			\+ Livingroom=yunus,								%it is Mehmet or Ali so cannot be Yunus

													%Clue 6:
			\+ Knife=Diningroom,								%'knife was not in the dining room'

													%Clue 7:
			\+ zeynep=Study, \+ zeynep=Pantry,						%'Zeynep was not with intrument in the study and pantry'

													%Clue 8:
			Gun=ali,									%'Ali with the gun'			
													%Clue 9:
			Pantry=Handsaw, Pantry=X,								%Robbery with handsaw so suspect uses handsaw
			write('Suspect: '), write(X), nl, nl, 
			outputanswers(Kitchen, Diningroom, Study, Bathroom, Pantry, Livingroom, Hammer, Knife, Handsaw, Chemical, Gun, Weldingmachine).

outputanswers(Kitchen, Diningroom, Study, Bathroom, Pantry, Livingroom, Hammer, Knife, Handsaw, Chemical, Gun, Weldingmachine) :-
	write(Kitchen), write(' was in Kitchen'), nl,
	write(Diningroom), write(' was in Diningroom'), nl,
	write(Study), write(' was in Study'), nl,
	write(Bathroom), write(' was in Bathroom'), nl,
	write(Pantry), write(' was in Pantry'), nl,
	write(Livingroom), write(' was in Livingroom'), nl, nl,

	write(Hammer), write(' had the Hammer'), nl,
	write(Knife), write(' had the Knife'), nl,
	write(Handsaw), write(' had the Handsaw'), nl,
	write(Chemical), write(' had the Chemical'), nl,
	write(Gun), write(' had the Gun'), nl,
	write(Weldingmachine), write(' had the Weldingmachine').






























