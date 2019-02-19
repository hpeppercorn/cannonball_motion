function b = isintercepted(t, a)

b = 0;
m = 6;
K = 0.00002;
g = 9.8;
z0 = [0, 0, 450*cos(a), 450*sin(a)];

projectile_ode = @(t, z) [z(3); z(4); -(K/m)*z(3)*sqrt((z(3)^2)+(z(4)^2)); -(K/m)*z(4)*sqrt((z(3)^2)+(z(4)^2)) - g];

sol = ode45(projectile_ode, [0 100], z0);

intercept_time = fzero(@(r)deval(sol, r, 1)-12000, [sol.x(1), sol.x(end)]);

height = deval(sol, intercept_time, 2);

for i = [4000+100*(t+intercept_time): -2000: 0]
    
    if ((i-height)<=1000) & ((i-height)>=0)
        b = 1;
        break
    else
        continue
    end
end


end