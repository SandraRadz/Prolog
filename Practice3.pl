fill(-1):-!.
fill(X):-asserta(d(X)),X1 is X-1,fill(X1).


task(Knyga, Nauka):-d(K), d(N), K\=N, 
                          d(Y), Y\=K, Y\=N,
						  d(G), G\=K, G\=N, G\=Y,
						  d(A), A\=K, A\=N, A\=Y, A\=G,
						  d(U), U\=K, U\=N, U\=Y, U\=G, U\=A,
						  Knyga is 10000*K+1000*N+100*Y+10*G+A,
						  Nauka is 10000*N+1000*A+100*U+10*K+A,
						  Nauka is Knyga*3.

%ABBACBAACC+ACCBBCABA=BCCACABAB

task2(Abbacbacc, Accbbcaba, Bccacabab):-d(A), d(B), A\=B, 
                          d(C), A\=C, B\=C,
						  Abbacbacc is 100000000*A+10000000*B+1000000*B+100000*A+10000*C+1000*B+100*A+10*C+C,
						  Accbbcaba is 100000000*A+10000000*C+1000000*C+100000*B+10000*B+1000*C+100*A+10*B+A,
						  Bccacabab is 100000000*B+10000000*C+1000000*C+100000*A+10000*C+1000*A+100*B+10*A+B,
						  Bccacabab is Abbacbacc+Accbbcaba.					  
						  