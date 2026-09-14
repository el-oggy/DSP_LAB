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

if ~exist('y_l', 'var') || isempty(y_l)
    try
        y_l = input('Enter your sequence y(l) [default: [1 2 1 2]]: ');
    catch
        y_l = [];
    end
    if isempty(y_l), y_l = [1, 2, 1, 2]; end
end

Y_rev = fliplr(y_l); % Time-reversed sequence y(-l)
N1 = length(x_l);
N2 = length(y_l);
N = N1 + N2 - 1;

%% Zero Padding
x_l_pad = [x_l, zeros(1, N - N1)];
y_rev_pad = [Y_rev, zeros(1, N - N2)];
r_xy = zeros(1, N);

%% Cross-Correlation Computation using Loop (x[n] conv y[-n])
for n = 1:N
    for L = 1:n
        if (n - L + 1 > 0) && (n - L + 1 <= N2)
            r_xy(n) = r_xy(n) + x_l_pad(L) * y_rev_pad(n - L + 1);
        end
    end
end

fprintf('Input sequence x(n): '); disp(x_l);
fprintf('Input sequence y(n): '); disp(y_l);
fprintf('Cross-correlation result r_xy: '); disp(r_xy);

%% Dynamic Lag Axis
lags = -(N2 - 1):1:(N1 - 1);
nx = 0:N1-1;
ny = 0:N2-1;

fig = figure('Name', 'Cross-Correlation Analysis', 'Position', [100, 100, 750, 700], 'Visible', 'off');

subplot(3,1,1);
stem(nx, x_l, 'b', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
xlabel('n');
ylabel('Amplitude');
title('Input Sequence x(n)');
grid on;

subplot(3,1,2);
stem(ny, y_l, 'r', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
xlabel('n');
ylabel('Amplitude');
title('Input Sequence y(n)');
grid on;

subplot(3,1,3);
stem(lags, r_xy, 'k', 'LineWidth', 1.5, 'MarkerFaceColor', 'k');
xlabel('Lag (m)');
ylabel('Amplitude');
title('Cross-Correlation Sequence r_{xy}(m)');
grid on;

saveas(fig, fullfile(output_dir, 'cross_correlation.png'));
close(fig);
fprintf('Saved figure to %s\n', fullfile(output_dir, 'cross_correlation.png'));
