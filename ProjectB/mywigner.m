function W = mywigner(Ex)
if (size(Ex, 2)-1)
error('E(x) must be a column vector');
end
N = length(Ex); % Get length of vector
x = ifftshift(((0:N-1)'-N/2)*2*pi/(N-1)); % Generate linear vector
X = (0:N-1)-N/2;
EX1 = ifft( (fft(Ex)*ones(1,N)).*exp( 1i*x*X/2 )); % +ve shift
EX2 = ifft( (fft(Ex)*ones(1,N)).*exp( -1i*x*X/2 )); % -ve shift
W = real(fftshift(fft(fftshift(EX1.*conj(EX2), 2), [], 2), 2)); % Wigner function
end