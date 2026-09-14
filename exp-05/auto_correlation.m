clc;
clearvars;
close all;

%% Output Directory Setup
output_dir = fullfile(fileparts(mfilename('fullpath')), 'outputs');
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

%% Declaring Sequences & Length (with automated fallback)
if ~exist('x_l', 'var') || isempty(x_l)
    try
        x_l = input('Enter your sequence x(l) [default: [1 2 3 4]]: ');
    catch
        x_l = [];
    end
    if isempty(x_l), x_l = [1, 2, 3, 4]; end
end

X_l = fliplr(x_l); % Time-reversed sequence x(-l)
N1 = length(x_l);
N2 = length(X_l);
N = N1 + N2 - 1;

%% Zero Padding
x_l_pad = [x_l, zeros(1, N - N1)];
X_l_pad = [X_l, zeros(1, N - N2)];
y_l = zeros(1, N);

%% Auto-Correlation Computation using Loop (Convolution with Time-Reversed Sequence)
for n = 1:N
    for L = 1:n
        if (n - L + 1 > 0) && (n - L + 1 <= N2)
            y_l(n) = y_l(n) + x_l_pad(L) * X_l_pad(n - L + 1);
        end
    end
end

fprintf('Input sequence x(n): '); disp(x_l);
fprintf('Time-reversed sequence x(-n): '); disp(X_l);
fprintf('Auto-correlation result r_xx: '); disp(y_l);

%% Plotting with Dynamic Lag Axis
lags = -(N1 - 1):1:(N1 - 1);
nx = 0:N1-1;

fig = figure('Name', 'Auto-Correlation Analysis', 'Position', [100, 100, 750, 700], 'Visible', 'off');

subplot(3,1,1);
stem(nx, x_l, 'b', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
xlabel('n');
ylabel('Amplitude');
title('Input Sequence x(n)');
grid on;

subplot(3,1,2);
stem(-fliplr(nx), X_l, 'r', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
xlabel('n');
ylabel('Amplitude');
title('Time-Reversed Sequence x(-n)');
grid on;

subplot(3,1,3);
stem(lags, y_l, 'k', 'LineWidth', 1.5, 'MarkerFaceColor', 'k');
xlabel('Lag (m)');
ylabel('Amplitude');
title('Auto-Correlation Sequence r_{xx}(m)');
grid on;

saveas(fig, fullfile(output_dir, 'auto_correlation.png'));
close(fig);
fprintf('Saved figure to %s\n', fullfile(output_dir, 'auto_correlation.png'));
