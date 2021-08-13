newline=sprintf('\n'); 
disp(newline)
disp('Press any key to start with the 1st question.')
disp(newline)
pause;
   
disp(newline)
disp('#Question 2.1')
disp(newline)
ex_2question_1
disp('Skewness is equal to :')
disp(skewness)
disp(newline)
disp('Press any key to continue to the next question.')
disp(newline)
pause;


disp('#Question 2.2')
disp(newline)
ex_2question_2
disp(newline)
%3D plot
surf(m,n,c3)   %Βρίσκεται εδώ και οχι στο αντίστοιχο σκριπτάκι καθώς το ex_2question_2               
xlabel('m')    %χρησιμοποείται και στο τελευτάιο ερώτημα όπου δεν θέλουμε να υπάρχει διάγραμμα σχεδίασης
ylabel('n')
zlabel('c(m,n)')
title('3rd order cumulants of x[k]')
disp('A 3D plot of 3rf order cumumalnt is appeared.')
disp(newline)
disp('Press any key to continue to the next question.')
disp(newline)
pause;


disp('#Question 2.3 & 2.4')
disp(newline)
ex_2question_3_4
disp(newline)
disp('The approximated impulse respones of the system-h functions for q, q-supplement and q-subtraction have been estimated.')
disp(newline)
disp('Press any key to continue to the next question.')
disp(newline)
pause;

disp('#Question 2.5')
disp(newline)
ex_2question_5
disp(newline)
disp('Press any key to continue to the next question.')
disp(newline)
pause;

close all
disp('#Question 2.6')
disp(newline)
ex_2question_6
disp(newline)
disp('Press any key to continue to the next question.')
disp(newline)
pause;

close all
disp('#Question 2.7')
disp(newline)
ex_2question_7
disp(newline)
disp('Press any key to continue to the last question.')
disp(newline)
pause;


disp('#Question 2.8')
disp('Please be patient. It may take some time.')
disp(newline)
ex_2question_8
disp(newline)
disp('End of exercise 2. Press any key.')
disp(newline)
pause;