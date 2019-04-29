fill(-1):-!.
fill(X):-asserta(d(X)),X1 is X-1,fill(X1).

q(0).
q(1).
q(2).
q(3).
q(4).
q(5).
q(6).

task11(X) :- findall((Q, Z), helper11(Q, Z), Y),length(Y, X).
helper11(Q,W) :-
    q(A),
    q(B),
    q(C),
    q(D),
    q(E),
    q(F),
    Q is A + B + C,
    W is D + E + F,
    Q = W.

task12(X) :-findall((O, D, P), helper12(O, D, P), Q), length(Q, X).
helper12(O, D, P):-d(O), d(D), d(P), 100 is O+D*2+P*5.


task12(O, D, P):- 100 is O+D*2+P*5 .

task21(DVA, HUSLO):- d(D), 
					d(V), D\=V,
					d(A), V\=A, A\=D,
					d(H), H\=A, H\=V, H\=D,
					d(U), U\=A, U\=H, U\=V, U\=D,
					d(S), S\=U, S\=A, S\=H, S\=V, S\=D,
					d(L), L\=S, L\=U, L\=A, L\=H, L\=V, L\=D,
					d(O), O\=L, O\=S, O\=U, O\=A, O\=H, O\=V, O\=D,
					 DVA is D*100+V*10+A, 
					 HUSLO is H*10000+U*1000+S*100+L*10+O, 
					 HUSLO is DVA*DVA.
					 
task22(FORTY, TEN, SIXTY):-d(F),
							d(O), O\=F,
							d(R), R\=O, R\=F,
							d(T), T\=R, T\=O, T\=F,
							d(Y), Y\=T, Y\=R, Y\=O, Y\=F,
							d(E), E\=Y, E\=T, E\=R, E\=O, E\=F,
							d(N), N\=E, N\=Y, N\=T, N\=R, N\=O, N\=F,
							d(S), S\=N, S\=E, S\=Y, S\=T, S\=R, S\=O, S\=F,
							d(I), I\=S, I\=N, I\=E, I\=Y, I\=T, I\=R, I\=O, I\=F,
							d(X), X\=I, X\=S, X\=N, X\=E, X\=Y, X\=T, X\=R, X\=O, X\=F,
					 FORTY is F*10000+O*1000+R*100+T*10+Y,
					 TEN is T*100+E*10+N,
					 SIXTY is S*10000+I*1000+X*100+T*10+Y,
					 SIXTY is FORTY+TEN+TEN.
					 
task23(BYKVA, SLOVO):-d(B),
					d(Y), B\=Y,
					d(K), K\=Y, K\=B,
					d(V), V\=K, V\=Y, V\=B,
					d(A), A\=V, A\=K, A\=Y, V\=B,
					d(S), S\=A,  S\=V, S\=K, S\=Y, S\=B,
					d(L), L\=S,  L\=A,  L\=V, L\=K, L\=Y, L\=B,
					d(O), O\=L, O\=S,  O\=A,  O\=V, O\=K, O\=Y, O\=B,
					BYKVA is B*10000+Y*1000+K*100+V*10+A,
					SLOVO is S*10000+L*1000+O*100+V*10+O,
					BYKVA is SLOVO*6.
					
dilennya(X, Y, D, M):-D is div(X, Y), M is mod(X, Y), X is D*Y+M.

steplog(_,0,R):- R=1,!.
steplog(X,Y,R):- Y mod 2 =:= 1, X1 is X*X,Y1 is Y>>1,steplog(X1,Y1,R1),R is X*R1,!.
steplog(X,Y,R):- X1 = X*X,Y1 is Y>>1,steplog(X1,Y1,R1),R is R1,!.

female(agnes).
female(idit).
female(margo).
female(lussi).
female(sally).
female(holly).
female(gulia).
female(dori).
female(dayni).
female(matulda).
female(hortenzia).
female(depla).

married(mcqueen, sally).
		married(gry, lussi).
		married(mater, holly).
		married(ramone, flo).
		married(mayk, selia).
		
		parents(margo, gry).
		parents(idit,gry).
		parents(agnes,lussi).
		parents(gry,gulia).
		parents(dru, gulia).
		parents(gulia, ghost).
		parents(nafario, ghost).
		parents(lussi, baltazar).
		parents(rom, baltazar).
		parents(kevin,rom ).
		parents(idit,rom ).
		parents(sally, ramon ).
		parents(ramon, doluvay).
		parents(luidgy, doluvay).
		parents(gvido,luidgy).
		parents(mcqueen, doc).
		parents(sally, flo).
		parents(carera, flo).
		parents(holly,carera).
		parents(dori, sally).
		parents(mac, sally).
		parents(donald, dak).
		parents(dayni, dak).
		parents(matulda, dayni).
		parents(donald, hortenzia).
		parents(depla,hortenzia).
		parents(huey, matulda).
		parents(dewey, matulda).
		parents(louie, matulda).
		parents(mayk, wazowski).
		parents(selia, vantuz).
		parents(wazowski, chak).
		parents(duck, chak).

male(X):- parents(X, _), \+ female(X);  \+ female(X), parents(_, X); married(X, _).

father(X) :- male(X), parents(_,X).

daughter(X):- female(X), parents(X, _).

sister(X) :- famale(X), parents(X, Y), parents(Z, Y), X\=Z.

granny(X) :- famale(X), parents(Y, X), parents(_, Y).

uncle(X) :- parents(X, Z), parents(Y,Z), male(X), parents(Q, Y).

brotherinLaw(X) :- married(X, Y), sister(Y).

motherinLaw(B, P):- married(M, P), parents(M, B), famale(B).

match(X, Y):- married(M, P), parents(M, X), parents(P, Y).

nephew(X):-parents(X, Y), parents(Y, Q), parents(_, Q).  

student(ann, group(1, group_name(knit, fi, naukma))).
teacher(franchyk, work(lector, comp, fi), lesson(oop, 1, 12)).


