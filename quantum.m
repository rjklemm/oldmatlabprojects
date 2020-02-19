%% Quantum Mechanics (Spin 1/2) Calculations
% Chapter 1

%define z-basis kets
% p = plus; m = minus
pz = [1 0];
mz = [0 1];
px = sqrt(2)/2 * [1 1];
mx = sqrt(2)/2 * [1 -1];
py = sqrt(2)/2 * [1 1i];
my = sqrt(2)/2 * [1 -1i];

%% Sample Calculations
% z = (pz*pz')^2;
% z2 =(mz*pz')^2;
% z3 =(mz*mz')^2;
% x = (px*px')^2;
% x2 =(mx*px')^2;
% x3 =(mx*mx')^2;
% y = (py*py')^2;
% y2 = (my*py')^2;
% y3 = (my*my')^2;

%% Chapter One Problems

prompt1 = 'What is the basis that you are using (x,y,z,n)?\n';
base = input(prompt1,'s');
prompt2 = 'What is the value for a?\n';
a = input(prompt2);
prompt3 = 'What is the value for b?\n';
b = input(prompt3);

c = 1/sqrt(a*conj(a)+b*conj(b));

if base == 'z'
    ket = c*(a*pz+b*mz);
    g = 0;
elseif base == 'x'
    ket = c*(a*px+b*mx);
    g = 0;
elseif base == 'y'
    ket = c*(a*py+b*my);
    g = 0;
elseif base == 'n'
    theta = input('What is the value of theta?\n');
    phi = input('What is the value of phi?\n');
    pn = [cos(theta/2) sin(theta/2)*exp(1i*phi)];
    mn = [sin(theta/2) -cos(theta/2)*exp(1i*phi)];
    ket = c*(a*pn+b*mn);
    g = 1;
else
    display('not one of x, y, z, or n error\n');
    g = 1;
end

if g == 0

    fprintf('In the next prompt, type the number after the desired measurement\n');
prompt4 = 'What do you want to measure (+z(1),-z(2),+x(3),-x(4),+y(5),-y(6),+n(7),-n(8))?\n';
m = input(prompt4);

    if m == 1
      p = (pz*ket')*conj(pz*ket');
      m2 = '+z';
    elseif m == 2
      p = (mz*ket')*conj(mz*ket');
      m2 = '-z';
    elseif m == 3
      p = (px*ket')*conj(px*ket');
      m2 = '+x';
    elseif m == 4 
      p = (mx*ket')*conj(mx*ket');
      m2 = '-x';
    elseif m == 5
      p = (py*ket')*conj(py*ket');
      m2 = '+y';
    elseif m == 6
      p = (my*ket')*conj(my*ket'); 
      m2 = '-y';
    elseif m == 7
        theta = input('What is the value of theta?\n');
        phi = input('What is the value of phi?\n');
        pn = [cos(theta/2) sin(theta/2)*exp(1i*phi)];
        mn = [sin(theta/2) -cos(theta/2)*exp(1i*phi)];
        p = (pn*ket')*conj(pn*ket');
        m2 = '+n';
    elseif m == 8
        theta = input('What is the value of theta?\n');
        phi = input('What is the value of phi?\n');
        pn = [cos(theta/2) sin(theta/2)*exp(1i*phi)];
        mn = [sin(theta/2) -cos(theta/2)*exp(1i*phi)];
        p = (mn*ket')*conj(mn*ket');
        m2 = '-n';
    else
        display('not an acceptable value; error\n');
    end
    if p >= 0
        fprintf('The probability of measuring %s is %f.\n',m2,p); 
    end
end