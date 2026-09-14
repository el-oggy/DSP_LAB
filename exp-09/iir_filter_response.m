clc;
clearvars;
close all;

%% Output Directory Setup
output_dir = fullfile(fileparts(mfilename('fullpath')), 'outputs');
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

%% Preset Sequences
x = [1, 2, 3, 4, 5];
h = [2, 4, 6, 8, 2];

N1 = length(x);
N2 = length(h);
N = N1 + N2 - 1;

nx = 0:N1-1;
nh = 0:N2-1;
n = 0:N-1;

%% Compute Linear and Circular Convolutions
y_linear = conv(x, h);
y_circular = cconv(x, h, N);

disp('Input sequence x:'); disp(x);
disp('Input sequence h:'); disp(h);
disp('Linear convolution output (conv):'); disp(y_linear);
disp('Circular convolution output (cconv, N-point):'); disp(y_circular);

if all(round(y_linear) == round(y_circular))
    disp('Circular convolution matches with linear convolution!');
else
    disp('Results are different.');
end

%% Plotting the Comparison
fig = figure('Name', 'Linear vs Circular Convolution Verification', 'Position', [100, 100, 750, 850], 'Visible', 'off');

subplot(4,1,1);
stem(nx, x, 'b', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
xlabel('n');
ylabel('x(n)');
title('First Sequence x(n)');
grid on;

subplot(4,1,2);
stem(nh, h, 'r', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
xlabel('n');
ylabel('h(n)');
title('Second Sequence h(n)');
grid on;

subplot(4,1,3);
stem(n, y_linear, 'm', 'LineWidth', 1.5, 'MarkerFaceColor', 'm');
xlabel('n');
ylabel('y_{lin}(n)');
title('Linear Convolution y_{linear} = conv(x, h)');
grid on;

subplot(4,1,4);
stem(n, y_circular, 'k', 'LineWidth', 1.5, 'MarkerFaceColor', 'k');
xlabel('n');
ylabel('y_{circ}(n)');
title('Circular Convolution y_{circular} = cconv(x, h, N)');
grid on;

saveas(fig, fullfile(output_dir, 'linear_circular_comparison.png'));
close(fig);
fprintf('Saved figure to %s\n', fullfile(output_dir, 'linear_circular_comparison.png'));