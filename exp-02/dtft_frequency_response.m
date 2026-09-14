clc;
clearvars;
close all;

%% Output Directory Setup
output_dir = fullfile(fileparts(mfilename('fullpath')), 'outputs');
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

%% Define Parameters
n1 = -10;
n2 = 10;
N = n1:1:n2;
L = n2 - n1 + 1;

%% Unit Step Sequence (Loop Method)
m = -10;
u = zeros(1, L);
for i = 1:L
    if m >= 0
        u(i) = 1;
    else
        u(i) = 0;    
    end
    m = m + 1;
end

%% Unit Impulse Sequence (Loop Method)
m = -10;
d = zeros(1, L);
for i = 1:L
    if m == 0
        d(i) = 1;
    else
        d(i) = 0;
    end
    m = m + 1;
end

%% Unit Ramp Sequence (Loop Method)
m = -10;
r = zeros(1, L);
for i = 1:L
    if m >= 0
        r(i) = m;
    else
        r(i) = 0;
    end
    m = m + 1;
end

%% Graphical Representation
fig = figure('Name', 'Elementary Discrete Signals (For-Loop Method)', 'Position', [100, 100, 750, 700], 'Visible', 'off');

subplot(3,1,1);
stem(N, u, 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
title('Unit Step Sequence u[n]');
xlabel('n \rightarrow');
ylabel('Amplitude');
ylim([-0.2, 1.2]);
grid on;

subplot(3,1,2);
stem(N, d, 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
title('Unit Impulse Sequence \delta[n]');
xlabel('n \rightarrow');
ylabel('Amplitude');
ylim([-0.2, 1.2]);
grid on;

subplot(3,1,3);
stem(N, r, 'LineWidth', 1.5, 'MarkerFaceColor', 'm');
title('Unit Ramp Sequence r[n]');
xlabel('n \rightarrow');
ylabel('Amplitude');
ylim([-0.5, 11]);
grid on;

saveas(fig, fullfile(output_dir, 'dtft_frequency_response_signals.png'));
close(fig);
fprintf('Saved figure to %s\n', fullfile(output_dir, 'dtft_frequency_response_signals.png'));