Program Bruch;

{$OverflowChecks ON}
{$RangeChecks ON}
TYPE INTEGER = LONGINT;

FUNCTION Ggt(x, y : INTEGER) : INTEGER;

VAR g : INTEGER;

BEGIN                                                           // g := min(x, y)
  IF (x < y) THEN g := x
  ELSE g := y;

  WHILE (x mod g <> 0) OR (y mod g <> 0) DO                     // suche groesstes g, welches beide teilt
    Dec(g);
    Ggt := g;
END;

FUNCTION Kgv(x, y : INTEGER) : INTEGER;
BEGIN
   Kgv := x div Ggt(x, y) * y;
END;

PROCEDURE Add(z1, n1, z2, n2 : INTEGER; VAR z, n: INTEGER);
  
  VAR k : INTEGER;
  
  BEGIN

  k := Kgv (n1, n2);                                            // Nenner gleichnamig machen
                                                                
  z1 := z1 * (k div n1);                                        // z1 um Faktor k div n1 erweitern
  n1 := k;
  z2 := z2 * (k div n2);                                        // z2 um Faktor k div n2 erweitern
  n2 := k;
  
  z := z1 + z2;                                                 // Zähler addieren
  n := k;
  
  END;
  
PROCEDURE Mult(z1, n1, z2, n2: INTEGER; VAR zres, nres: INTEGER);
  BEGIN
  
  zres := z1 * z2;
  nres := n1 * n2;
  
  END;

PROCEDURE Kuerzen(VAR z, n: INTEGER);
  
  VAR g : INTEGER;
  
  BEGIN

  g := Ggt (z, n);
  z := z div g;
  n := n div g;
  
  END;


PROCEDURE WriteBruch(s: STRING; z, n : INTEGER);
//PRE: keine.
//POST: Gibt den Bruch auf der Konsole aus.
BEGIN
  Writeln(s, z, ' / ', n);
END;

PROCEDURE ReadBruch(s: STRING; VAR z, n: INTEGER);
//PRE: keine.
//POST: Liest einen Bruch ein (mit z >= 0, n > 0)
BEGIN
  Writeln(s);
  REPEAT
    Write('  Zaehler: ');
    Readln(z);
    Write('  Nenner: ');
    Readln(n);
  UNTIL (z >= 0) and (n > 0);
END; 

VAR
  z1, n1, z2, n2, z3, n3 : INTEGER;

BEGIN
  // Brueche einlesen
  ReadBruch('Erster Bruch:', z1, n1);
  ReadBruch('Zweiter Bruch:', z2, n2);

  // Addieren
  Add(z1, n1, z2, n2, z3, n3);
  WriteBruch('Summe: ', z3, n3);

  Kuerzen(z3, n3);
  WriteBruch('Summe (gekuerzt): ', z3, n3);

  // Multiplizieren
  Mult(z1, n1, z2, n2, z3, n3);
  WriteBruch('Produkt: ', z3, n3);

  Kuerzen(z3, n3);
  WriteBruch('Produkt (gekuerzt): ', z3, n3);
END.