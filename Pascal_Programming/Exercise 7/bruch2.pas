PROGRAM Bruch2;

{$OverflowChecks ON}
{$RangeChecks ON}
TYPE INTEGER = LONGINT;

VAR TBRUCH : RECORD
              z : LONGINT;
              n : LONGINT;
             END;
			 
FUNCTION Ggt (a, b :TBRUCH) : TBRUCH;
VAR t : LONGINT;
BEGIN
  Abs(a);
  Abs(b);
  WHILE b <> 0 DO
    BEGIN 
	  a := a mod b;
	  t := a;
	  a := b;
	  b := t;
	 END;
END;

FUNCTION Kgv (a, b :TBRUCH) : TBRUCH;
VAR
BEGIN
  Abs(a);
  Abs(b);
  Kgv := a div Ggt(a, b) * b;
END;
	  	 
PROCEDURE Kuerzen (VAR a : TBRUCH)
VAR g : LONGINT;
BEGIN
  g := Ggt(a.z,a.n);
  a.z := a.z div g;
  a.n := a.n div g;
END;

FUNCTION Add (VAR a, b : TBRUCH) : TBRUCH
VAR k : LONGINT;
BEGIN
  k := Kgv(a.n, b.n);
  Add.z := a.z * (k div a.n) + b.z * (k div b.n);
  Add.n := k;
END;

FUNCTION Mult (VAR a, b : TBRUCH) :TBRUCH
BEGIN
  Mult.z := a.z * b.z;
  Mult.n := a.n * b.n;
END;

BEGIN
  // Brueche einlesen
  ReadTBruch('Erster Bruch:', z1, n1);
  ReadTBruch('Zweiter Bruch:', z2, n2);

  // Addieren
  Add(z1, n1, z2, n2, z3, n3);
  WriteTBruch('Summe: ', z3, n3);

  Kuerzen(z3, n3);
  WriteBruch('Summe (gekuerzt): ', z3, n3);

  // Multiplizieren
  Mult(z1, n1, z2, n2, z3, n3);
  WriteTBruch('Produkt: ', z3, n3);

  Kuerzen(z3, n3);
  WriteTBruch('Produkt (gekuerzt): ', z3, n3);
END.