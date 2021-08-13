%% RR interval calculation using Hilbert Spectrum intensity
[hs, ~, ~] = hht(imf_eemd(:, 2), fs, 'FrequencyLimits', [0 30]);
win = 5; %% 15 sample window to scan for high intensity areas
intensity = zeros(1, floor(size(hs, 2)/win));
for iota = 1:1:(floor(size(hs, 2)/win))
intensity(iota) = sum(sum(hs(:, ((iota-1)*win +1):(iota*win)))); %% I sum the intensity of all the frequencies in a 15 time-sample area.
end
%% Pulse position calculation
pulse = zeros(size(intensity, 2), 1);
for j = 1:size(intensity, 2)
if intensity(j) > 0.007
pulse(j) = j*win - 7; %% Calculating the real position in the pure data. I pick the middle sample as the pulse position.
end
end
[~, ~, vals] = find(pulse); %% Keeping just the non-zero values of pulse