PROGRAM Velo1;
VAR
  v1, v2 : INTEGER;
  h1, h2, h3 : INTEGER;
  q11, q12, q13, q21, q22, q23 : REAL;

BEGIN
  {Eingabe}
  Write ('Kleinstes Zahnrad Vorne : ');
  Readln (v1);
  Write ('Groesstes Zahnrad Vorne : ');
  Readln (v2);
  Write ('Groesstes Zahnrad Hinten : ');
  Readln (h1);
  Write ('Mittleres Zahnrad Hinten : ');
  Readln (h2);
  Write ('Kleinstes Zahnrad Hinten : ');
  Readln (h3);
  {Berechnung}
  q11 := v1 / h1;
  q12 := v1 / h2;
  q13 := v1 / h3;
  q21 := v2 / h1;
  q22 := v2 / h2;
  q23 := v2 / h3;
  {Ausgabe}
  Writeln ('Gang 1-1 hat Verhaeltnis : ', q11:5:2);
  Writeln ('Gang 1-2 hat Verhaeltnis : ', q12:5:2);
  Writeln ('Gang 1-3 hat Verhaeltnis : ', q13:5:2);
  Writeln ('Gang 2-1 hat Verhaeltnis : ', q21:5:2);
  Writeln ('Gang 2-2 hat Verhaeltnis : ', q22:5:2);
  Writeln ('Gang 2-3 hat Verhaeltnis : ', q23:5:2);
END.