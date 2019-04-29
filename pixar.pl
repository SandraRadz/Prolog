film(1, vidvashna, 2012, 78).
film(2, ratatuy, 2007, 96).
film(3, walle, 2008, 93).
cinema(44, multiplex, address111).
cinema(55, oscar, address222).
cinema(66, start, address333).
session(1, 44, 21.30, 150).
session(1, 55, 10.30, 110).
session(2, 66, 11.00, 100).
session(3, 44, 10.30, 95).
getinfovid(Cin, Time, Price):-film(A, vidvashna, _, _), session(A, B, Time,Price), cinema(B, Cin, _).
