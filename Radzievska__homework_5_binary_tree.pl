
%Написати програму, яка здійснює обхід бінарного дерева зліва-направо.
%test
%walk_tree(tree(tree(tree(nil,1,nil),2,tree(nil,3,nil)),4,tree(tree(tree(nil,5,nil),6,tree(nil,7,nil)),8,nil)), R).
%result
%R = [4,2,1,3,8,6,5,7]

walk_tree(Tree, List):-helper1(Tree, [], List),!.
helper1(tree(nil, Root, nil), H, H1):-appen(H, [Root], H1),!.
helper1(tree(L, Root, R), H, List):-appen(H, [Root], H1), helper1(L, H1, H2), helper1(R, H2, List).
helper1(tree(L, Root, nil), H, List):-appen(H, [Root], H1), helper1(L, H1, List).
helper1(tree(nil, Root, R), H, List):-appen(H, [Root], H1), helper1(R, H1, List).

%Написати програму, яка б визначала кількість вершин-листків в бінарному дереві.
%leaf_count(tree(tree(tree(nil,1,nil),2,tree(nil,3,nil)),4,tree(tree(tree(nil,5,nil),6,tree(nil,7,nil)),8,nil)), R).
%R = 4

leaf_count(Tree, Res):-helper2(Tree, 0, Res),!.
helper2(tree(nil, _, nil), H, H1):-H1 is H+1, !.
helper2(tree(L, _, R), H, Res):-helper2(L, H, H1), helper2(R, H1, Res).
helper2(tree(L, _, nil), H, Res):-helper2(L, H, Res).
helper2(tree(nil, _, R), H, Res):-helper2(R, H, Res).

%Написати програму, яка знаходила б висоту бінарного дерева.
% Висота бінарного дерева Т визначається так:
%висота порожнього дерева Т рівна H(T)=0;
%висота непорожнього бінарного дерева Т з коренем к і піддеревами Т1 і Т2 дорівнює H(T)=1+max(H(T1), H(T2)).
%| ?- tree_hight(tree(tree(tree(nil,1,nil),2,tree(nil,3,nil)),4,tree(tree(tree(nil,5,nil),6,tree(nil,7,nil)),8,nil)), R).
%R = 4

tree_hight(Tree, Res):-helper3(Tree, [],  0, R), max(R, Res),!.
helper3(tree(nil, _, nil), Arr, H, Res):- H1 is H+1, appen(Arr, [H1], Res), !.
helper3(tree(L, _, R), Arr, H, Res):-H1 is H+1, helper3(L, Arr, H1, Arr1), helper3(R, Arr1, H1, Res).
helper3(tree(L, _, nil), Arr, H, Res):-H1 is H+1, helper3(L, Arr, H1, Res).
helper3(tree(nil, _, R), Arr, H, Res):-H1 is H+1, helper3(R, Arr, H1, Res).

max([H|Tail], Res):-maxh(Tail, H, Res),!.
maxh([], H, H):-!.
maxh([H|Tail], L, Res):-H>L, maxh(Tail, H, Res).
maxh([H|Tail], L, Res):-H=<L, maxh(Tail, L, Res).

%Написати програму, яка визначає кількість вузлів у бінарному дереві
%| ?- node_count(tree(tree(tree(nil,1,nil),2,tree(nil,3,nil)),4,tree(tree(tree(nil,5,nil),6,tree(nil,7,nil)),8,nil)), R).
%R = 4

node_count(Tree, Res):-helper4(Tree, 0, Res),!.
helper4(tree(nil, _, nil), H, H1):-H1 is H+1, !.
helper4(tree(L, _, R), H, Res):-H1 is H+1, helper4(L, H1, H2), helper4(R, H2, Res).
helper4(tree(L, _, nil), H, Res):-H1 is H+1, helper4(L, H1, Res).
helper4(tree(nil, _, R), H, Res):-H1 is H+1, helper4(R, H1, Res).

%Написати програму обходу 2-3-дерева(1).
%walk_23tree((v2(v2(l(5),7,l(7)),8,v2(l(8),13,l(13)))), R).
%
%R = [5,7,8,13]

walk_23tree(Tree, List):-helper5(Tree, [], List),!.
helper5(nil, L, L):-!.
helper5(l(X), L, R):-appen(L, [X], R).
helper5(v2(X, _, Y), L, R1):-helper5(X, L, R), helper5(Y, R, R1).
helper5(v3(X, _, Y, _, Z), L, R2):-helper5(X, L, R), helper5(Y, R, R1), helper5(Z, R1, R2).

