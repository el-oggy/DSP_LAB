clc;
clearvars;
close all;

%% Output Directory Setup
output_dir = fullfile(fileparts(mfilename('fullpath')), 'outputs');
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

%% Input Sequence (with automated fallback)
if ~exist('x1_n', 'var') || isempty(x1_n)
    try
        x1_n = input('Enter the sequence x1(n) [default: [1 2 3 4 4 3 2 1]]: ');
    catch
        x1_n = [];
    end
    if isempty(x1_n), x1_n = [1, 2, 3, 4, 4, 3, 2, 1]; end
end

N1 = length(x1_n);
N = N1;

%% Zero Padding & Buffer Allocation
x1_pad = [x1_n, zeros(1, N - N1)];
X1_n = zeros(1, N);

%% Compute N-point DFT using definition
for k = 0:N-1
    for n = 0:N-1
       X1_n(k+1) = X1_n(k+1) + x1_pad(n+1) * exp((-1i * 2 * pi * k * n) / N);
    end
end

%% Magnitude and Phase Spectra
magnitude = abs(X1_n);
phase = angle(X1_n);
phase_unwrapped = unwrap(phase);
phase_deg = rad2deg(phase_unwrapped);

%% Plotting of the Sequence and Spectra
n_idx = 0:1:N-1;

fig = figure('Name', 'DFT Magnitude & Phase Visualization', 'Position', [100, 100, 750, 750], 'Visible', 'off');

subplot(3,1,1);
stem(n_idx, x1_n, 'b', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
title('Input Time Sequence x_1(n)'); 
xlabel('Sample index n'); 
ylabel('Amplitude');
grid on;

subplot(3,1,2);
stem(n_idx, magnitude, 'r', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
title('DFT Magnitude Spectrum |X_1(k)|');
xlabel('Frequency Index k');
ylabel('|X_1(k)|');
grid on;

subplot(3,1,3);
stem(n_idx, phase_deg, 'k', 'LineWidth', 1.5, 'MarkerFaceColor', 'k');
title('DFT Phase Spectrum \angle X_1(k) (Degrees)');
xlabel('Frequency Index k');
ylabel('Phase (\circ)');
grid on;

%% Display Results in Command Window
disp('Input Sequence x1(n):');
disp(x1_n);

disp('DFT of X1(n):');
disp(X1_n);

disp('Magnitude |X1(k)|:');
disp(magnitude);

disp('Phase in degrees (unwrapped):');
disp(phase_deg);

saveas(fig, fullfile(output_dir, 'dft_visualization.png'));
close(fig);
fprintf('Saved figure to %s\n', fullfile(output_dir, 'dft_visualization.png'));
