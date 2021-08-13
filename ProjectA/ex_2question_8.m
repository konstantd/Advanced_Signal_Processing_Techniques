NRMSE=0;%Μέση τιμή
NRMSE_sup=0;
NRMSE_sub=0;

for p=1:100  %Υλοποιεί 100 φορες την διαδικασία του συστήματος
    
 ex_2question_1
 ex_2question_2 
 ex_2question_3_4
     
%RMSE
s=0;
for i=1:2048
s= (xest(i)-x(i) )^2 +s;
end
RMSE=sqrt(s/2048);

%NRMSE
maxx=max(x);
minx=min(x);
NRMSE= RMSE / (maxx-minx)+ NRMSE;



%Για το NRMSE_sup
s=0;
for i=1:2048
s= (xest_sup(i)-x(i) )^2 +s;
end
RMSE_sup=sqrt(s/2048);
maxx=max(x);
minx=min(x);
NRMSE_sup= RMSE_sup / (maxx-minx) + NRMSE_sup;


%Για το NRMSE_sub
s=0;
for i=1:2048
s= (xest_sub(i)-x(i) )^2 +s;
end
RMSE_sub=sqrt(s/2048);
maxx=max(x);
minx=min(x);
NRMSE_sub= RMSE_sub / (maxx-minx)+ NRMSE_sub;

end

NRMSE_sup=NRMSE_sup/100;
NRMSE_sub=NRMSE_sub/100;
NRMSE=NRMSE/100;

disp('The mean Normalised Root Mean Square Error is equal to:')
disp(NRMSE)

disp('The mean Normalised Root Mean Square Error for q-supplement is equal to:')
disp(NRMSE_sup)

disp('The mean Normalised Root Mean Square Error for q-subtraction is equal to:')
disp(NRMSE_sub)
