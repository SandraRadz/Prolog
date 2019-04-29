%Хто власник риби?
%fish_owner(OwnerOfTheFish).
%OwnerOfTheFish = german

house(_,_,_,_,_).

areNeighbours(X, Y, List) :- isNextTo(X, Y, List).
areNeighbours(X, Y, List) :- isNextTo(Y, X, List).

isNextTo(L, R, [L, R | _]).
isNextTo(L, R, [_ | Rest]) :- isNextTo(L, R, Rest).

numberOfElementInArray(1, [Elem | _], Elem).
numberOfElementInArray(N, [_ | Rest], Elem) :- N > 1, N1 is N-1, numberOfElementInArray(N1, Rest, Elem).


fish_owner(OwnerOfTheFish, Neighbourhood) :-
Neighbourhood = [_,_,_,_,_],
numberOfElementInArray(1, Neighbourhood, house(norwegian,_,_,_,_)),
member(house(englishman,_,_,_,red), Neighbourhood),
isNextTo(house(_,_,_,_,green), house(_,_,_,_,white), Neighbourhood),
member(house(dane,_,_,tea,_), Neighbourhood),
areNeighbours(house(_,_,marlboro,_,_), house(_,cat,_,_,_), Neighbourhood),
member(house(_,_,dunhill,_,yellow), Neighbourhood),
member(house(german,_,rothmans,_,_), Neighbourhood),
numberOfElementInArray(3, Neighbourhood, house(_,_,_,milk,_)),
areNeighbours(house(_,_,marlboro,_,_), house(_,_,_,water,_), Neighbourhood),
member(house(_,bird,pallmall,_,_), Neighbourhood),
member(house(swede,dog,_,_,_), Neighbourhood),
areNeighbours(house(norwegian,_,_,_,_), house(_,_,_,_,blue), Neighbourhood),
member(house(_,horse,_,_,blue), Neighbourhood),
member(house(_,_,winfield,beer,_), Neighbourhood),
member(house(_,_,_,coffee,green), Neighbourhood),
member(house(OwnerOfTheFish,fish,_,_,_), Neighbourhood), !.

%бонусні на логіку
%     Летіла зграя гусей, побачив їх дядько та каже:
%– Мабуть, вас сто!
%А гуси й відповідають:
%– «Якби нас стільки,
%Та ще б стільки,
%Та половину як стільки,
%Та чверть як стільки,
%Та ти б з нами, – тоді б сто й було».
%     Скільки гусей?

fill(-1):-!.
fill(X):-asserta(d(X)),X1 is X-1,fill(X1).

task2(X):-d(X), R1 is X+X, d(Q), X is Q * 2, R2 is R1+Q, d(W), X is W*4, 
				R3 is R2+W, 100 is R3+1.


