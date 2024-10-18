function dydt = pendulum_eq(t, y, m, L, g)
    theta = y(1);
    omega = y(2);
    
    dtheta = omega;
    domega = -(g/L) * sin(theta); % ecuația de mișcare
    
    dydt = [dtheta; domega];
end