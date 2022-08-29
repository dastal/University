PROGRAM GA;

CONST
  preis_kdr = 1615;                     // Preis Kinder
  preis_jnr = 2600;                     // Preis Junior
  preis_std = 2600;                     // Preis Student
  preis_sen = 2760;                     // Preis Senior
  preis_erw = 3655;                     // Preis Erwachene
  
VAR
  alter           : INTEGER;
  frau, student   : BOOLEAN;
  str             : STRING;

BEGIN
  Write ('Alter: ');
  Readln (alter);
  
  Write ('Geschlecht (m/w): ');
  Readln (str);
  frau := str = 'w';
  
  Write ('Student (j/n): ');
  Readln (str);
  student := str = 'j';
  
  IF alter <= 15                                                                              // Preis für unter 16 Jährige sollte angezeigt werden
    THEN Writeln ('Preis fuer Personen unter 16 Jahre : ', preis_kdr) 
    
  ELSE IF ( alter >= 16 ) and (alter <= 24)                                                   // Preis für Junioren zwischen 16 und 25 Jahren sollte angezeigt werden
    THEN Writeln ('Preis fuer Junioren zwischen 16 und 25 Jahren : ', preis_jnr) 
  
  ELSE IF ( student = true ) and (alter >= 25) and (alter <=30)
    THEN Writeln ('Preis fuer Studenten zwischen 25 und 30 Jahren : ', preis_std)             // Preis für Studenten zwischen 25 und 30 Jahren sollte angezeigt werden
  
  ELSE IF ( frau = true ) and (alter >= 64)                                                   // Preis für Seniorinnen (Unterschied zwischen Frau und Mann) sollte angezeigt werden
    THEN Writeln ('Preis fuer Seniorinnen ueber 64 Jahre : ', preis_sen)
  ELSE IF not ( frau = true ) and (alter >= 65)
    THEN Writeln ('Preis fuer Senioren ueber 65 Jahre : ', preis_sen)                         // Preis für Senioren über sollte angezeigt werden
  
  ELSE IF (alter >= 16)
    THEN Writeln ('Preis fue Erwachsene ueber 16 Jahren ohne Ermaessigungen : ', preis_erw)   // Preis für alle anderen sollte angezeigt werden
  
END.
  