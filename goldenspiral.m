%% Spiral 1
% 11/1/2017
% Robert Klemm

% ratio = (1 + sqrt(5)) / 2; % golden ratio
% 
% th = -12*pi : pi/100 : 12*pi; % set bounds
% k = log(ratio) / pi;
% r = exp(k.*th);
% 
% for i = 1:length(th)
% x(i) = r(i) * cos(th(i));
% y(i) = r(i) * sin(th(i));
% end
% 
% plot(x,y,'r')
% title('A Spiral')


%% Golden Spiral 
% 1/20/2018

%Fibonacci
m = 18;
a = 1;
b = 1;
d = [1 1];
for i = 1:m
    c = a + b;
    a = b;
    b = c;
    d =[d c];
end

n = 6;
x0 = 0;
y0 = 0;
x(d) = 0;
y(d) = 0;

x(2) = x0 + d(1);
y(2) = y0 - d(1);
points = quarterarc(0,0,x(2),y(2),n);


for i = 2:length(d)
    if mod(i,4) == 1
        x(i+1) = x(i) + d(i);
        y(i+1) = y(i) - d(i);
    elseif mod(i,4) == 2
        x(i+1) = x(i) + d(i);
        y(i+1) = y(i) + d(i); 
    elseif mod(i,4) == 3
        x(i+1) = x(i) - d(i);
        y(i+1) = y(i) + d(i);  
    elseif mod(i,4) == 0
        x(i+1) = x(i) - d(i);
        y(i+1) = y(i) - d(i);
    end
    
    xmin = min(x(i),x(i+1));
    ymin = min(y(i),y(i+1));
    w = d(i);
    
    points2 = quarterarc(x(i),y(i),x(i+1),y(i+1),n);
%     points = [points;points2];

plot(points2(:,1),points2(:,2),'r');
axis equal
hold on
rectangle('Position',[xmin ymin w w])
title('Golden Spiral')
hold on
end



