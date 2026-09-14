clc;
clearvars;
close all;

%% Output Directory Setup
output_dir = fullfile(fileparts(mfilename('fullpath')), 'outputs');
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

%% Define Time Indices
n = -5:1:5;

%% Unit Step (Vector Concatenation Method)
u = [zeros(1,5), ones(1,6)];

%% Unit Impulse (Vector Concatenation Method)
d = [zeros(1,5), ones(1,1), zeros(1,5)];

%% Unit Ramp (Vector Concatenation Method)
r = [zeros(1,6), 1:5];

%% Figure Properties & Plotting
fig = figure('Name', 'Elementary Discrete Signals (Vector Method)', 'Position', [100, 100, 750, 700], 'Visible', 'off');

subplot(3,1,1);
stem(n, u, 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
title('Unit Step Sequence u[n] (Vector Method)');
xlabel('n \rightarrow');
ylabel('Amplitude');
ylim([-0.2, 1.2]);
grid on;

subplot(3,1,2);
stem(n, d, 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
title('Unit Impulse Sequence \delta[n] (Vector Method)');
xlabel('n \rightarrow');
ylabel('Amplitude');
ylim([-0.2, 1.2]);
grid on;

subplot(3,1,3);
stem(n, r, 'LineWidth', 1.5, 'MarkerFaceColor', 'm');
title('Unit Ramp Sequence r[n] (Vector Method)');
xlabel('n \rightarrow');
ylabel('Amplitude');
ylim([-0.5, 5.5]);
grid on;

saveas(fig, fullfile(output_dir, 'dtft_plotting_signals.png'));
close(fig);
fprintf('Saved figure to %s\n', fullfile(output_dir, 'dtft_plotting_signals.png'));
