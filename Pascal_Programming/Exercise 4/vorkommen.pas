PROGRAM Vorkommen;

{$OverflowChecks ON}
{$RangeChecks ON}
TYPE INTEGER = LONGINT;

FUNCTION Vorkommen(arr : ARRAY OF INTEGER; z : INTEGER) : INTEGER;
//PRE: keine
//POST: gibt Anzahl Vorkommen von z in arr zurueck
BEGIN
  // Dein Code kommt hier...
END;

FUNCTION Haeufigstes(arr : ARRAY OF INTEGER) : INTEGER;
//PRE: Length(arr) > 0
//POST: gibt haeufigstes Element von arr zurueck.
BEGIN
  // Dein Code kommt hier...
END;

VAR
  n, i : INTEGER;
  werte: ARRAY OF INTEGER;
  z, v, h: INTEGER;
BEGIN
  {Initialisierung}
  Write('Anzahl Elemente: ');
  Readln(n);
  SetLength(werte, n);
  FOR i := Low(werte) TO High(werte) DO
  BEGIN
    Write(i, ': ');
    Readln(werte[i]);
  END;

  {Vorkommen}
  Write('Vorkommen von: ');
  Readln(z);
  v := Vorkommen(werte, z);
  Writeln(z, ' kommt ', v, ' mal vor');

  { Haeufigstes Element }
  h := Haeufigstes(werte);
  Writeln(h, ' kommt am hauefigsten vor');
END.