clc;
clearvars;
close all;

%% Output Directory Setup
output_dir = fullfile(fileparts(mfilename('fullpath')), 'outputs');
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

%% Input Sequences
x1 = [1, 1, 2, 2];
x2 = [1, 2, 3, 4];

N1 = length(x1);
N2 = length(x2);
N = max(N1, N2);

% Zero padding to same length
x1_pad = [x1, zeros(1, N - N1)];
x2_pad = [x2, zeros(1, N - N2)];

X1 = zeros(1, N);
X2 = zeros(1, N);

%% DFT of x1
for k = 0:N-1
    for n = 0:N-1
       X1(k+1) = X1(k+1) + x1_pad(n+1) * exp((-1i * 2 * pi * k * n) / N);
    end
end

%% DFT of x2
for k = 0:N-1
    for n = 0:N-1
        X2(k+1) = X2(k+1) + x2_pad(n+1) * exp((-1i * 2 * pi * k * n) / N);
    end
end

%% Element-wise Multiplication in Frequency Domain: Z1(k) = X1(k) .* X2(k)
z1 = X1 .* X2;

fprintf('Sequence x1: '); disp(x1);
fprintf('Sequence x2: '); disp(x2);
fprintf('DFT X1(k): '); disp(X1);
fprintf('DFT X2(k): '); disp(X2);
fprintf('Product Z1(k) = X1(k) .* X2(k): '); disp(z1);

%% Plotting
n = 0:1:N-1;

fig = figure('Name', 'DFT Analysis (Frequency Multiplication)', 'Position', [100, 100, 750, 700], 'Visible', 'off');

subplot(3,1,1);
stem(n, x1_pad, 'b', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
xlabel('n');
ylabel('Amplitude');
title('Input Sequence x_1(n)');
grid on;

subplot(3,1,2);
stem(n, x2_pad, 'r', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
xlabel('n');
ylabel('Amplitude');
title('Input Sequence x_2(n)');
grid on;

subplot(3,1,3);
stem(n, abs(z1), 'k', 'LineWidth', 1.5, 'MarkerFaceColor', 'k');
xlabel('Frequency Index k');
ylabel('Magnitude');
title('DFT Product Magnitude |Z_1(k)| = |X_1(k) \cdot X_2(k)|');
grid on;

saveas(fig, fullfile(output_dir, 'dft_analysis.png'));
close(fig);
fprintf('Saved figure to %s\n', fullfile(output_dir, 'dft_analysis.png'));
