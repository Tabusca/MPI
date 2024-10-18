% Parametrii pendulului
m = 0.2; % masa pendulului (kg)
L = 0.5; % lungimea pendulului (m)
g = 9.81; % accelerația gravitațională (m/s^2)

% Condiții inițiale
theta0 = pi/2; % unghiul inițial (radiani)
omega0 = 0;  % viteza unghiulară inițială (rad/s)

% Parametrii PID
Kp = 30;  % coeficientul proporțional
Ki = 50;   % coeficientul integrativ
Kd = 10;    % coeficientul derivativ

% Timpul de simulare
tspan = [0 10]; % 10 secunde

% Condițiile inițiale
y0 = [theta0; omega0];

% Rezolvarea ecuațiilor diferențiale cu PID
[t, y] = ode45(@(t, y) pendulum_eq_pid(t, y, m, L, g, Kp, Ki, Kd), tspan, y0);

% Simularea vizuală
figure;
axis([-1 1 -1 1]); % limitele axelor
hold on;

% Vectoare pentru a stoca coordonatele pendulului
x_positions = zeros(length(t), 1);
y_positions = zeros(length(t), 1);

for i = 1:length(t)
    % Calcularea coordonatelor pendulului
    x = L * sin(y(i, 1));
    y_pos = -L * cos(y(i, 1));
    
    % Stocarea coordonatelor
    x_positions(i) = x;
    y_positions(i) = y_pos;

    % Actualizarea graficului
    plot([0, x], [0, y_pos], 'r-', 'LineWidth', 2); % brațul pendulului
    plot(x, y_pos, 'bo', 'MarkerSize', 10); % masa pendulului
    plot(x_positions(1:i), y_positions(1:i), 'g--'); % traiectoria pendulului
    pause(0.01); % pauză pentru a vizualiza animația
end

% Evidențierea poziției finale a pendulului
final_x = L * sin(y(end, 1));
final_y = -L * cos(y(end, 1));
plot(final_x, final_y, 'ms', 'MarkerSize', 12, 'MarkerFaceColor', 'm'); % marca finală (săgeată mov)

xlabel('X (m)');
ylabel('Y (m)');
title('Simularea Pendulului Inversat cu Control PID');
grid on;


