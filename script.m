[y, fs] = wavread('samples/original/1.wav');length(y)t = linspace(0, length(y)/fs, length(y));figure; plot(t, y);xlabel("Time"); ylabel("Amplitude");title("Original Audio Signal in Time Domain");N = length(y);f = linspace(0, fs, N);X = abs(fft(y, N));figure; plot(f(1:N/2), X(1:N/2));xlabel("Frequency"); ylabel("Amplitude");title("Original Audio Signal in Frequency Domain");%%for i = 1:N%  if X(i) <= mean_val%    X(i) = 0;%  endif%endfor%%X(50000:N) *= 1/7;X(200:1400) *= 1/1000;figure; plot(f(1:N/2), X(1:N/2));xlabel("Frequency"); ylabel("Amplitude");title("Modified Audio Signal in Frequency Domain");y_prime = ifft(X);t = linspace(0, length(y_prime)/fs, length(y_prime));figure; plot(t, y_prime);xlabel("Time"); ylabel("Amplitude");title("Modified Audio Signal in Time Domain");wavwrite(y_prime, fs, 'samples/clean/1.wav');