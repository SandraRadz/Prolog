minus(X,Y,0):-X=<Y,!.
minus(X,Y,Z):-mn(X,Y,0,Z).
mn(X,Y,Z,Z):-summa(Y,Z,X1),X1=X,!.

div(0,X,0,0):-!.
div(X,0,_,_):-write("can't div on 0")!.
div(X,1,X,0):-!.
div(1, X, 0, X):-!.
div(X, Y, Q, R):-dv(X,Y,O, Q, R).
dv(X, Y, C, C, X):- X<Y, !.
dv(X, Y, C, Q, R):-minus(X,Y,X1), S(C, C1), dv(X1,Y, C1, Q, R).
