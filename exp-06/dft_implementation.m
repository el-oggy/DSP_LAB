clc;
clearvars;
close all;

%% Output Directory Setup
output_dir = fullfile(fileparts(mfilename('fullpath')), 'outputs');
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

%% Declaring Length & Sequences (with automated fallback)
if ~exist('x1_n', 'var') || isempty(x1_n)
    try
        x1_n = input('Enter the first sequence x1(n) [default: [1 2 2 1]]: ');
    catch
        x1_n = [];
    end
    if isempty(x1_n), x1_n = [1, 2, 2, 1]; end
end

if ~exist('x2_n', 'var') || isempty(x2_n)
    try
        x2_n = input('Enter the second sequence x2(n) [default: [1 2 3 4]]: ');
    catch
        x2_n = [];
    end
    if isempty(x2_n), x2_n = [1, 2, 3, 4]; end
end

N1 = length(x1_n);
N2 = length(x2_n);
N = max(N1, N2);

%% Zero Padding
x1_pad = [x1_n, zeros(1, N - N1)];
x2_pad = [x2_n, zeros(1, N - N2)];
X1_n = zeros(1, N);
X2_n = zeros(1, N);
Z_k = zeros(1, N);
X_n = zeros(1, N);

%% Compute DFT of x1(n) using definition
for k = 0:N-1
    for n = 0:N-1
       X1_n(k+1) = X1_n(k+1) + x1_pad(n+1) * exp((-1i * 2 * pi * k * n) / N);
    end
end

%% Compute DFT of x2(n) using definition
for k = 0:N-1
    for n = 0:N-1
        X2_n(k+1) = X2_n(k+1) + x2_pad(n+1) * exp((-1i * 2 * pi * k * n) / N);
    end
end

%% Frequency-Domain Multiplication: Z(k) = X1(k) * X2(k)
for n = 1:N
    Z_k(n) = X1_n(n) * X2_n(n);
end

%% IDFT to reconstruct circular convolution in time domain
for n = 0:N-1
    for k = 0:N-1
        X_n(n+1) = X_n(n+1) + Z_k(k+1) * exp(1i * 2 * pi * k * n / N);
    end
    X_n(n+1) = X_n(n+1) / N; % Normalize by N
end

fprintf('Sequence x1(n): '); disp(x1_n);
fprintf('Sequence x2(n): '); disp(x2_n);
fprintf('DFT X1(k): '); disp(X1_n);
fprintf('DFT X2(k): '); disp(X2_n);
fprintf('Product Z(k) = X1.*X2: '); disp(Z_k);
fprintf('IDFT Output (Circular Convolution): '); disp(real(X_n));

%% Plotting of the Sequences
n_axis = 0:1:N-1;

fig = figure('Name', 'DFT & IDFT Implementation', 'Position', [100, 100, 800, 850], 'Visible', 'off');

subplot(4,1,1);
stem(n_axis, abs(X1_n), 'b', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
title('|X_1(k)| - Magnitude of DFT of x_1(n)'); 
xlabel('Frequency Index k'); 
ylabel('|X_1(k)|');
grid on;

subplot(4,1,2);
stem(n_axis, abs(X2_n), 'r', 'LineWidth', 1.5, 'MarkerFaceColor', 'r'); 
title('|X_2(k)| - Magnitude of DFT of x_2(n)'); 
xlabel('Frequency Index k'); 
ylabel('|X_2(k)|');
grid on;

subplot(4,1,3);
stem(n_axis, abs(Z_k), 'm', 'LineWidth', 1.5, 'MarkerFaceColor', 'm'); 
title('|Z(k)| - Magnitude of Product X_1(k) \cdot X_2(k)'); 
xlabel('Frequency Index k'); 
ylabel('|Z(k)|');
grid on;

subplot(4,1,4);
stem(n_axis, real(X_n), 'k', 'LineWidth', 1.5, 'MarkerFaceColor', 'k'); 
title('IDFT Output: Circular Convolution x_1(n) \circledast x_2(n)'); 
xlabel('Sample Index n'); 
ylabel('x(n)');
grid on;

saveas(fig, fullfile(output_dir, 'dft_implementation.png'));
close(fig);
fprintf('Saved figure to %s\n', fullfile(output_dir, 'dft_implementation.png'));
