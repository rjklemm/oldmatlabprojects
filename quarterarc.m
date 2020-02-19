function points = quarterarc(xi,yi,xf,yf,num)
% sweeps/traces a quarter circle or ellipse counterclockwise from (xi,yi)
% to (xc,yc) using num(#) points (plus one extra endpoint). the x and y
% displacement have to be nonzero

xd = xf - xi; %scale for x
yd = yf - yi; %scale for y

if xd < 0 && yd > 0 % Q1
    xc = min(xf,xi);
    yc = min(yf,yi);
    angi = 0;
elseif xd < 0 && yd < 0 % Q2
    xc = max(xf,xi);
    yc = min(yf,yi);
    angi = pi/2;
elseif xd > 0 && yd < 0 % Q3
    xc = max(xf,xi);
    yc = max(yf,yi);
    angi = pi;
elseif xd > 0 && yd > 0 % Q4
    xc = min(xf,xi);
    yc = max(yf,yi);
    angi = 3*pi/2;
else 
    fprintf('Box has zero as a dimension.\n');
    return
end

ang = pi/(2*num); %angle of trace between each point

points(num+1,2) = 0;

for i = 0:num
    a = ang * i + angi;
    points(i+1,1) = xc + abs(xd) * cos(a);
    points(i+1,2) = yc + abs(yd) * sin(a);
end

end