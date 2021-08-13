%Load
[sig100, Fs100, tm100] = rdsamp('mitdb/100', 1);
[sig113, Fs113, tm113] = rdsamp('mitdb/113', 1);
[sig115, Fs115, tm115] = rdsamp('mitdb/115', 1);
[sig117, Fs117, tm117] = rdsamp('mitdb/117', 1);
[sig119, Fs119, tm119] = rdsamp('mitdb/119', 1);
%STFT
%sig100 ????????
plot(tm100,sig100)
title('sig100')
figure
Nx = length(sig100);
nsc = floor(Nx/4000);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig100,hamming(nsc),nov,nff,360,'yaxis')
title('sig100')
%+-10sec
%sig100 ??? ?? 11:03 Normal sinus rhythm
plot(tm100(234889:242089),sig100(234889:242089));
title('11:03 Normal sinus rhythm')
figure
Nx = length(sig100(234889:242089));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig100(234889:242089),hamming(nsc),nov,nff,360,'yaxis')
title('11:03 Normal sinus rhythm')
%sig100 ??? ?? 25:13 PVC
plot(tm100(540644:547845),sig100(540644:547845));
title('25:13 PVC')
figure
Nx = length(sig100(540644:547845));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig100(540644:547845),hamming(nsc),nov,nff,360,'yaxis')
title('25:13 PVC')
%--------------------------------------------------------------
%sig100 ??? ?? 26:09 APCs
plot(tm100(560788:567989),sig100(560788:567989));
title('26:09 APCs')
figure
Nx = length(sig100(560788:567989));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig100(560788:567989),hamming(nsc),nov,nff,360,'yaxis')
title('26:09 APCs')
%----------------------------------------------------------------------
%sig113
plot(tm113,sig113)
figure
Nx = length(sig113);
nsc = floor(Nx/4000);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig113,hamming(nsc),nov,nff,'yaxis')
%sig113 ??? ?? 4:20 Moderate baseline wander
plot(tm113(89925:97126),sig113(89925:97126));
title('4:20 Moderate baseline wander')
figure
Nx = length(sig113(89925:97126));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig113(89925:97126),hamming(nsc),nov,nff,360,'yaxis')
title('4:20 Moderate baseline wander')
%sig113 ??? ?? 8:22 Aberrated APC
plot(tm113(176975:184176),sig113(176975:184176));
figure
Nx = length(sig113(176975:184176));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig113(176975:184176),hamming(nsc),nov,nff,360,'yaxis')
%sig113 ??? ?? 11:48 Sinus arrhythmia with variation in P-wave morphology
plot(tm113(251076:258277),sig113(251076:258277));
figure
Nx = length(sig113(251076:258277));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig113(251076:258277),hamming(nsc),nov,nff,360,'yaxis')
%sig113 ??? ?? 12:27 Sinus arrhythmia
plot(tm113(265105:272306),sig113(265105:272306));
figure
Nx = length(sig113(265105:272306));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig113(265105:272306),hamming(nsc),nov,nff,360,'yaxis')
%sig113 ??? ?? 22:10 Aberrated APC
plot(tm113(475217:482417),sig113(475217:482417));
figure
Nx = length(sig113(475217:482417));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig113(475217:482417),hamming(nsc),nov,nff,360,'yaxis')
%sig113 ??? ?? 29:01 Sinus arrhythmia
plot(tm113(623059:630259),sig113(623059:630259));
figure
Nx = length(sig113(623059:630259));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig113(623059:630259),hamming(nsc),nov,nff,360,'yaxis')
%----------------------------------------------------------------------
%sig115
plot(tm115,sig115)
figure
Nx = length(sig115);
nsc = floor(Nx/4000);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig115,hamming(nsc),nov,nff,360,'yaxis')
%sig115 ??? ?? 0:55 Normal sinus rhythm
plot(tm115(16184:23385),sig115(16184:23385));
figure
Nx = length(sig115(16184:23385));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig115(16184:23385),hamming(nsc),nov,nff,360,'yaxis')
%sig115 ??? ?? 3:22 Sinus arrhythmia
plot(tm115(69061:76262),sig115(69061:76262));
figure
Nx = length(sig115(69061:76262));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig115(69061:76262),hamming(nsc),nov,nff,360,'yaxis')
%sig115 ??? ?? 15:52 Baseline wander in lower signal
plot(tm115(338846:346046),sig115(338846:346046));
figure
Nx = length(sig115(338846:346046));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig115(338846:346046),hamming(nsc),nov,nff,360,'yaxis')
%sig115 ??? ?? 21:28 Noise in lower signal
plot(tm115(640400:647600),sig115(640400:647600));
figure
Nx = length(sig115(640400:647600));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig115(640400:647600),hamming(nsc),nov,nff,360,'yaxis')
%sig115 ??? ?? 27:05 Artifacts in lower signal
plot(tm115(580932:588133),sig115(580932:588133));
figure
Nx = length(sig115(580932:588133));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig115(580932:588133),hamming(nsc),nov,nff,360,'yaxis')
%----------------------------------------------------------------------
%sig117
plot(tm117,sig117)
figure
Nx = length(sig117);
nsc = floor(Nx/4000);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig117,hamming(nsc),nov,nff,360,'yaxis')
%sig117 ??? ?? 3:56 Normal sinus rhythm
plot(tm117(81292:88492),sig117(81292:88492));
figure
Nx = length(sig117(81292:88492));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig117(81292:88492),hamming(nsc),nov,nff,360,'yaxis')
%sig117 ??? ?? 11:58 Noise, APC
plot(tm117(254673:261874),sig117(254673:261874));
figure
Nx = length(sig117(254673:261874));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig117(254673:261874),hamming(nsc),nov,nff,360,'yaxis')
%----------------------------------------------------------------------
%sig119
plot(tm119,sig119)
figure
Nx = length(sig119);
nsc = floor(Nx/4000);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig119,hamming(nsc),nov,nff,360,'yaxis')
%sig119 ??? ?? 1:55 PVC
plot(tm119(37766:44967),sig119(37766:44967));
figure
Nx = length(sig119(37766:44967));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig119(37766:44967),hamming(nsc),nov,nff,360,'yaxis')
%sig119 ??? ?? 2:38 Ventricular trigeminy
plot(tm119(53234:60434),sig119(53234:60434));
title('2:38 Ventricular trigeminy')
figure
Nx = length(sig119(37766:44967));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig119(53234:60434),hamming(nsc),nov,nff,360,'yaxis')
%sig119 ??? ?? 4:51 Ventricular bigeminy
plot(tm119(101076:108277),sig119(101076:108277));
title('4:51 Ventricular bigeminy')
figure
Nx = length(sig119(101076:108277));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig119(101076:108277),hamming(nsc),nov,nff,360,'yaxis')
title('4:51 Ventricular bigeminy')
%sig119 ??? ?? 20:05 Noise
plot(tm119(429853:437054),sig119(429853:437054));
figure
Nx = length(sig119(429853:437054));
nsc = floor(Nx/50);
nov = floor(nsc/2);
nff = max(256,2^nextpow2(nsc));
spectrogram(sig119(429853:437054),hamming(nsc),nov,nff,360,'yaxis')