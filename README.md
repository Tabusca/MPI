# MPI
Modelarea Matematica a unui Pendul Inversat si simularea acestuia

!!NEFINALIZAT!!

Introducere: 
Pendulul inversat este compus dintr-o tijă rigidă montată pe un cărucior, iar provocarea constă în menținerea pendulului în poziția verticală, folosind tehnici de control PID. Proiectul a fost realizat în MATLAB, unde am implementat modelul sistemului, am proiectat un controler PID și am evaluat performanța și stabilitatea sistemului.

Modelarea și Simularea Sistemului: 
Modelul pendulului inversat a fost derivat din ecuațiile de mișcare, utilizând metodele Lagrange și Newton. Funcția de transfer a fost obținută prin linearizarea ecuațiilor în jurul punctului de echilibru instabil. Inițial, sistemul a fost analizat fără control, iar simularea răspunsului impuls a evidențiat instabilitatea sistemului. În continuare, a fost implementat un controler PID pentru a stabiliza pendulul, iar parametrii Kp, Ki și Kd au fost ajustați pentru a obține un răspuns optim.

Evaluarea Performanței: 
Pentru a evalua performanța sistemului controlat, am realizat simulări ale răspunsului la intrări de tip treaptă și impuls. Utilizând funcția stepinfo() din MATLAB, am obținut caracteristici precum timpul de răspuns, depășirea maximă și eroarea în regim staționar. Aceste date au fost esențiale pentru a analiza comportamentul sistemului și a determina eficiența controlerului PID.

Stabilitatea Sistemului: 
Stabilitatea sistemului a fost verificată utilizând criteriul Routh-Hurwitz, care asigură că toate rădăcinile polinomului caracteristic au parte reală negativă. Această analiză a confirmat stabilitatea sistemului cu control PID implementat. În plus, am generat diagrame Bode și Root Locus pentru a observa comportamentul sistemului în frecvență și amplificare. Aceste diagrame au furnizat informații suplimentare despre stabilitatea și performanța sistemului controlat.

Concluzie: 
Proiectul a demonstrat importanța aplicării tehnicilor de control automat în stabilizarea sistemelor cu puncte de echilibru instabile, cum ar fi pendulul inversat. Prin implementarea unui controler PID și evaluarea stabilității prin metodele Routh-Hurwitz, am reușit să obținem un sistem stabilizat și eficient. Rezultatele obținute sugerează că prin ajustarea atentă a parametrilor PID și analiza stabilității, este posibil să controlăm comportamentul sistemelor dinamice complexe.

