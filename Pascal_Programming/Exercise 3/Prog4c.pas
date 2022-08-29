PROGRAM Prog4;


VAR
  n, p, i: INTEGER;

BEGIN
  Readln(n);
  
  p := 1;
  i := 0;

  WHILE p < n  DO
   
    REPEAT
     Inc(i);
     p := p * i UNTIL p >= n;

  Writeln(i);
END.