PROGRAM Prog4;

VAR
  n, p, i: INTEGER;

BEGIN
  Readln(n);
  
  p := 1;
  i := 0;

  IF p < n  THEN
   
    REPEAT
     Inc(i);
     p := p * i UNTIL p >= n;

  Writeln(i);
END.