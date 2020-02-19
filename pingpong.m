%% Ping Pong Simulation  
% 10/24/2016
% Robert Klemm

%% Run this part at beginning 
%Permanent Conditions
htable = .76;                        % height of table in meters
hnet = 0.15;                         % height of net in meters
L = 1.37;                            % Table size length in meters
W = .76;                             % Table size width in meters
m = 0.003;                           % mass of ball (kg)
r = .02;                             % radius of ball (m)
c = 0.9;                             % coefficient of restitution
g = -9.8;                            % acceleration due to gravity

rng('shuffle')

win = input('How many points are we playing to?\n');  % number of points needed for a win
serve = input('Which player will serve first?\n');
servenum = input('How many serves per player?\n');

%Scoring
p1 = 0;                              % scoring for game
p2 = 0;
servecount = 0;
%% Run this section for each point

%Counting
left = 0;                            % #hits per side
right = 0; 

%Figure Window with Ping Pong Table
figure(1)                      		% Open a new figure window
square1 = [-L,0,0,-L,-L; -W,-W,W,W,-W];    % Coordinates for the corners
square2 = [0,L,L,0,0; -W,-W,W,W,-W];       % of the table
square3 = [-W,W,W,-W,-W; 0,0,hnet,hnet,0];
square4 = [-W,W,W,-W,-W; -htable,-htable,0,0,-htable];
zero = [0,0,0,0,0];
sup = [.7*L,.7*L,.7*L,.7*L,.7*L];
axis('equal');
line(square1(1,:),square1(2,:),zero);      % Draw the lines
line(square2(1,:),square2(2,:),zero);
line(zero,square3(1,:),square3(2,:),'color','r');
line(sup,square4(1,:),square4(2,:));
line(-sup,square4(1,:),square4(2,:));

%Labels on Figure
xlim([-2*L 2*L])
ylim([-2*W 2*W])
zlim([-htable 3*htable])
xlabel('Length [m]','FontSize',12)		% Label for x-axis
ylabel('Width [m]','FontSize',12)		% Label for y-axis
zlabel('Height [m]')
title('A Game of Ping Pong!','FontSize',16); % Give the figure a title
axis equal

hold on                 	% Retain current graph when adding new graphs

%The Actual Physics

%Initial Conditions
zi = hnet + .1*randn + .1;                % height of serve
s = 3.3 + .2*randn;                  % initial speed
vzi = -2.3 + .1*randn;               % z - velocity of serve

%The Serve
g2 = 0;
if serve == 1
a = [-L, (1.6*W*rand - W)];          % random position in box
a2 = atan(a(2)/a(1));
ang = .3*a2*randn + a2;
servecount = servecount + 1;
v = [s*cos(ang),s*sin(ang)];         % velocity components
end

if serve == 2
a = [L, (1.6*W*rand - W)];          % random position in box
a2 = atan(a(2)/a(1));
ang = .3*a2*randn + a2;
servecount = servecount + 1;
v = [-s*cos(ang),-s*sin(ang)];         % velocity components
end

if servecount == servenum             %switching the serve
        servecount = 0;
        if serve == 1
            serve = 2;
        else
            serve = 1;
        end
end

z = zi;
vz = vzi;                   % z - velocity of serve

h = plot3(a(1),a(2),z,'o','markersize',6,'color','g'); %plot the ball


timestep = 0.04; % in seconds
k2 = 1;
k3 = 0;
data = [0,a(1),a(2),z,v(1),v(2),vz];
    for k=1:200
        k2 = k2 + 1;
        if g2 == 1
        k3 = k3 + 1;
        end
        t = timestep * k2;
            olda = a; % keep old position for use later
            oldz = z; % keep old height
            a = a + timestep * v; % x and y position
            vz = vzi + g*t; % z velocity
            z = zi + vzi*t + .5*g*(t)^2; % z position
            set(h, 'XDataSource','a(1)')
            set(h, 'YDataSource','a(2)')
            set(h, 'ZDataSource','z')
            if (z < 0) && (a(1) < L+r && a(1) > -(L+r) && a(2) < W+r && a(2) > -(W+r)) %hit the table
                zi = -oldz;
                vzi = -c*vz;
                k2 = 1; %recalculates kinematics after bounce
                if a(1) > 0
                    right = right + 1; 
                    left = 0;
                    if right == 2
                        p1 = p1 + 1;
                        break
                    end
                    k3 = 0; %restart timer
                end
                if a(1) < 0
                    left = left + 1; 
                    right = 0;
                    if left == 2
                        p2 = p2 + 1;
                        break
                    end
                    k3 = 0; %restart timer
                end
            end
             if (a(1) > 2*L || a(1) < -2*L || a(2) > 2*W || a(2) < -2*W || z < -htable || z > 3*htable) %out of bounds
                if left == 1
                    p2 = p2 + 1;
                else 
                    p1 = p1 + 1;
                end
                break
             end
            if (a(1) > -3*r && a(1) < 3*r) && (a(2) > -(W+r) && a(2) < W+r) && (z < hnet + r) %net
                if left == 1
                    p2 = p2 + 1;
                else 
                    p1 = p1 + 1;
                end
                break
            end
            if (olda(1)/a(1)) < 0
                g2 = 1; % ball has crossed the plane of the net
            end
            % Hit / Volley
            if (a(1) > 0  && g2 == 1 && right == 1 && (k3*timestep > .1))
                % p2 hits ball back
                a2 = atan(a(2)/a(1));
                ang = .4*randn + a2;
                vzi = 1.1*vz - g*t - 3*z + 0.4*randn;
                zi = z;
                v = [-s*cos(ang),-s*sin(ang)];
                k2 = 1; %recalculates kinematics after bounce
                g2 = 0;
            end
            if (a(1) < 0  && g2 == 1 && left == 1 && (k3*timestep > .1))
                % p1 hits ball back
                a2 = atan(a(2)/a(1));
                ang = .4*randn + a2;
                vzi = 1.1*vz - g*t - 3*z + 0.4*randn;
                zi = z;
                v = [s*cos(ang),s*sin(ang)];
                k2 = 1; %recalculates kinematics after bounce
                g2 = 0;
            end
            data(k,:) = [k*timestep,a(1),a(2),z,v(1),v(2),vz];%data table
            refreshdata
            drawnow
    end
    
   
 %Data in Graph Form
figure(2)
subplot(3,2,1)
plot(data(:,1),data(:,2))
xlabel('time')
ylabel('length')
hold on
subplot(3,2,2)
plot(data(:,1),data(:,3))
xlabel('time')
ylabel('width')
hold on 
subplot(3,2,3)
plot(data(:,1),data(:,4))
xlabel('time')
ylabel('height')
hold on 
subplot(3,2,4)
plot(data(:,2),data(:,4))
xlabel('length')
ylabel('height')
hold on
subplot(3,2,5)
plot(data(:,2),data(:,3))
xlabel('length')
ylabel('width')
hold on
subplot(3,2,6)
plot(data(:,1),data(:,7))
xlabel('time')
ylabel('z-velocity')


%Score Display
fprintf('Player 1:%d\n',p1);
fprintf('Player 2:%d\n',p2);

%Ending the Game
if (p1 > win - 1 || p2 > win - 1) && abs(p1 - p2) > 1
    if p1 > p2
        fprintf('Player 1 has won the ping pong match\n');
    else
        fprintf('Player 2 has won the ping pong match\n');
    end
    fprintf('Thanks for watching!\n');
end

%% Future Ideas

% adjust speeds and angles
% add friction, spin


