%% Walking Feet

% Robert Klemm
% 10/29/2016

function spot = walksegment(xi,yi,xf,yf)

xd = xf - xi;
yd = yf - yi;
dist = sqrt(xd^2 + yd^2);

if xd == 0 
    if yd > 0 
        ang = pi/2;
    else
        ang = -pi/2;
    end
elseif xd < 0 
    ang = atan(yd/xd) + pi;
else
    ang = atan(yd/xd);
end

% The Feet
L = .15; %half of length
W = .05; %half of width
stepsize = .7; %stepsize [m]
dist2 = .12; %feet to center

k = 2*dist/stepsize; %number of steps

% Initial Spot
cent1 = [xi-dist2*sin(ang),yi+dist2*cos(ang)];
cent2 = [xi+dist2*sin(ang),yi-dist2*cos(ang)];


% Location of Feet
f1x = [W*sin(ang)-L*cos(ang)+cent1(1),W*sin(ang)+L*cos(ang)+cent1(1),-W*sin(ang)+L*cos(ang)+cent1(1),-W*sin(ang)-L*cos(ang)+cent1(1),W*sin(ang)-L*cos(ang)+cent1(1)];
f1y = [-W*cos(ang)-L*sin(ang)+cent1(2),-W*cos(ang)+L*sin(ang)+cent1(2),W*cos(ang)+L*sin(ang)+cent1(2),W*cos(ang)-L*sin(ang)+cent1(2),-W*cos(ang)-L*sin(ang)+cent1(2)];
f2x = [W*sin(ang)-L*cos(ang)+cent2(1),W*sin(ang)+L*cos(ang)+cent2(1),-W*sin(ang)+L*cos(ang)+cent2(1),-W*sin(ang)-L*cos(ang)+cent2(1),W*sin(ang)-L*cos(ang)+cent2(1)];
f2y = [-W*cos(ang)-L*sin(ang)+cent2(2),-W*cos(ang)+L*sin(ang)+cent2(2),W*cos(ang)+L*sin(ang)+cent2(2),W*cos(ang)-L*sin(ang)+cent2(2),-W*cos(ang)-L*sin(ang)+cent2(2)];

% Plotting
figure(1)
%axis([-5 5 -5 5])
h1 = line(f1x(1,:),f1y(1,:),'color','r'); %left foot
h2 = line(f2x(1,:),f2y(1,:),'color','g'); %right foot
axis('equal')
xlabel('x [m]')
ylabel('y [m]')
title('A Walk','FontSize',16);

%Walking
     feet = [cent1,cent2];
%     k = 30;
     spot(length(feet),2) = 0;
     [feet] = walkfeet(feet,ang,stepsize,k);
            for k = 1:length(feet)
            cent1 = [feet(k,1),feet(k,2)];
            cent2 = [feet(k,3),feet(k,4)];
%              ang1 = data(k,1);
%              ang2 = data(k,2);
            f1x = [W*sin(ang)-L*cos(ang)+cent1(1),W*sin(ang)+L*cos(ang)+cent1(1),-W*sin(ang)+L*cos(ang)+cent1(1),-W*sin(ang)-L*cos(ang)+cent1(1),W*sin(ang)-L*cos(ang)+cent1(1)];
            f1y = [-W*cos(ang)-L*sin(ang)+cent1(2),-W*cos(ang)+L*sin(ang)+cent1(2),W*cos(ang)+L*sin(ang)+cent1(2),W*cos(ang)-L*sin(ang)+cent1(2),-W*cos(ang)-L*sin(ang)+cent1(2)];
            f2x = [W*sin(ang)-L*cos(ang)+cent2(1),W*sin(ang)+L*cos(ang)+cent2(1),-W*sin(ang)+L*cos(ang)+cent2(1),-W*sin(ang)-L*cos(ang)+cent2(1),W*sin(ang)-L*cos(ang)+cent2(1)];
            f2y = [-W*cos(ang)-L*sin(ang)+cent2(2),-W*cos(ang)+L*sin(ang)+cent2(2),W*cos(ang)+L*sin(ang)+cent2(2),W*cos(ang)-L*sin(ang)+cent2(2),-W*cos(ang)-L*sin(ang)+cent2(2)];
            h1 = line(f1x(1,:),f1y(1,:),'color','r'); %left foot
            h2 = line(f2x(1,:),f2y(1,:),'color','g'); %right foot
            spot(k,:) = [(cent1(1)+cent2(1))/2,(cent1(2)+cent2(2))/2];
            hold on
            refreshdata
            drawnow
            end
   
%Line of Path
plot(spot(:,1),spot(:,2));
end