 y=zeros(8,2048); %Θα περιέχει τις εξόδους με διαφορετικό snr κάθε φορά
 j=1;
 for SNR=30:-5:-5
     y(j,:)=awgn(x,SNR);
     j=j+1;
 end
 
RMSE=zeros(1,8);
for j=1:8
s=0;
for i=1:2048
s= (y(j,i)-x(i) )^2 +s;
end
RMSE(j)=sqrt(s/2048);
end


NRMSE=zeros(1,8);
for j=1:8
    
NRMSE(j)= RMSE(j) / (maxx-minx);

end

SNR=[30:-5:-5];
plot(SNR,NRMSE)
ylabel('NRMSE')
xlabel('SNR (dB)')
disp('NRMSE in relation to SNR is appeared to a plot.')


%Επανάληψη ερ2
%Υπολογισμός σωρείτη 3ης τάξης για κάθε επίπεδο του SNR

%Μενού επιλογής προβολής διαγραμμάτων
choice = 0;
while ((choice ~= 1) && (choice ~=2))
   
    disp(newline)
    disp('If you want to plot x-estimations of all SNR levels press 1.')
    disp('If you want to plot x-estimations of each SNR-level separately press 2.')
    disp(newline)
    prompt = 'Make a choice : ';
    choice = input(prompt);

    while ( choice ~= 1 && choice ~= 2)
        prompt = 'Wrong input! Please try again : ';
        choice = input(prompt);
    end

    if choice == 1
      for i=1:8  
        c3new=cum3(y(i,:));
        hnew = giannakis(c3new, q);
        xestnew=conv(v,hnew,'same');
        subplot(8,1,i)
        plot(y(i,:))
        hold on
        plot(xestnew,'red')
        str=sprintf('X Estimation-red, SNR = %d',30-5*(i-1) );
        title(str);
        hold off
      end
      
    elseif choice == 2
      
      for i=1:8     
        c3new=cum3(y(i,:));
        hnew = giannakis(c3new, q);
        xestnew=conv(v,hnew,'same');
        plot(y(i,:))
        hold on
        plot(xestnew,'red')
        str=sprintf('X Estimation-red, SNR = %d',30-5*(i-1) );
        title(str);
        hold off
    if i ~= 8
        disp('Press any key to continue to the next SNR level.')
    else 
        disp('End of SNR levels. Press any key.')
    end
        pause;
    end
 end
end









