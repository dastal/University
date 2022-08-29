PROGRAM Prog3;

VAR
  n, g, i: INTEGER;

BEGIN
  Readln(n);
  g := 0;
  i := 1;
  
   WHILE i <= n  DO
   
   BEGIN
     IF i mod 2 = 0  THEN g := g + i;
     Inc(i);
   END;

  Writeln(g);
END.