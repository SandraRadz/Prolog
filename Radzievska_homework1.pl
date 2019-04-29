director(1, name(tony, bancroft), birth(juli, 31, 1967)).
director(2, name(barry, cook), birth(august, 12, 1958)).
director(3, name(ron, clements), birth(april, 25, 1953)).
director(4, name(john, musker), birth(november, 8, 1953)).
director(5, name(gary, trousdale), birth(june, 8, 1960)).
director(6, name(kirk, wise), birth(august, 24, 1963)).
cartoon(12, mulan, mulan, 1998, 88, 304320254).
cartoon(13, the_princess_and_the_frog, tiana, 2009, 97, 267045765).
cartoon(14, the_little_mermaid, mermaid, 1989, 83, 211343479).
cartoon(15, beauty_and_the_beast, belly, 1991, 84, 424000000).
filming(1, 12).
filming(2, 12).
filming(3, 13).
filming(4, 13).
filming(3, 14).
filming(4, 14).
filming(5, 15).
filming(6, 15).


% 1 print cartoon's name and their director's name, which was filmed from 1990 to 2000
get_dir_film_1990_2000(Fil, Dirfname, Dirlname):-cartoon(A, Fil, _, X, _, _), filming(B, A), director(B, name(Dirfname, Dirlname), _), X>=1990, X=<2000.

%2 print cartoons, which mark is more than 85, their box office and director
get_dir_higth_mark(Fil, Box, Dirfname, Dirlname):-cartoon(A, Fil, _, _, X, Box), filming(B, A), director(B, name(Dirfname, Dirlname), _),  X>=85.

%3 find younger directors, who filmed "Mulan", and his age in 2019
young_dir_of_mulan(Dirfname, Dirlname, Age):-filming(X, A), filming(Y, A), cartoon(A, mulan, _, _, _, _), director(X, name(Dirfname, Dirlname), birth(_,_,Q)), director(Y, _, birth(_,_,W)), X\=Y, Q>W, Age is 2019-Q.

%4 find names of directors, who worked together
get_dir_who_work_together(Dir1lname, Dir2lname):-filming(X, A), filming(Y, A), director(X, name(_, Dir1lname), _), director(Y, name(_, Dir2lname), _), X\=Y.

% 5 find directors, whose name is Ron or John 
get_ron_or_john(Dirfname, Dirlname):-director(_, name(Dirfname, Dirlname),_), Dirfname=john;director(_, name(Dirfname, Dirlname),_),Dirfname=ron.