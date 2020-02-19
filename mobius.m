% WallArchTwistShrink.m
% Program to plot a twisted arch
% on a planar wall and shrink the
% surface along the way
%
hold off
clear all
% Initial line segment endpoints
R = 1.0; beta = 0.3;
A0 = [R -beta * R 0.0]';
B0 = [R beta * R 0.0]';
n = 150; % n+1 is the number of line
% segments to plot
dtheta = 2*pi / n; dphi = pi / n;
dL = 0.0;
% dphi = 0.0; % no twist case
% dL = 0.0; % no shrinkage
for i=1:n+1
theta = (i - 1) * dtheta;
phi = (i - 1) * dphi;
T1 = [cos(theta) 0 -sin(theta) 0; 0 1 0 0; sin(theta) 0 cos(theta) 0; 0 0 0 1];
T2 = [1 0 0 R; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T3 = [cos(phi) -sin(phi) 0 0; sin(phi) cos(phi) 0 0; 0 0 1 0; 0 0 0 1];
T4 = [1 0 0 -R; 0 1 0 0; 0 0 1 0; 0 0 0 1];
% Shrink segment
% Reduce beta each step
beta1 = beta - (i - 1) * dL;
A00 = [R -beta1 * R 0.0]';
B00 = [R beta1 * R 0.0]';
A = T1 * T2 * T3 * T4 * [A00;1];
B = T1 * T2 * T3 * T4 * [B00;1];
XA(i) = A(1); YA(i) = A(2);
ZA(i) = A(3); XB(i) = B(1);
YB(i) = B(2); ZB(i) = B(3);
X = [XA(i) XB(i)];
Y = [YA(i) YB(i)];
Z = [ZA(i) ZB(i)];
plot3(X,Y,Z,'LineWidth',2)
hold on
end
% Plot generator
X0 = [A0(1) B0(1)];
Y0 = [A0(2) B0(2)];
Z0 = [A0(3) B0(3)];
plot3(X0,Y0,Z0,'LineWidth',3,'Color','r')
axis equal
%
% SolidWorks output matrix
SW = [XA' YA' ZA' XB' YB' ZB']; 