PROGRAM Harmonisch;

VAR  n: LONGINT;
     h: SINGLE;
	 i: LONGINT;

BEGIN
  Write('n eingeben: '); Readln(n);
  {Harmonische Reihe vorwaerts berechnen:}
  h := 0;
  FOR i := 1 TO n Do
    h := h + 1/i;
  Writeln('Resultat Vorwaerts: ', h:0:20);
  {Harmonische Reihe ruckwaerts berechnen:}
  h := 0;
  FOR i := n DOWNTO 1 DO
    h := h +1/i;

  Writeln('Resultat Rueckwaerts: ', h:0:20);
END.