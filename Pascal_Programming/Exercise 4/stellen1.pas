PROGRAM Stellen1;
TYPE INTEGER = LONGINT;

VAR
  n, i, p: INTEGER;

BEGIN
  Write('Zahl (n >= 0): ');
  Readln(n);
  i := 1;
  p := 10;
  WHILE n >= p DO
  BEGIN
   p := p * 10;
   Inc(i);
  END;

  Writeln('Anzahl Stellen: ', i);
END.