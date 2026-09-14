clc;
clearvars;
close all;

%% Output Directory Setup
output_dir = fullfile(fileparts(mfilename('fullpath')), 'outputs');
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

%% Define Input Sequence x[n] = a^n * u[n]
a = 0.5;
N = 16;
n = 0:N-1;
x = a.^n;

%% Compute Discrete-Time Fourier Transform (DTFT)
% X(e^jw) = sum_{n} x[n] * exp(-j * w * n)
K = 500;
w = linspace(-pi, pi, K);
X = zeros(1, K);

for k = 1:K
    X(k) = sum(x .* exp(-1i * w(k) * n));
end

mag_X = abs(X);
phase_X = angle(X);

%% Plotting DTFT Analysis
fig = figure('Name', 'DTFT Analysis & Frequency Response', 'Position', [100, 100, 800, 750], 'Visible', 'off');

subplot(3,1,1);
stem(n, x, 'b', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
title('Input Sequence x[n] = (0.5)^n u[n]');
xlabel('Sample index n');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
plot(w/pi, mag_X, 'r', 'LineWidth', 2);
title('DTFT Magnitude Spectrum |X(e^{j\omega})|');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude');
grid on;

subplot(3,1,3);
plot(w/pi, phase_X, 'k', 'LineWidth', 2);
title('DTFT Phase Spectrum \angle X(e^{j\omega})');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Phase (radians)');
grid on;

saveas(fig, fullfile(output_dir, 'dtft_magnitude_phase_response.png'));
close(fig);
fprintf('Saved figure to %s\n', fullfile(output_dir, 'dtft_magnitude_phase_response.png'));
