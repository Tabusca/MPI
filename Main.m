close all
clear all
clc
% Parametrii sistemului
M = 0.5;   % Masa caruciorului [kg]
m = 0.2;   % Masa pendulului [kg]
L = 0.3;   % Lungimea pendulului [m]
g = 9.81;  % Acceleratia gravitationala [m/s^2]

% Definirea functiei de transfer pentru unghiul pendulului (Theta) fata de forta aplicata (F)
num = [m*L 0];  % Numărătorul funcției de transfer
den = [(M + m) 0 -m*g];  % Numitorul funcției de transfer

% Crearea functiei de transfer in MATLAB
pendulum_tf = tf(num, den);

% Afisarea functiei de transfer
disp('Functia de transfer a sistemului pendul inversat este:')
pendulum_tf

% Simularea raspunsului sistemului la o intrare impuls
figure;
impulse(pendulum_tf);
title('Raspunsul impulsului pentru pendulul inversat fara control');
grid on;

% Proiectarea unui regulator PID
Kp = 300;   % Constanta proportionala
Ki = 45;     % Constanta integrala
Kd = 3;    % Constanta derivativa

% Crearea regulatorului PID
pid_controller = pid(Kp, Ki, Kd);

% Sistemul in bucla inchisa (pendul + control PID)
closed_loop_system = feedback(pendulum_tf * pid_controller, 1)

% Simularea raspunsului impuls al sistemului controlat
figure;
impulse(closed_loop_system);
title('Raspunsul impulsului pentru pendulul inversat cu control PID');
grid on;

% Simularea raspunsului treapta pentru sistemul controlat
figure;
step(closed_loop_system);
title('Raspunsul treapta pentru pendulul inversat cu control PID');
grid on;

% Caracteristici de performanta ale sistemului
performance_info = stepinfo(closed_loop_system);

% Afisarea performantelor
disp('Performantele sistemului controlat sunt:');
disp(performance_info);

% Diagrama Bode
figure;
bode(closed_loop_system);
title('Diagrama Bode pentru sistemul cu control PID');
grid on;

% Diagrama Root Locus
figure;
rlocus(closed_loop_system);
title('Diagrama Root Locus pentru sistemul cu control PID');
grid on;


