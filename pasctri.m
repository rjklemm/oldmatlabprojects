%% Pascal's Triangle
n = 100;
d1 = 2;
d2 = 3;
d3 = 4;
d4 = 5;
d5 = 6;
d6 = 7; 
d7 = 8;
A2(n,n) = 0;
A3(n,n) = 0;
A4(n,n) = 0;
A5(n,n) = 0;
A6(n,n) = 0;
A7(n,n) = 0;
A8(n,n) = 0;
P(n,n) = 0;
for i = 1:n  %actual triangle values
    for j = 1:i
        if j == 1
            P(i,j) = 1;
        elseif j == i
            P(i,j) = 1;
        else
            P(i,j) = P(i-1,j-1) + P(i-1,j);
        end
    end
end     

for i = 1:n %for divisibility by 2
    for j = 1:i
        if j == 1
            A2(i,j) = 1;
        elseif j == i
            A2(i,j) = 1;
        else
            A2(i,j) = mod(A2(i-1,j-1) + A2(i-1,j),d1);
        end
    end
end 

for i = 1:n %for 3
    for j = 1:i
        if j == 1
            A3(i,j) = 1;
        elseif j == i
            A3(i,j) = 1;
        else
            A3(i,j) = mod(A3(i-1,j-1) + A3(i-1,j),d2);
        end
    end
end 

for i = 1:n %for 4
    for j = 1:i
        if j == 1
            A4(i,j) = 1;
        elseif j == i
            A4(i,j) = 1;
        else
            A4(i,j) = mod(A4(i-1,j-1) + A4(i-1,j),d3);
        end
    end
end 

for i = 1:n %for 5
    for j = 1:i
        if j == 1
            A5(i,j) = 1;
        elseif j == i
            A5(i,j) = 1;
        else
            A5(i,j) = mod(A5(i-1,j-1) + A5(i-1,j),d4);
        end
    end
end 

for i = 1:n %for 6
    for j = 1:i
        if j == 1
            A6(i,j) = 1;
        elseif j == i
            A6(i,j) = 1;
        else
            A6(i,j) = mod(A6(i-1,j-1) + A6(i-1,j),d5);
        end
    end
end 

for i = 1:n %for 7
    for j = 1:i
        if j == 1
            A7(i,j) = 1;
        elseif j == i
            A7(i,j) = 1;
        else
            A7(i,j) = mod(A7(i-1,j-1) + A7(i-1,j),d6);
        end
    end
end 

for i = 1:n %for 8 
    for j = 1:i
        if j == 1
            A8(i,j) = 1;
        elseif j == i
            A8(i,j) = 1;
        else
            A8(i,j) = mod(A8(i-1,j-1) + A8(i-1,j),d7);
        end
    end
end
% 
% for i = 1:n %for 12
%     for j = 1:i
%         if j == 1
%             A12(i,j) = 1;
%         elseif j == i
%             A12(i,j) = 1;
%         else
%             A12(i,j) = mod(A12(i-1,j-1) + A12(i-1,j),12);
%         end
%     end
% end 
% 
% for i = 1:n %for 30
%     for j = 1:i
%         if j == 1
%             A30(i,j) = 1;
%         elseif j == i
%             A30(i,j) = 1;
%         else
%             A30(i,j) = mod(A30(i-1,j-1) + A30(i-1,j),30);
%         end
%     end
% end 
% 
% for i = 1:n %for 16
%     for j = 1:i
%         if j == 1
%             A16(i,j) = 1;
%         elseif j == i
%             A16(i,j) = 1;
%         else
%             A16(i,j) = mod(A16(i-1,j-1) + A16(i-1,j),16);
%         end
%     end
% end 
% 
% for i = 1:n %for 28
%     for j = 1:i
%         if j == 1
%             A28(i,j) = 1;
%         elseif j == i
%             A28(i,j) = 1;
%         else
%             A28(i,j) = mod(A28(i-1,j-1) + A28(i-1,j),28);
%         end
%     end
% end 

figure(1)
surf(A2)
title('mod 2')

figure(2)
surf(A3)
title('mod 3')

figure(3)
surf(A4)
title('mod 4')

figure(4)
surf(A5)
title('mod 5')

figure(5)
surf(A6)
title('mod 6')

figure(6)
surf(A7)
title('mod 7')

figure(7)
surf(A8)
title('mod 8')

% figure(1)
% surf(A12)
% title('mod 12')
% 
% figure(2)
% surf(A16)
% title('mod 16')
% 
% figure(3)
% surf(A28)
% title('mod 28')
% 
% figure(4)
% surf(A30)
% title('mod 30')