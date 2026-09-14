function run_all_experiments()
%% Master Script: Run All DSP Lab Experiments & Generate Outputs
root_path = 'C:\Users\adars\OneDrive\Desktop\dsp lab';
fprintf('=====================================================\n');
fprintf('Starting Automated Execution of All DSP Lab Scripts\n');
fprintf('Root Directory: %s\n', root_path);
fprintf('=====================================================\n\n');

scripts = {
    fullfile(root_path, 'exp-01', 'signal_generation_basic.m'), ...
    fullfile(root_path, 'exp-02', 'dtft_frequency_response.m'), ...
    fullfile(root_path, 'exp-02', 'dtft_plotting.m'), ...
    fullfile(root_path, 'exp-03', 'dtft_analysis_response.m'), ...
    fullfile(root_path, 'exp-04', 'convolution_linear.m'), ...
    fullfile(root_path, 'exp-04', 'convolution_linear_for_loop.m'), ...
    fullfile(root_path, 'exp-05', 'auto_correlation.m'), ...
    fullfile(root_path, 'exp-05', 'cross_correlation.m'), ...
    fullfile(root_path, 'exp-06', 'dft_analysis.m'), ...
    fullfile(root_path, 'exp-06', 'dft_implementation.m'), ...
    fullfile(root_path, 'exp-07', 'dft_visualization.m'), ...
    fullfile(root_path, 'exp-08', 'fir_filter_design.m'), ...
    fullfile(root_path, 'exp-09', 'iir_filter_design.m'), ...
    fullfile(root_path, 'exp-09', 'iir_filter_response.m')
};

for i = 1:length(scripts)
    script_path = scripts{i};
    [s_dir, s_name, ~] = fileparts(script_path);
    [~, folder_name] = fileparts(s_dir);
    
    fprintf('--> Running [%d/%d]: %s / %s.m ...\n', i, length(scripts), folder_name, s_name);
    
    execute_script_isolated(script_path, s_dir);
    fprintf('    [FINISHED] %s.m\n\n', s_name);
end

fprintf('=====================================================\n');
fprintf('ALL OUTPUTS PROCESSED!\n');
fprintf('=====================================================\n');
end

function execute_script_isolated(script_path, target_dir)
    try
        cd(target_dir);
        run(script_path);
    catch ME
        fprintf('    [ERROR in %s]: %s\n', script_path, ME.message);
    end
    cd('C:\Users\adars\OneDrive\Desktop\dsp lab');
end
