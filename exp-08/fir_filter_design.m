clc;
clearvars;
close all;

%% Output Directory Setup
output_dir = fullfile(fileparts(mfilename('fullpath')), 'outputs');
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

%% Define Input Sequences (with automated fallback)
if ~exist('x', 'var') || isempty(x)
    try
        x = input('Enter the first sequence x(n) [default: [1 2 3 4]]: ');
    catch
        x = [];
    end
    if isempty(x), x = [1, 2, 3, 4]; end
end

if ~exist('h', 'var') || isempty(h)
    try
        h = input('Enter the second sequence h(n) [default: [1 1 1]]: ');
    catch
        h = [];
    end
    if isempty(h), h = [1, 1, 1]; end
end

N1 = length(x);
N2 = length(h);
N = N1 + N2 - 1;

%% Linear and Circular Convolution Computation
Y_linear = conv(x, h);
Y_circular = cconv(x, h, N);

%% Circular Convolution using FFT and IFFT
x_pad = [x, zeros(1, N - length(x))];
h_pad = [h, zeros(1, N - length(h))];
Y_fft = ifft(fft(x_pad) .* fft(h_pad));

%% Verification Check
if all(round(Y_linear, 5) == round(Y_circular, 5))
    disp('Circular convolution (N-padded) matches with linear convolution.');
else
    disp('Results differ.');
end

%% Display Results
disp('Input Sequence x(n):'); disp(x);
disp('Impulse Response h(n):'); disp(h);
disp('Linear Convolution (conv):'); disp(Y_linear);
disp('Circular Convolution (cconv):'); disp(Y_circular);
disp('Circular Convolution via FFT/IFFT:'); disp(real(Y_fft));

%% Plotting the Comparison
n = 0:N-1;

fig = figure('Name', 'Linear vs Circular Convolution Comparison', 'Position', [100, 100, 750, 750], 'Visible', 'off');

subplot(3,1,1);
stem(n, Y_linear, 'b', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
title('Linear Convolution: Y_{linear} = conv(x, h)');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
stem(n, abs(Y_circular), 'r', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
title('Circular Convolution (N-point): Y_{circular} = cconv(x, h, N)');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(3,1,3);
stem(n, real(Y_fft), 'k', 'LineWidth', 1.5, 'MarkerFaceColor', 'k');
title('Circular Convolution via FFT/IFFT: ifft(fft(x) \cdot fft(h))');
xlabel('n');
ylabel('Amplitude');
grid on;

saveas(fig, fullfile(output_dir, 'linear_vs_circular_convolution.png'));
close(fig);
fprintf('Saved figure to %s\n', fullfile(output_dir, 'linear_vs_circular_convolution.png'));
