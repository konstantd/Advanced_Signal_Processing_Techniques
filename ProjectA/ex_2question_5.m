xest=conv(v,h,'same'); %Θέλουμε να κρατήσουμε τα ίδια δείγματα με του v[k]
 
plot(x)
hold on
plot(xest,'red')
title('X Estimation-red')
hold off

disp('X[k] and X[k]estimations are appeared to a plot.')
disp(newline)
%RMSE
s=0;
for i=1:2048
s= (xest(i)-x(i) )^2 +s;
end

RMSE=sqrt(s/2048);

%NRMSE
%find_max
maxx=max(x);
%find_min
minx=min(x);
NRMSE= RMSE / (maxx-minx);
 
disp('The Normalised Root Mean Square Error is equal to:')
disp(NRMSE)
