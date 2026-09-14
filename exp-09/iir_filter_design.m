%% Program: 8-Point DFT and Circular Convolution using FFT & IFFT
clc; clearvars; close all;

%% Output Directory Setup
output_dir = fullfile(fileparts(mfilename('fullpath')), 'outputs');
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

%% Input Sequences (with automated fallback)
if ~exist('x1', 'var') || isempty(x1)
    try
        x1 = input('Enter the first sequence x1 [default: [1 2 3 4]]: ');
    catch
        x1 = [];
    end
    if isempty(x1), x1 = [1, 2, 3, 4]; end
end

if ~exist('x2', 'var') || isempty(x2)
    try
        x2 = input('Enter the second sequence x2 [default: [2 1 2 1]]: ');
    catch
        x2 = [];
    end
    if isempty(x2), x2 = [2, 1, 2, 1]; end
end

%% Length for 8-point FFT
N = 8;

%% Zero Padding to Length N = 8
x1_padded = [x1, zeros(1, N - length(x1))];
x2_padded = [x2, zeros(1, N - length(x2))];

%% Compute 8-Point FFT
X1 = fft(x1_padded, N);
X2 = fft(x2_padded, N);

%% Compute Circular Convolution in Frequency Domain
Y = X1 .* X2;

%% Compute Time-Domain Output using IFFT
y = ifft(Y, N);

%% Magnitude and Phase Calculations
mag_Y = abs(Y);
phase_Y = angle(Y);

%% Display Results in Command Window
disp('Input Sequence x1 (padded to 8):'); disp(x1_padded);
disp('Input Sequence x2 (padded to 8):'); disp(x2_padded);
disp('8-point FFT of x1:'); disp(X1);
disp('8-point FFT of x2:'); disp(X2);
disp('Product Y(k) = X1(k) .* X2(k):'); disp(Y);
disp('Circular Convolution via IFFT y[n]:'); disp(real(y));

%% Plotting Sequences and Spectra
n = 0:N-1;

fig = figure('Name', '8-Point FFT and Circular Convolution', 'Position', [100, 100, 800, 850], 'Visible', 'off');

subplot(4,1,1);
stem(n, x1_padded, 'b', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
title('Sequence x_1[n] (Padded to 8 points)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(4,1,2);
stem(n, x2_padded, 'r', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
title('Sequence x_2[n] (Padded to 8 points)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(4,1,3);
stem(n, mag_Y, 'm', 'LineWidth', 1.5, 'MarkerFaceColor', 'm');
title('Magnitude Spectrum |Y(k)| = |X_1(k) \cdot X_2(k)|');
xlabel('Frequency Index k'); ylabel('Magnitude');
grid on;

subplot(4,1,4);
stem(n, real(y), 'k', 'LineWidth', 1.5, 'MarkerFaceColor', 'k');
title('Circular Convolution Output y[n] via IFFT');
xlabel('n'); ylabel('Amplitude');
grid on;

saveas(fig, fullfile(output_dir, 'fft_8point.png'));
close(fig);
fprintf('Saved figure to %s\n', fullfile(output_dir, 'fft_8point.png'));
