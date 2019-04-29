appen([],L,L).
appen([X|L1],L2,[X|L]):-appen(L1,L2,L).


%Напишіть предикат, який перетворює вихідний список у список позицій від'ємних елементів
%example 
%| ?- task1([-1, 5, -3, -3, 6, 2, 1], RES).
%RES = [0,2,3]

task1(ARR, RES):-helper1(ARR, [], 0, RES), !.
helper1(Q, W, _, W):-Q=[], !.
helper1(Q, W, L, R):-Q=[A|B], A<0, appen(W,[L], W1), L1 is L+1, helper1(B, W1, L1,R).
helper1(Q, W, L, R):-Q=[A|B],  L1 is L+1, helper1(B, W, L1, R).

%Напишіть предикат, що змінює всі входження заданого елемента на change_done
%example 
%| ?- task2([2, 5, 5, 7, 7, 5, 9, 55, 3,0], 5, R).
%R = [2,change_done,change_done,7,7,change_done,9,55,3,0]

task2(ARR, EL, RES):-helper2(ARR, EL, [], RES), !.
helper2([], _, H, H):-!.
helper2(Q, E, H, R):-Q=[A|B], A=E, appen(H, [change_done], H1), helper2(B, E, H1, R).
helper2(Q, E, H, R):-Q=[A|B], A\=E, appen(H, [A], H1), helper2(B, E, H1, R).

% Напишіть предикат, що перетворює будь-який список арабських чисел (від 1 до 50) у список відповідних їм римських чисел.
%example
%| ?- task3([53, 1, 9, 11, 69], R).
%R = [liii,i,ix,xi,lxix]


arabictorome(A, R):-help(A,'', R),!.
help(0, H, H).
help(A, H, R):-A>=50, A1 is (A-50), atom_concat(H, l, H1), help(A1, H1, R).
help(A, H, R):-A>=40, A1 is (A-40), atom_concat(H, xl, H1), help(A1, H1, R).
help(A, H, R):-A>=10, A1 is (A-10), atom_concat(H, x, H1), help(A1, H1, R).
help(A, H, R):-A>=9, A1 is (A-9), atom_concat(H, ix, H1), help(A1, H1, R).
help(A, H, R):-A>=5, A1 is (A-5), atom_concat(H, v, H1), help(A1, H1, R).
help(A, H, R):-A>=4, A1 is (A-4), atom_concat(H, iv, H1), help(A1, H1, R).
help(A, H, R):-A>=1, A1 is (A-1), atom_concat(H, i, H1), help(A1, H1, R).


task3(A, R):-helper3(A, [], R),!.
helper3([], H, H).
helper3(Q, H, R):-Q=[A|B], arabictorome(A, E), appen(H,[E],H1), helper3(B, H1, R).

%апишіть предикат, що здійснює циклічний зсув елементів списку на один вправо.
%example
%| ?- task4([34, 2, 12, 6, 8], R).
%R = [8,34,2,12,6]

task4(ARR, RES):-ARR=[A|B], helper44(B, [], A, RES),!.
helper44([], H, E, R):-appen([E], H, H1), R=H1,!.
helper44(Q, H, E, R):-Q=[A|B],  appen(H, [E], H1), E1=A, helper44(B, H1, E1, R).

%Напишіть предикат, що реалізує множення матриці (список списків) на вектор.
%example
%| ?- matronvec([[2,-3,0],[1,3,5],[-1,0,1]],[1,2,-1],R).
%R = [-4,2,-2]

veconvec(A, B, C):-vhelp(A, B, 0, C),!.
vhelp([],[],S,S):-!.
vhelp([],B, _, C):-B\=[], C=(different_size),!.
vhelp(A,[], _, C):-A\=[], C=(different_size),!.
vhelp(A, B, S, C):-A=[Q|W], B=[E|R], S1 is S+ (Q*E), vhelp(W, R, S1, C).

matronvec(A, B, C):-helper5(A, B, [], C),!.
helper5([], _, H, H):-!.
helper5(A, B, H, C):-A=[Q|W], veconvec(Q, B, S1), appen(H, [S1], H1), helper5(W, B, H1, C).

