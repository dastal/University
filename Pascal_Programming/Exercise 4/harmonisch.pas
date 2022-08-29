PROGRAM Harmonisch;

{$OverflowChecks ON}
{$RangeChecks ON}

VAR  i, n: LONGINT;
	 h: SINGLE;
	 
TYPE INTEGER = LONGINT;

BEGIN
  Write('n eingeben: '); Readln(n);
  
  {Harmonische Reihe vorwaerts berechnen:}
    
  i := 1;
  h := 1E32;
	
  FOR i := 1 TO n DO
    
	h := h + 1/i;

  Writeln('Resultat Vorwaerts: ', h:0:20);

  {Harmonische Reihe ruckwaerts berechnen:}

  h := 0;

  FOR i := n DOWNTO 1 DO
  
    h := h + 1/i;
  
  Writeln('Resultat Rueckwaerts: ', h:0:20);

END.