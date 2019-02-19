launchangle1 = fzero(@(k)xdistance(k)-15000, [0.0001, ang])
launchangle2 = fzero(@(k)xdistance(k)-15000, [ang, pi/2])