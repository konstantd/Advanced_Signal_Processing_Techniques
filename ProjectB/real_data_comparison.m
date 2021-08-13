%% Real data comparison
for f = 1: size(vals, 1) - 1
if abs(vals(f+1) - vals(f)) < 20
vals(f) = 0;
end
end
[~, ~, real_vals] = find(vals);
diff = zeros(size(real_vals, 1), 1);
detected_pulses = size(real_vals, 1)
orio = 0;
if size(real_vals, 1) < size(ann, 1)
orio = size(real_vals, 1);
else
orio = size(ann, 1);
end
correct_pulses = 0;
for kappa = 1:orio
if real_vals(kappa) ~= 0
[value, ~] = min(abs(real_vals - ann(kappa)));
if value < 20
diff(kappa) = value;
correct_pulses = correct_pulses + 1;
end
else
[value, ~] = min(abs(an - real_vals(kappa + 1)));
if value < 20
diff(kappa) = value;
correct_pulses = correct_pulses + 1;
end
end
end
correct_pulses
MEAN = mean(diff)
%%RMSE AN BRIKA TA IDIA!!
RMSE=sqrt(mean(diff.^2))