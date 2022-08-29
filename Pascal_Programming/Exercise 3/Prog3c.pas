PROGRAM Prog3c;

VAR
n, i, g : INTEGER;

BEGIN
  Write ('Zahl: ');
  Readln(n);
  g := 0;
  i := 1;
  
  REPEAT
  
    IF i mod 2 = 0 THEN g := g + i;
    Inc(i)
   
  UNTIL i > n;
  
  Writeln(g, ' ist die letzte Zahl');
END.