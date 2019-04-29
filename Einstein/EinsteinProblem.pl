%чия рибка?

test:-
  open('einsteinRules.txt', read, Str),
  read_file(Str,Lines),
  close(Str), solve, nl.

read_file(Stream, Lines) :-
    read(Stream, Line),               
    (  at_end_of_stream(Stream)      
    -> Lines = []                     
    ;  Lines = [Line|NewLines],
       asserta(Line),                 
       read_file(Stream, NewLines)   
    ).
printlist([]).
printlist([X|List]) :-
        write(X),nl,
        printlist(List).	

house(_,_,_,_,_).
		
isNextTo(L, R, [L, R | _]).
isNextTo(L, R, [_ | Rest]) :- isNextTo(L, R, Rest).

areNeighbours(X, Y, List) :- isNextTo(X, Y, List).
areNeighbours(X, Y, List) :- isNextTo(Y, X, List).
	
solve:- einstein(Houses,Owner),write('All houses: '),nl, printlist(Houses),
                         nl,write('The owner of the fish is '),write(Owner).
