PROGRAM Potenzen;

{$OverflowChecks ON}
{$RangeChecks ON}
TYPE INTEGER = LONGINT;


FUNCTION Potenz1 (x : REAL; n : INTEGER) : REAL;
// PRE: n >= 0 und nicht 0^0
// POST: berechnet x^n
VAR i : INTEGER;
    basis : REAL;
BEGIN
  IF n = 0 THEN
  basis := 1;
  IF n = 1 THEN
  basis := x;
  IF (n >= 2) and (n mod 2 = 0) THEN
    BEGIN
	  basis := 1;
      FOR i := 1 TO n DO
	  basis := basis * x;
    END
  ELSE IF (n >= 2) and (n mod 2 = 1) THEN
    BEGIN
	  basis := 1;
	  n := n - 1;
	  basis := x * x;
	  FOR i := 2 TO n DO
	  basis := basis * x;
	END;
Potenz1 := basis;
END;

FUNCTION Potenz2 (x : REAL; n : INTEGER) : REAL;
// PRE: n >= 0 und nicht 0^0
// POST: berechnet x^n
VAR basis : REAL;
BEGIN
  IF n = 0 THEN
  basis := 1;
  IF n = 1 THEN
  basis := x;
  IF (n >= 2) and (n mod 2 = 0) THEN
    BEGIN
      basis := x;
      WHILE n mod 2 = 0 DO
	    basis := basis * basis;
	    n := n div 2;
	  IF (n = 2) THEN basis := basis * basis;
    END;
  ELSE IF (n >= 2) and (n mod 2 = 1) THEN
    n := n - 1;
    BEGIN
	  WHILE n mod 2 = 0 DO
	    basis := basis * basis;
		n := n div 2;
	  IF (n = 2) THEN basis := basis * basis; 
	END;
   basis := basis * basis * x;
END;	

VAR
  x : REAL;
  n : INTEGER;
  str : STRING;
BEGIN
  REPEAT
    Write('x: ');
    Readln(x);
    Write('n: ');
    Readln(n);

    Writeln('Potenz1: x^n = ', Potenz1(x, n):8:2);
	Writeln('Potenz2: x^n = ', Potenz2(x, n):8:2);
    
    Write('Nochmals? (j/n): ');
    Readln(str);
  UNTIL str = 'n';
END.