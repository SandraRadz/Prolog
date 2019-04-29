lector(1, franchyck, docent, naukma).
lector(2, shevchenko, docent, kpi).
lector(3, kreyman, doctor, knu).
subject(111, oop, 36).
subject(112, mp, 40).
subject(113, db, 34).
group(17, computer_science).
group(18, math).
group(19, computer_science).
scheduler(1, 111, 17, 3, 301).
scheduler(1, 113, 18, 3, 331).
scheduler(2, 112, 18, 2, 201).
scheduler(1, 113, 17, 3, 331).
lectorsub(Lec, Sub):-lector(A, Lec, _, _), scheduler(A, B, _, _, _ ), subject(B, Sub, _).
lectordep(Lec, Dep):-lector(A, Lec, _, _), scheduler(A, _, B, _, _ ), group(B, Dep).
lectorcl(Lec, Class):-lector(A, Lec, _, _), scheduler(A, _, _, Class, _ ).