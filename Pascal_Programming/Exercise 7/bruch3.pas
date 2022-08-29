Program Bruch2;


{$OverflowChecks ON}
{$RangeChecks ON}
TYPE INTEGER = LONGINT;

TYPE TBruch : RECORD
               zaehler : INTEGER;
			   nenner  : INTEGER;
			 END;
			 

FUNCTION Ggt(a, b : INTEGER) : INTEGER;
//PRE:-
//POST: gibt den ggT von x und y zurueck.
VAR t : INTEGER;
BEGIN
  Abs(a) := a;
  Abs(b) := b;
  WHILE b <> 0 DO
  BEGIN
    a := a mod b;
	t := a; a := b; b := t;
  END;
  Ggt := a;
END;

FUNCTION Kgv(a, b : INTEGER) : INTEGER;
//PRE: x > 0 und y > 0.
//POST: gibt das kgV von x und y zurueck.
BEGIN
  IF (a = 0) or (b = 0) 
    THEN kgV := 0;
  ELSE
    kgV := Abs((a div Ggt(a,b)) * b);
END;

FUNCTION Add(a, b : TBruch) : TBruch;
//PRE: a.nenner und b.nenner <> 0
//POST: addiere a.zaehler und b.zaehler mit kgV im Nenner
VAR k : INTEGER;
BEGIN
  k := kgV(a.nenner, b.nenner);
  
  //Zähler mit kgV erweitern
  a.zaehler := a.zaehler * (k div a.nenner);
  a.nenner := k;
  b.zaehler := b.zaehler * (k div b.nenner);
  b.nenner := k;
  
  //addieren
  Add.zaehler := a.zaehler + b.zaehler;
  Add.nenner := k;
END;

FUNCTION Mult(a,b : TBruch) : TBruch;
//PRE: a.nenner und b.nenner <> 0.
//POST: multipliziere a.nenner mit b.nenner und a.zaehler mit b.zaehler
VAR
BEGIN
  // jeweils Zähler und Nenner miteinander miltiplizieren
  Mult.zaehler := a.zaehler * b.zaehler;
  Mult.nenner := a.nenner * b.nenner;
END;

PROCEDURE Kuerzen(a,b : TBruch)
