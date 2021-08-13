function Main
%Load
[sig100, Fs100, ~] = rdsamp('mitdb/100', 1);
[sig113, Fs113, ~] = rdsamp('mitdb/113', 1);
[sig115, Fs115, ~] = rdsamp('mitdb/115', 1);
[sig117, Fs117, ~] = rdsamp('mitdb/117', 1);
[sig119, Fs119, ~] = rdsamp('mitdb/119', 1);
%% Calculation
ann = rdann('mitdb/100', 'atr');
tic
HHT_RR(sig100, Fs100, ann);
toc
ann = rdann('mitdb/113', 'atr');
tic
HHT_RR(sig113, Fs113, ann);
toc
ann = rdann('mitdb/115', 'atr');
tic
HHT_RR(sig115, Fs115, ann);
toc
ann = rdann('mitdb/117', 'atr');
tic
HHT_RR(sig117, Fs117, ann);
toc
ann = rdann('mitdb/119', 'atr');
tic
HHT_RR(sig119, Fs119, ann);
toc
end