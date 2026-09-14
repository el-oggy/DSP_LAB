clc;
clearvars;
close all;

%% Output Directory Setup
output_dir = fullfile(fileparts(mfilename('fullpath')), 'outputs');
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

%% Define Parameters
fs = 1000;         % sampling frequency for continuous representation (Hz)
fs_dis = 50;       % discrete sampling frequency (Hz)
t_end = 2;         % duration in seconds
f = 5;             % signal frequency (Hz)
A = 1;             % signal amplitude
w = 2 * pi * f;    % angular frequency (rad/s)
N = 100;           % number of discrete samples
t = 0:1/fs:t_end;  % continuous time vector

%% Continuous Time Domain Waveforms
y_sin = A * sin(w * t);
y_cos = A * cos(w * t);
y_square = A * square(w * t);
y_triangular = A * sawtooth(w * t, 0.5);
y_sawtooth = A * sawtooth(w * t);

fig1 = figure('Name', 'Continuous Waveforms', 'Position', [100, 100, 800, 900], 'Visible', 'off');

subplot(5,1,1);
plot(t, y_sin, 'b', 'LineWidth', 1.5);
title('Continuous Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(5,1,2);
plot(t, y_cos, 'r', 'LineWidth', 1.5);
title('Continuous Cosine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(5,1,3);
plot(t, y_square, 'g', 'LineWidth', 1.5);
title('Continuous Square Wave');
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-1.5, 1.5]);
grid on;

subplot(5,1,4);
plot(t, y_triangular, 'm', 'LineWidth', 1.5);
title('Continuous Triangular Wave');
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-1.2, 1.2]);
grid on;

subplot(5,1,5);
plot(t, y_sawtooth, 'k', 'LineWidth', 1.5);
title('Continuous Sawtooth Wave');
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-1.2, 1.2]);
grid on;

saveas(fig1, fullfile(output_dir, 'continuous_waveforms.png'));

%% Discrete Time Domain Waveforms
T = (0:N-1) / fs_dis;
y_sin_dis = A * sin(w * T);
y_cos_dis = A * cos(w * T);
y_square_dis = A * square(w * T);
y_triangular_dis = A * sawtooth(w * T, 0.5);
y_sawtooth_dis = A * sawtooth(w * T);

fig2 = figure('Name', 'Discrete Waveforms', 'Position', [150, 150, 800, 900], 'Visible', 'off');

subplot(5,1,1);
stem(T, y_sin_dis, 'b', 'LineWidth', 1.2, 'MarkerFaceColor', 'b');
title('Discrete Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(5,1,2);
stem(T, y_cos_dis, 'r', 'LineWidth', 1.2, 'MarkerFaceColor', 'r');
title('Discrete Cosine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(5,1,3);
stem(T, y_square_dis, 'g', 'LineWidth', 1.2, 'MarkerFaceColor', 'g');
title('Discrete Square Wave');
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-1.5, 1.5]);
grid on;

subplot(5,1,4);
stem(T, y_triangular_dis, 'm', 'LineWidth', 1.2, 'MarkerFaceColor', 'm');
title('Discrete Triangular Wave');
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-1.2, 1.2]);
grid on;

subplot(5,1,5);
stem(T, y_sawtooth_dis, 'k', 'LineWidth', 1.2, 'MarkerFaceColor', 'k');
title('Discrete Sawtooth Wave');
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-1.2, 1.2]);
grid on;

saveas(fig2, fullfile(output_dir, 'discrete_waveforms.png'));
close([fig1, fig2]);
fprintf('Outputs saved successfully to %s\n', output_dir);
