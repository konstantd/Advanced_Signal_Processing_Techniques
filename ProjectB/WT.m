%dwt with Symlets family
[c,l] = wavedec(sig100(234889:242089),6,'sym6');
approx = appcoef(c,l,'sym6');
[cd1,cd2,cd3,cd4,cd5,cd6] = detcoef(c,l,[1 2 3 4 5 6]);
subplot(7,1,1)
plot(approx)
title('Approximation Coefficients')
subplot(7,1,2)
plot(cd6)
title('Level 6 Detail Coefficients')
subplot(7,1,3)
plot(cd5)
title('Level 5 Detail Coefficients')
subplot(7,1,4)
plot(cd4)
title('Level 4 Detail Coefficients')
subplot(7,1,5)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(7,1,6)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(7,1,7)
plot(cd1)
title('Level 1 Detail Coefficients')
%dwt with Symlets family
[c,l] = wavedec(sig100(540644:547845),6,'sym6');
approx = appcoef(c,l,'sym6');
[cd1,cd2,cd3,cd4,cd5,cd6] = detcoef(c,l,[1 2 3 4 5 6]);
subplot(7,1,1)
plot(approx)
title('Approximation Coefficients')
subplot(7,1,2)
plot(cd6)
title('Level 6 Detail Coefficients')
subplot(7,1,3)
plot(cd5)
title('Level 5 Detail Coefficients')
subplot(7,1,4)
plot(cd4)
title('Level 4 Detail Coefficients')
subplot(7,1,5)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(7,1,6)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(7,1,7)
plot(cd1)
title('Level 1 Detail Coefficients')
%dwt with Symlets family
[c,l] = wavedec(sig100(560788:567989),6,'sym6');
approx = appcoef(c,l,'sym6');
[cd1,cd2,cd3,cd4,cd5,cd6] = detcoef(c,l,[1 2 3 4 5 6]);
subplot(7,1,1)
plot(approx)
title('Approximation Coefficients')
subplot(7,1,2)
plot(cd6)
title('Level 6 Detail Coefficients')
subplot(7,1,3)
plot(cd5)
title('Level 5 Detail Coefficients')
subplot(7,1,4)
plot(cd4)
title('Level 4 Detail Coefficients')
subplot(7,1,5)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(7,1,6)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(7,1,7)
plot(cd1)
title('Level 1 Detail Coefficients')
%denoising signal using WT
fd = wden (sig113(89925:97126),'rigrsure','s','sln',6,'sym6');
figure
subplot(2,1,1);
plot(sig113(89925:97126))
axis tight; grid on; title('4:20 Moderate baseline wander');
subplot(2,1,2);
plot(fd); axis tight; grid on;
title('Denoised Signal')
%dwt with Symlets family
[c,l] = wavedec(sig113(89925:97126),6,'sym6');
approx = appcoef(c,l,'sym6');
[cd1,cd2,cd3,cd4,cd5,cd6] = detcoef(c,l,[1 2 3 4 5 6]);
subplot(7,1,1)
plot(approx)
title('Approximation Coefficients')
subplot(7,1,2)
plot(cd6)
title('Level 1 Detail Coefficients')
subplot(7,1,3)
plot(cd5)
title('Level 2 Detail Coefficients')
subplot(7,1,4)
plot(cd4)
title('Level 3 Detail Coefficients')
subplot(7,1,5)
plot(cd3)
title('Level 4 Detail Coefficients')
subplot(7,1,6)
plot(cd2)
title('Level 5 Detail Coefficients')
subplot(7,1,7)
plot(cd1)
title('Level 6 Detail Coefficients')
%--------------------------------------------------------------
plot(tm100(540644:547845),sig100(540644:547845));
%dwt me Dawbenchies
[c,l] = wavedec(sig100(540644:547845),6,'db4');
approx = appcoef(c,l,'sym6');
[cd1,cd2,cd3,cd4,cd5,cd6] = detcoef(c,l,[1 2 3 4 5 6]);
subplot(7,1,1)
plot(approx)
title('Approximation Coefficients')
subplot(7,1,2)
plot(cd6)
title('Level 6 Detail Coefficients')
subplot(7,1,3)
plot(cd5)
title('Level 5 Detail Coefficients')
subplot(7,1,4)
plot(cd4)
title('Level 4 Detail Coefficients')
subplot(7,1,5)
plot(cd3)
title('Level 3 Detail Coefficients')
subplot(7,1,6)
plot(cd2)
title('Level 2 Detail Coefficients')
subplot(7,1,7)
plot(cd1)
title('Level 1 Detail Coefficients')
%STFT ?? ????? 3 level ??? ?? approx
Nx = length(approx);
nsc = floor(Nx/17);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(approx,hamming(nsc),nov,nff, 'yaxis')
title('approx')
Nx = length(cd6);
nsc = floor(Nx/20);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(cd6,hamming(nsc),nov,nff,'yaxis')
title('Level 6')
Nx = length(cd5);
nsc = floor(Nx/30);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(cd5,hamming(nsc),nov,nff,'yaxis')
title('Level 5')
Nx = length(cd4);
nsc = floor(Nx/35);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(cd4,hamming(nsc),nov,nff,360,'yaxis')