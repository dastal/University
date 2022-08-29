PROGRAM Potenzen;

{$OverflowChecks On}
{$RangeChecks On}
TYPE INTEGER = LONGINT;

FUNCTION Potenz1 (x : REAL; n : INTEGER) : REAL;
// PRE: n >= 0 und nicht 0^0
// POST: berechnet x^n
VAR
i : INTEGER;
p : REAL;
BEGIN
 p := 1;
 FOR i := 1 TO n DO
  p := p * x;
 Potenz1 := p;
END;

FUNCTION Potenz2 (x : REAL; n : INTEGER) : REAL;
// PRE: n >= 0 und nicht 0^0
// POST: berechnet x^n
VAR
a : REAL;
BEGIN
a := 1;
WHILE n <> 0 DO
  IF n mod 2 = 0 THEN
  BEGIN
    n := n div 2;
	x := x * x;
  END
  ELSE
  BEGIN
  n := n - 1;
  a := a * x;
  END;
Potenz2 := a;
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