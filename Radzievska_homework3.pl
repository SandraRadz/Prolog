fill(-1):-!.
fill(X):-asserta(d(X)),X1 is X-1,fill(X1).

task1(X):-d(A), d(B), d(C), 
          1 is mod(A,2), 1 is mod(B,2), 1 is mod(C,2),
		  X is A*100+B*10+C, Y is A*10+C,
		  0 is mod(X,Y).
		  
task2(X):-d(A), d(B), d(Q), d(W), A\=0, Q\=0,
          X is A*1000+A*100+B*10+B,
		  C is Q*10+W,
		  X is C*C.
		  
		  
task3(X):-helper3(0,0,X),!.
helper3(X,1999,X):-!.
helper3(I, S, X):-S1 is S + 1, 
                 \+ 0 is mod(S1, 6),
				 \+ 0 is mod(S1, 10),
				 \+ 0 is mod(S1, 15),
				 I1 is I + 1, helper3(I1,S1,X).
helper3(I,S,X):-S1 is S + 1, helper3(I,S1,X).


task4(R):-helper4(_,1,R),!.
helper4(N,I,I):-summ11(I, N), N1 is floor(sqrt(N)), N is N1 * N1.
helper4(N,I,R):-I1 is I + 1, helper4(N, I1, R).

summ11(X,Y):-Y is X*X+(X+1)*(X+1)+(X+2)*(X+2)+(X+3)*(X+3)+(X+4)*(X+4)+(X+5)*(X+5)+(X+6)*(X+6)+
             (X+7)*(X+7)+(X+8)*(X+8)+(X+9)*(X+9)+(X+10)*(X+10).
			 
task5(R):-helper5(8,7,3,7,7,R),!.
helper5(1,9,9,8,I,I):-!.
helper5(A,B,C,D,I,R):-A1 is B, B1 is C, C1 is D, K1 is A+B+C+D, D1 is mod(K1,10), I1 is I+1,
                      helper5(A1,B1,C1,D1,I1,R).

%this compiler can't calculate task6. Answer is 151200 (used online compiler). 				  
task6(R):-helper6(10000,0,R),!.
helper6(999999, R, R):-!.
helper6(I, L, R):- A is div(I, 100000), 
				   B is div(mod(I,100000), 10000), 
				   C is div(mod(mod(I,100000), 10000), 1000), 
				   D is div(mod(mod(mod(I,100000), 10000), 1000), 100), 
				   E is div(mod(mod(mod(mod(I,100000), 10000), 1000), 100), 10), 
				   F is mod(I, 10),
				   A\=B, A\=C, A\=D, A\=E, A\=F,
				   B\=C, B\=D, B\=E, B\=F,
				   C\=D, C\=E, C\=F,
				   D\=E, D\=F,
				   E\=F,
				   L1 is L+1,
				   I1 is I+1,
				   helper6(I1, L1, R).
helper6(I, L, R):- I1 is I+1, helper6(I1, L, R).			  
				   