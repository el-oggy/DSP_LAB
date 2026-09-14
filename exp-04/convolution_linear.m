%% Convolution of Two Sequences using For Loop
clc; clearvars; close all;

%% Output Directory Setup
output_dir = fullfile(fileparts(mfilename('fullpath')), 'outputs');
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

%% Input sequences (supports interactive input with automated fallback)
if ~exist('x_n', 'var') || isempty(x_n)
    try
        x_n = input('Enter the first sequence x(n) [default: [1 2 3 4]]: ');
    catch
        x_n = [];
    end
    if isempty(x_n), x_n = [1, 2, 3, 4]; end
end

if ~exist('h_n', 'var') || isempty(h_n)
    try
        h_n = input('Enter the second sequence h(n) [default: [1 1 1]]: ');
    catch
        h_n = [];
    end
    if isempty(h_n), h_n = [1, 1, 1]; end
end

N1 = length(x_n);
N2 = length(h_n);
N = N1 + N2 - 1;

%% Zero padding
x_n_pad = [x_n, zeros(1, N - N1)];
h_n_pad = [h_n, zeros(1, N - N2)];
y_n = zeros(1, N);

%% Linear Convolution using Nested For Loops
for n = 1:N
    for k = 1:n
        if (n - k + 1 > 0) && (n - k + 1 <= N2)
            y_n(n) = y_n(n) + x_n_pad(k) * h_n(n - k + 1);
        end
    end
end

fprintf('Input sequence x(n): '); disp(x_n);
fprintf('Impulse response h(n): '); disp(h_n);
fprintf('Convolution output y(n) using for-loop: '); disp(y_n);

%% Plotting of the Sequences
n_axis = 0:1:N-1;
nx = 0:1:N1-1;
nh = 0:1:N2-1;

fig = figure('Name', 'Linear Convolution (For-Loop)', 'Position', [100, 100, 750, 700], 'Visible', 'off');

subplot(3,1,1);
stem(nx, x_n, 'b', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
title('Input Sequence x(n)'); 
xlabel('n'); 
ylabel('x(n)');
grid on;

subplot(3,1,2);
stem(nh, h_n, 'r', 'LineWidth', 1.5, 'MarkerFaceColor', 'r'); 
title('Impulse Response h(n)'); 
xlabel('n'); 
ylabel('h(n)');
grid on;

subplot(3,1,3);
stem(n_axis, y_n, 'k', 'LineWidth', 1.5, 'MarkerFaceColor', 'k'); 
title('Convolution Output y(n) = x(n) * h(n)'); 
xlabel('n'); 
ylabel('y(n)');
grid on;

saveas(fig, fullfile(output_dir, 'convolution_linear_for_loop.png'));
close(fig);
fprintf('Saved figure to %s\n', fullfile(output_dir, 'convolution_linear_for_loop.png'));
