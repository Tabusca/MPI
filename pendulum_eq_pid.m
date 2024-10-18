% Definirea funcției cu PID
function dydt = pendulum_eq_pid(t, y, m, L, g, Kp, Ki, Kd)
    % Setpoint (poziția dorită)
    setpoint = 0; % Unghiul dorit (vertical)
    
    % Variabilele stării pendulului
    theta = y(1); % unghiul curent
    omega = y(2); % viteza unghiulară curentă

    % Calculează eroarea
    error = setpoint - theta;

    % Erorile anterioare (necesare pentru integrarea și derivarea)
    persistent integral previous_error;
    if isempty(integral)
        integral = 0; % Initializează integralul
    end
    if isempty(previous_error)
        previous_error = 0; % Initializează eroarea anterioară
    end
    
    % Actualizează integralul
    integral = integral + error; % Accumulează eroarea

    % Derivata erorii
    derivative = error - previous_error;

    % Controlul PID
    control_signal = Kp * error + Ki * integral + Kd * derivative;
    disp(control_signal)
    % Actualizează eroarea anterioară
    previous_error = error;

    % Ecuația de mișcare a pendulului
    dtheta = omega;
    domega = (control_signal - (m * g * L * sin(theta))) / (m * L^2); % Dinamică cu control PID

    dydt = [dtheta; domega];
end