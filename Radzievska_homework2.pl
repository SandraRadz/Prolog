%+1
s(X,Y):-Y is X+1.

%-1
dec1(X,0):-X=<0,!.
dec1(X,Y):-dd(X,0,1,Y).
dd(X,R,M,R):-X=M,!.
dd(X,L,M,R):-s(L,L1), s(M,M1), dd(X,L1,M1,R).

summ(X,0,X):-!.
summ(X,Y,R):-s(X,X1),dec1(Y,Y1),summ(X1,Y1,R).

minus(X,Y,0):-X=<Y,!.
minus(X,Y,R):-mm(X,Y,0,R).
mm(X,Y,Y,X):-!.
mm(X,Y,L,R):-dec1(X,X1), s(L,L1), mm(X1,Y,L1,R).


mult(_,0,0):-!.
mult(0,_,0):-!.
mult(X,Y,Z):-ml(X,X,Y,Z).
ml(_,Y,Z,Y):-s(0,Z1),Z1=Z,!.
ml(X,Y,Z,V):-dec1(Z,Z1),summ(X,Y,Y1),ml(X,Y1,Z1,V).

%Task1
divmod(_,0,0,0):-!.
divmod(X,Y,0,X):-X<Y,!.
divmod(X,Y,D,M):-dm(X,Y,0,D,M).
dm(X,Y,Q,Q,X):-X<Y,!.
dm(X,Y,Q,D,M):-minus(X,Y,X1),s(Q,Q1), dm(X1,Y,Q1,D,M).

%Task2 (1)
step(_,0,1):-!.
step(1,_,1):-!.
step(0,_,0):-!.
step(X,1,X):-!.
step(X,Y,R):-sl(X,X,Y,R).
sl(_,XR,1,XR):-!.
sl(X,XR,Y,R):-mult(XR,X,XR1),dec1(Y,Y1),sl(X,XR1,Y1,R).

steplog(_,0,R):- R=1,!.
steplog(X,Y,R):- Y mod 2 =:= 1, X1 is X*X,Y1 is Y>>1,steplog(X1,Y1,R1),R is X*R1,!.
steplog(X,Y,R):- X1 = X*X,Y1 is Y>>1,steplog(X1,Y1,R1),R is R1,!.

%Fibonacci (recursive)
fib1(0,0):-!.
fib1(1,1):-!.
fib1(N,R):-N1 is N-1, N2 is N-2, fib1(N1,R1), fib1(N2,R2),R is R1+R2.  

%Fibonacci (iterative)
fib2(0,0):-!.
fib2(1,1):-!.
fib2(N,R):-fib2help(N,0,0,1,R).
fib2help(N,L,N1,_,N1):-N=L,!.
fib2help(N,L,N1,N2,R):-L1 is L+1, N4 is N2+N1, fib2help(N,L1,N4,N1,R).  

%Task4
prosti(X,L):-helper4(X,2,L).
helper4(X,X,[X]):-!.
helper4(X,S,[S|T]):-0 is X mod S, N1 is X//S, helper4(N1,S,T),!.
helper4(X,S,T):-S1 is S+1, helper4(X,S1,T),!.


%Task5
factorial(0,1):-!.
factorial(1,1):-!.
factorial(N,R):-fact(N,1,1,R).
fact(N,N,Q,R):-R=Q,!.
fact(N,L,Q,R):-L1 is L+1, Q1 is Q*L1, fact(N,L1,Q1,R).

task5(1,1):-!.
task5(N,R):-t5(N,1,1,R).
t5(N,N,Q,R):-R=Q,!.
t5(N,L,Q,R):-L1 is L+1, factorial(L1,F), Q1 is Q+(1/F), t5(N,L1,Q1,R).

task1(_,0,_,_):-!.
task1(A,B,0,B):-A<B, !.
task1(A,B,Y,Z):-task(A,B,Y,Z,0).
task(A,B,T,Z,T):-A<B, A=Z,!.
task(A,B,Y,Z,T):-A1 is A-B, T1 is T+1, task1(A1,B,Y,Z,T1).


