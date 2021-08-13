xest_sub=conv(v,hsub,'same');
xest_sup=conv(v,hsup,'same');
  
subplot(2,1,1)
hold on
plot(x)
plot(xest_sup,'yellow')
title('Xsup Estimation-yellow')
hold off


subplot(2,1,2)
hold on
plot(x)
plot(xest_sub,'green')
title('Xsub Estimation-green')
hold off

disp('Estimations for q-sup and q-sub are appeared to a plot.')
disp(newline)

%Για το NRMSE_sup
s=0;
for i=1:2048
s= (xest_sup(i)-x(i) )^2 +s;
end
RMSE_sup=sqrt(s/2048);
maxx=max(x);
minx=min(x);
NRMSE_sup= RMSE_sup / (maxx-minx);


%Για το NRMSE_sub
s=0;
for i=1:2048
s= (xest_sub(i)-x(i) )^2 +s;
end
RMSE_sub=sqrt(s/2048);
maxx=max(x);
minx=min(x);
NRMSE_sub= RMSE_sub / (maxx-minx);

 
disp('The Normalised Root Mean Square Error for q-supplement is equal to:')
disp(NRMSE_sup)

disp('The Normalised Root Mean Square Error for q-subtraction is equal to:')
disp(NRMSE_sub)

 
 