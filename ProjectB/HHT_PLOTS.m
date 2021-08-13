function HHT_PLOTS(signal, Fs)
fs = Fs; %%Sampling frequency
sig = signal;
%% Creating noisy copies of the signal for Ensemble EMD
sig_n1 = sig + wgn(length(sig), 1, -30, 1, 1);
sig_n2 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n3 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n4 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n5 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n6 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n7 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n8 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n9 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n10 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n11 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n12 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n13 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n14 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n15 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n16 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n17 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n18 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n19 = sig + wgn(length(sig), 1, -30, 1, 3);
sig_n20 = sig + wgn(length(sig), 1, -30, 1, 3);
%% EMD
[imf, ~, ~] = emd(sig,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_1, ~, ~] = emd(sig_n1,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_2, ~, ~] = emd(sig_n2,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_3, ~, ~] = emd(sig_n3,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_4, ~, ~] = emd(sig_n4,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_5, ~, ~] = emd(sig_n5,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_6, ~, ~] = emd(sig_n6,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_7, ~, ~] = emd(sig_n7,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_8, ~, ~] = emd(sig_n8,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_9, ~, ~] = emd(sig_n9,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_10, ~, ~] = emd(sig_n10,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_11, ~, ~] = emd(sig_n11,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_12, ~, ~] = emd(sig_n12,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_13, ~, ~] = emd(sig_n13,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_14, ~, ~] = emd(sig_n14,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_15, ~, ~] = emd(sig_n15,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_16, ~, ~] = emd(sig_n16,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_17, ~, ~] = emd(sig_n17,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_18, ~, ~] = emd(sig_n18,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_19, ~, ~] = emd(sig_n19,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
[imf_20, ~, ~] = emd(sig_n20,'Interpolation','pchip', 'MaxNumIMF', 7, 'Display', 0);
%% Ensemble of the IMFs
imf_eemd = (imf_1 + imf_2 + imf_3 + imf_4 + imf_5 + imf_6 + imf_7 + imf_8 + imf_9 + imf_10 + imf_11 + imf_12 + imf_13 + imf_14 + imf_15 + imf_16 + imf_17 + imf_18 + imf_19 + imf_20)/20;
%% Plots
figure
subplot(2, 1, 1)
title('HHT - EMD');
hht(imf, fs)
subplot(2, 1, 2)
title('HHT - EEMD (Ensemble of noisy copies)');
hht(imf_eemd, fs)
figure
subplot(7, 1, 1)
hht(imf_eemd(:, 1), fs)
subplot(7, 1, 2)
hht(imf_eemd(:, 2), fs)
subplot(7, 1, 3)
hht(imf_eemd(:, 3), fs)
subplot(7, 1, 4)
hht(imf_eemd(:, 4), fs)
subplot(7, 1, 5)
hht(imf_eemd(:, 5), fs)
subplot(7, 1, 6)
hht(imf_eemd(:, 6), fs)
subplot(7, 1, 7)
hht(imf_eemd(:, 7), fs)
end