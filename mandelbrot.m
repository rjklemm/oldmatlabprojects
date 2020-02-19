%% Mandelbrot Set
t = .002; %step size
x = -2:t:2; %real
y = -2:t:2; %complex
% n = 50; %test value
num = length(x);
A(num,num) = 0; % plot
for i = 1:num
    yval = y(i);
    for j = 1:num
        xval = x(j);
        c = xval + 1i*yval;
        z = 0;
        n = 0;
        while (abs(z) < 2 && n < 100)
            z = z^2 + c;
            n = n + 1;
        end
        A(i,j) = n;
    end
end
figure(1)
contour(x,y,A)
xlabel('real axis')
ylabel('imag axis')
title('Mandelbrot Set')
