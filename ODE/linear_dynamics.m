function linear_dynamics(f,g)
syms x y


J = jacobian([f,g],[x,y]);

t = J(1) + J(4);
det = J(1)*J(4) - J(3)*J(2);


if det < 0
    disp("Origin is a saddle point")
end

if t > 0 && det > 0
    if t^2 - 4*det < 0
        disp("Origin is an unstable spiral")
    end
    if t^2 - 4*det > 0
        disp("Origin is an unstable node")
    end
    if t^2 - 4*det == 0
        disp("Origin is a denegerate source")
    end
end

if t == 0 && det > 0
    disp("Origin is a center")
end

if t < 0
    if t^2 - 4*det < 0
        disp("Origin is a stable spiral")
    end
    if t^2 - 4*det > 0
        disp("Origin is an stable node")
    end
    if t^2 - 4*det == 0
        disp("Origin is a denegerate sink")
    end
end


