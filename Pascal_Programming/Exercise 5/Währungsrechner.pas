PROGRAM Waehrungsrechner;

{$Overflowchecks ON}
{$Rangechecks ON}
Type Integer = Longint;

VAR Betr, Res: REAL;
    Opt: INTEGER;
	Str: STRING;
	

CONST
  Kurs = 1.09;

BEGIN
{Anzeigen der Optionen}
Write ('Option 1: EUR -> CHF; Option 2: CHF -> EUR');
  
  REPEAT
  Write ('Welche Option?: ');
  Readln (Opt);

  
  IF opt = 1 THEN
    BEGIN
	  Write ('Betrag in EUR: ');
      Readln (Betr);
	  Res := Betr * Kurs;
	  Writeln (Betr:0:2, ' EUR sind ', Res:0:2, ' CHF.');
	END
  
  ELSE IF opt = 2 THEN
    BEGIN
	  Write ('Betrag in CHF: ');
	  Readln (Betr);
	  Res := Betr / Kurs;
	  Writeln (Betr:0:2, ' CHF sind ', Res:0:2, ' CHF.');
	END
  
  ELSE
    Writeln ('ungueltige Option');
	Writeln ('Nochmals? (j/n): ');
	Readln (str);
 
  UNTIL str = 'n';
END.
	
  