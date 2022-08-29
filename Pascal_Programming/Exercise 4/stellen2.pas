PROGRAM Stellen2;
TYPE INTEGER = LONGINT;

VAR
  n, i: INTEGER;

BEGIN
  Write('Zahl (n >= 0): ');
  Readln(n);
  i := 1;
  WHILE  n >= 10 DO
  BEGIN
   n := n div 10;
   Inc(i);
  END; 

  Writeln('Anzahl Stellen: ', i);
END.