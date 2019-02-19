function f = xdistance(k)

m = 6;
K = 0.00002;
g = 9.8;
z0= [0, 0, 450*cos(k), 450*sin(k)];

% z = [x y u v]

projectile_ode = @(t, z) [z(3); z(4); -(K/m)*z(3)*sqrt((z(3)^2)+(z(4)^2)); -(K/m)*z(4)*sqrt((z(3)^2)+(z(4)^2)) - g];

sol = ode45(projectile_ode, [0 100], z0);

time = fzero(@(r)deval(sol, r, 2), [sol.x(2), sol.x(end)]);

f = deval(sol, time, 1);

end