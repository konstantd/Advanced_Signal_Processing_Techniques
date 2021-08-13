%Δημιουργία και απεικόνιση σωρειτών 3ης τάξης-Έμμεση Μέθοδος

c3=zeros(41,41); 
K=32;
M=64;

%Κατάτμηση
segm=zeros(K,M);

for i=0:(K-1)
    for j=1:M      
        segm(i+1,j)=x(M*i+j);
    end
end


%Αφαίρεση μέσης τιμής του κάθε υποσυνόλου
  average_seg=zeros(K,1);
  
  for i=1:K
      s=0;
    for j=1:M
    s=segm(i,j)+s;
    end
    average_seg(i)=s/M;    
  end
  
    for i=1:K
    for j=1:M
    segm(i,j)=segm(i,j)-average_seg(i);
    end
    end
    
    
%Eκτίμηση ροπής 3ης τάξης
r=zeros(K,41,41);
  
  for i=1:K
  for m = -20 :20 
  for n = -20 :20 
      
     pin_max=[0 -m -n];
     pin_min=[M-1   M-1-m   M-1-n];   
     s1=max(pin_max); 
     s2=min(pin_min);
     s=0;
   for l=s1:s2
       s=segm(i,l+1)*segm(i,l+1+m)*segm(i,l+n+1)+s;
   end
   r(i,m+21,n+21)=s/M;

  end
  end
  end
  
  
   
   
 %Mέση τιμή όλων των υποσυνόλων
 c3=zeros(41,41);     %1η θέση πίνακα βρίσκεται για m,n=-20/ 21η για m,n=0/ 41η για m,n=+20
 
  for m = -20 :20 
  for n = -20 :20 
       for i=1:K
    c3(m+21,n+21)= r(i, m+21,n+21) +c3(m+21,n+21); 
       end
       c3(m+21,n+21)=c3(m+21,n+21)/K;
 end
  end

m=[-20:1:20];
n=[-20:1:20];
