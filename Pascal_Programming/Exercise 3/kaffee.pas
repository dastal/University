PROGRAM Kaffee;

VAR
  tK, tU, k, r: REAL;                                                                           // Temperaturen, Abkuehlfaktor und Resultat
  m, i: INTEGER;                                                                                // Anz. Minuten stehen gelassen und Erhöhungsschritt (Immer +1)

BEGIN
  Write('Umgebungstemperatur: ');                                                               // Lies Anfangswerte ein          
  Readln(tU);
  Write('Anfangstemperatur des Kaffees: ');
  Readln(tK);
  Write('Abkuehlungsfaktor (zw 0 und 1): ');
  Readln(k);
  Write('Anzahl Minuten stehen gelassen: ');
  Readln(m);
  
  i := 0;                                                                                       // Schritt pro Minute
  
  WHILE i < m DO                                                                                
    BEGIN 
     REPEAT
	  r := tK - k * (tK - tU);                                                                  // Gleichung für Endtemperatur
	  Inc(i);                                                                                   // solange i < m Steigere um 1
	  tK := r;                                                                                  // r ist neuer Wert für tK
     UNTIL i = m;                                                                               // stoppe, sobald i = m
	END;
	
  Writeln ('Der Kaffee ist nach ' , i ,' Minuten noch ' , r:5:1 ,' Grad Celsius warm');         // Ausgabe der Endtemperatur
END.