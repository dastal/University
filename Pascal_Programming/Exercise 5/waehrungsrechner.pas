PROGRAM Waehrungsrechner;

{$Overflowchecks ON}
{$Rangechecks ON}
TYPE INTEGER = LONGINT;

VAR
wahl : INTEGER;
betrag, resultat : REAL;
str : STRING;

CONST kurs  = 1.09;
BEGIN
  Writeln('Waehrungsrechner (Option 1: EUR -> CHF; Option 2: CHF -> EUR)');
  REPEAT
   Writeln('Waehlen Sie die Option: ');
   Readln(Wahl);
   IF wahl = 1 THEN
    BEGIN
	 Write('Betrag in EUR eingeben: ');
	 Readln(betrag);
	 resultat := betrag * kurs;
	 Writeln(betrag:0:2, ' CHF sind ', resultat:0:2, ' EUR');
	END
   ELSE IF wahl = 2 THEN
    BEGIN
	 Write('Betrag in CHF eingeben: ');
	 Readln(betrag);
	 resultat := betrag / kurs;
	 Writeln(betrag:0:2, ' EUR sind ', resultat:0:2, ' CHF');
    END
   ELSE
     Writeln('Ungueltige Option');
   
   Write('Nochmals? (j/n): ');
   Readln(str);
  UNTIL str = 'n';
END.