%Написати програму пошуку заданого елемента в 2-3-дереві(1)
%find_23tree((v2(v2(l(5),7,l(7)),8,v2(l(8),13,l(13)))), 13,  R).
%R = true
%find_23tree((v2(v2(l(5),7,l(7)),8,v2(l(8),13,l(13)))), 11,  R).
%R = false

find_23tree(Tree, El, Res):-walk_23tree(Tree, List), helper6(List, El, Res),!.
helper6([], _, Res):-Res=false,!.
helper6([H|Tail], El, Res):-H=El, Res=true, !.
helper6([H|Tail], El, Res):-helper6(Tail, El, Res).

%Написати програму, яка перевірить чи є заданий об'єкт(1)
%   бінарним деревом
%   ?- task7binary(tree(tree(tree(nil,1,nil),2,tree(nil,3,nil)),4,tree(tree(tree(nil,5,nil),6,tree(nil,7,nil)),8,nil))).
%   yes

task7binary(nil).
task7binary(tree(X, _, Y)):-task7binary(X), task7binary(Y).

%   2-3 деревом
%   task723tree(v2(v2(l(5),7,l(7)),8,v2(l(8),13,l(13)))).
%   yes

task723tree(l(_)).
task723tree(v2(X, _, Y)):-task723tree(X), task723tree(Y).
task723tree(v3(X, _, Y, _, Z)):-task723tree(X), task723tree(Y), task723tree(Z).




appen([],L,L).
appen([X|L1],L2,[X|L]):-appen(L1,L2,L).

in_tree(X, tree(_,X,_)).
in_tree(X,tree(L,_,_)):-in_tree(X,L).
in_tree(X,tree(_,_,R)):-in_tree(X,R).
 
add(nil, X, tree(nil,X,nil)):-!.
add(tree(L,A,R),X,tree(L1,A,R)):-X<A, add(L,X,L1),!.
add(tree(L,A,R),X,tree(L,A,R1)):-X>A, add(R,X,R1).
 
make_tree(List,Tree):-make_tree(List,nil,Tree).
make_tree([],Tree,Tree):-!.
make_tree([H|T],Tree,TreeRes):-add(Tree,H,Tree1), make_tree(T,Tree1,TreeRes).
 
in_tree1(X, tree(_,X,_)):-!.
in_tree1(X,tree(L,Root,_)):-X<Root, in_tree(X,L),!.
in_tree1(X,tree(_,Root,R)):-X>Root,in_tree(X,R).
 
add23( Tree, X, Tree1) :-
    insert( Tree, X, Tree1).
add23( Tree, X, v2( T1, M2, T2) ) :-
    insert( Tree, X, T1, M2, T2).
add23( nil,X,l(X)).
 
:-discontiguous(insert/3).
:-discontiguous(insert/5).
 
insert( l(A), X, l(A), X, l(X) ) :-
    X>A.
insert( l(A), X, l(X), A, l(A) ) :-
    A>X.
insert( v2( T1, M, T2), X, v2( NT1, M, T2) ) :-
    M>X,
    insert( T1, X, NT1).
insert( v2(T1, M, T2), X, v3( NT1a, Mb, NT1b, M, T2)):-
    M>X,
    insert( T1, X, NT1a, Mb, NT1b).
insert( v2( T1, M, T2), X, v2( T1, M, NT2) ) :-
    X>M,
    insert( T2, X, NT2).
insert( v2( T1, M, T2), X, v3( T1, M, NT2a, Mb, NT2b) ) :-
    X>M,
    insert( T2, X, NT2a, Mb, NT2b).
insert(v3( T1, M2, T2, M3, T3), X, v3( NT1, M2, T2, M3, T3) ):-
    M2>X,
    insert( T1, X, NT1).
insert( v3( T1, M2, T2, M3, T3), X,
        v2( NT1a, Mb, NT1b), M2, v2( T2, M3, T3) ) :-
    M2>X,
    insert( T1, X, NT1a, Mb, NT1b).
insert( v3( T1, M2, T2, M3, T3), X,
 v3( T1, M2, NT2, M3, T3) ) :-
    X>M2, M3>X,
    insert( T2, X, NT2).
insert( v3( T1,M2,T2, M3, T3), X,
 v2( T1, M2, NT2a), Mb, v2( NT2b, M3, T3) ) :-
    X>M2, M3>X,
    insert( T2, X, NT2a, Mb, NT2b).
insert( v3( T1, M2, T2, M3,T3), X,
 v3( T1, M2, T2, M3, NT3) ) :-
    X>M3,
    insert( T3, X, NT3).
insert( v3( T1, M2, T2, M3, T3), X,
 v2( T1, M2, T2), M3, v2( NT3a, Mb, NT3b) ) :-
    X>M3,
    insert( T3, X, NT3a, Mb, NT3b).
 
 
 
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