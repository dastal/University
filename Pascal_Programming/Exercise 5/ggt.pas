Program Ggt;

{$OverflowChecks ON}
{$RangeChecks ON}
TYPE INTEGER = LONGINT;

FUNCTION Ggt(x, y : INTEGER) : INTEGER;
                                                                //PRE: x > 0 und y > 0.
                                                                //POST: gibt den ggT von x und y zurueck.

VAR g : INTEGER;

BEGIN                                                           // g := min(x, y)
  IF (x < y) THEN g := x
  ELSE g := y;

  WHILE (x mod g <> 0) OR (y mod g <> 0) DO                     // suche groesstes g, welches beide teilt
    Dec(g);
    Ggt := g;
END;

FUNCTION Kgv(x, y : INTEGER) : INTEGER;
                                                                //PRE: x > 0 und y > 0.
                                                                //POST: gibt das kgV von x und y zurueck.
BEGIN
   Kgv := x div Ggt(x, y) * y;
END;


VAR
  x, y: INTEGER;
  str: STRING;

BEGIN
  REPEAT
    Write('x: ');
    Readln(x);
    Write('y: ');
    Readln(y);

    IF (x > 0) and (y > 0) THEN
    BEGIN
      Writeln('Der ggT ist: ', Ggt(x, y));
      //Writeln('Das kgV ist: ', Kgv(x, y));
    END
    ELSE
      Writeln('Ungueltige Eingabe!');

    Write('Nochmals? (j/n): ');
    Readln(str);
  UNTIL str = 'n'; // Wiederhole, falls gewuenscht
END.