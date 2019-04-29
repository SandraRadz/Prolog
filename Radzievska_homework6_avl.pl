%Написати програму обходу AVL-дерева(1).
%
%walk_avl(t(t(nil/0,1,nil/0)/1,3,t(t(nil/0,4,nil/0)/1,5,t(nil/0,8,nil/0)/1)/2)/3, List).
%List = [1,3,4,5,8]

walk_avl(nil/0, []).
walk_avl(t(LeftNode, Value, RightNode)/_, Result) :- walk_avl(LeftNode, LeftResult), walk_avl(RightNode, RightResult), append(LeftResult, [Value|RightResult], Result), !.

%Написати програму пошуку заданого елемента в AVL-дереві(1)
%find_el_in_avl(t(t(nil/0,1,nil/0)/1,3,t(t(nil/0,4,nil/0)/1,5,t(nil/0,8,nil/0)/1)/2)/3, 3).
%yes
%

find_el_in_avl(Tree, El):-walk_avl(Tree, List), helper2(List, El),!.
helper2([H|_], El):-H=El, !.
helper2([_|Tail], El):-helper2(Tail, El).


%Написати програму, яка перевірить чи є заданий об'єкт(1) AVL-деревом
%isAvl(t(t(nil/0,1,nil/0)/1,3,t(t(nil/0,4,nil/0)/1,5,t(nil/0,8,nil/0)/1)/2)/3).
%
isAvl(nil/0).
isAvl(t(LeftNode/LeftNodeDepth, Value, RightNode/RightNodeDepth)/Depth) :- helperBalanced(t(LeftNode/LeftNodeDepth, Value, RightNode/RightNodeDepth)/Depth),
				walk_avl(t(LeftNode/LeftNodeDepth, Value, RightNode/RightNodeDepth)/Depth, Array), helperSorted(Array).
helperSorted([]).
helperSorted([X]) :- integer(X).
helperSorted([H,H1|T]) :- H =< H1, helperSorted([H1|T]).
helperBalanced(nil/0).
helperBalanced(t(LeftNode/LeftNodeDepth, _, RightNode/RightNodeDepth)/Depth) :- Depth is max(LeftNodeDepth, RightNodeDepth)+1, abs(LeftNodeDepth - RightNodeDepth) =< 1, helperBalanced(LeftNode/LeftNodeDepth), helperBalanced(RightNode/RightNodeDepth).



%Написати програму видалення заданого вузла з дерева, не порушуючи його структуру: 
%бінарне сортуюче дерево (2).
%delete_from_avl(t(t(nil,1,nil),3,t(t(nil,4,nil),5,t(nil,8,nil))), 3, Tree).
%Tree = t(t(nil,1,nil),4,t(nil,5,t(nil,8,nil)))

delete_from_avl(nil, _, nil) :- !.
delete_from_avl(t(nil, Element, nil), Element, nil) :- !.
delete_from_avl(t(LeftSubTree, Element, nil), Element, LeftSubTree) :- !.
delete_from_avl(t(nil, Element, RightSubTree), Element, RightSubTree) :- !.
delete_from_avl(t(LeftSubTree, Element, RightSubTree), Element, Result) :- doRemoveElement(RightSubTree, RightSubTreeCut, MinimalValueFromRightSubTree), 
																		   Result = t(LeftSubTree, MinimalValueFromRightSubTree, RightSubTreeCut), !.
delete_from_avl(t(LeftSubTree, JustValue, RightSubTree), Element, Result) :- walk_tree(LeftSubTree, Res), contain(Res, Element),
																			 delete_from_avl(LeftSubTree, Element, LeftSubTreeCut), Result = t(LeftSubTreeCut, JustValue, RightSubTree), !.																	   
delete_from_avl(t(LeftSubTree, JustValue, RightSubTree), Element, Result) :- walk_tree(RightSubTree, Res), contain(Res, Element),
																			 delete_from_avl(RightSubTree, Element, RightSubTreeCut), 
																			 Result = t(LeftSubTree, JustValue, RightSubTreeCut), !.

doRemoveElement(t(nil, Element, nil), nil, Element) :- !.
doRemoveElement(t(nil, Element, RightSubTree), RightSubTree, Element) :- !.
doRemoveElement(t(LeftSubTree, Element, RightSubTree), Result, Removed) :- doRemoveElement(LeftSubTree, LeftSubTreeCut, Removed), Result = t(LeftSubTreeCut, Element, RightSubTree).

walk_tree(Tree, List):-helper1(Tree, [], List),!.
helper1(t(nil, Root, nil), H, H1):-appen(H, [Root], H1),!.
helper1(t(L, Root, R), H, List):-appen(H, [Root], H1), helper1(L, H1, H2), helper1(R, H2, List).
helper1(t(L, Root, nil), H, List):-appen(H, [Root], H1), helper1(L, H1, List).
helper1(t(nil, Root, R), H, List):-appen(H, [Root], H1), helper1(R, H1, List).

contain([H|_], El):-H=El,!.
contain([_|Tail], El):-contain(Tail, El).


appen([],L,L).
appen([X|L1],L2,[X|L]):-appen(L1,L2,L).

add_avl( nil/0, X, t( nil/0, X, nil/0)/1):-!.
 
add_avl( t(L, Y, R)/Hy, X, NewTree) :-
    X>Y,
    add_avl( R, X, t(R1, Z, R2)/_),
    append1( L, Y, R1, Z, R2, NewTree).
 
add_avl(t(L,Y,R)/Hy,X,NewTree):-
    X<Y,
    add_avl(L,X,t(L1,Z,L2)/_),
    append1(L1,Z,L2,Y,R,NewTree).
append1( T1/H1, A, t(T21, B, T22)/H2, C, T3/H3,
    t( t( T1/H1, A, T21)/Ha, B, t( T22, C, T3/H3)/Hc)/Hb) :-
    H2> H1, H2>H3,
    Ha is H1+1,
    Hc is H3+1,
    Hb is Ha+1.
append1( T1/H1, A, T2/H2, C, T3/H3,
    t( T1/H1, A, t( T2/H2, C, T3/H3)/Hc)/Ha) :-
    H1 >= H2, H1 >= H3,  
    max1( H2, H3, Hc),
    max1( H1, Hc, Ha).
append1( T1/H1, A, T2/H2, C, T3/H3,
    t( t( T1/H1, A, T2/H2)/Ha, C, T3/H3)/Hc) :-
    H3 >= H2, H3 >= H1,
    max1( H1, H2, Ha),
    max1( Ha, H3, Hc).
 
max1( U, V, M) :-
    U > V,  !,  M is U + 1;    
    M is V + 1.
   
%run:-read(X), make_tree(X,T), write(T), read(_).
%:-initialization(run).