PROGRAM Statistik;

{$OverflowChecks ON}
{$RangeChecks ON}
TYPE INTEGER = LONGINT;

FUNCTION Maximum(arr : ARRAY OF INTEGER) : INTEGER;
//PRE: Length(arr) > 0
//POST: gibt das Maximum zurueck

VAR m, a : INTEGER;

BEGIN
  m := Low(m); 
  FOR a IN arr DO IF a > m THEN m := a;
  Maximum := m;
END;

FUNCTION Minimum(arr : ARRAY OF INTEGER) : INTEGER;
//PRE: Length(arr) > 0
//POST: gibt das Minimum zurueck

VAR m, a : INTEGER;

BEGIN
  m := High(m);
  FOR a IN arr DO IF a < m THEN m := a;
  Minimum := m;
END;

FUNCTION Average(arr : ARRAY OF INTEGER) : REAL;
//PRE: Length(arr) > 0
//POST: gibt den Durchschnitt zurueck

VAR a, sum: INTEGER;
  
BEGIN
  sum := 0;
  FOR a IN arr DO sum := sum + a;
  Average := sum / Length(arr);
END;

FUNCTION Median(arr : ARRAY OF INTEGER) : INTEGER;
//PRE: Length(arr) > 0
//POST: gibt den Median zurueck

VAR z, m, g, k: INTEGER;

BEGIN
  FOR m IN arr DO
  BEGIN
  g := 0;
  k := 0;
  
  FOR z IN arr DO
  BEGIN
    IF z >= m THEN Inc(g);
	IF z <= m THEN Inc(k);
  END;
  
  IF (2*g >= Length(arr)) and (2*k >= Length(arr)) THEN
    BEGIN
	  Median := m;
	  Break;
	END;
  END;
END;


VAR
  n, i : INTEGER;
  werte: ARRAY OF INTEGER;

BEGIN
  {Initialisierung}
  Write('Anzahl Messwerte: ');
  Readln(n);
  SetLength(werte, n);
  FOR i := Low(werte) TO High(werte) DO
  BEGIN
    Write('Messwert ', i, ': ');
    Readln(werte[i]);
  END;

  {Berechnungen}
  Writeln('Das Maximum ist: ', Maximum(werte));
  Writeln('Das Minimum ist: ', Minimum(werte));
  Writeln('Der Durchschnitt ist: ', Average(werte):0:2);
  Writeln('Der Median ist: ', Median(werte));
END.