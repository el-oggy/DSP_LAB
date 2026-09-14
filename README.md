# Digital Signal Processing (DSP) Lab — MATLAB Implementations & Outputs

[![MATLAB](https://img.shields.io/badge/MATLAB-R2024b%2B-blue.svg)](https://www.mathworks.com/products/matlab.html)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://img.shields.io/badge/Execution-Verified%2014%2F14-brightgreen.svg)]()
[![Outputs Generated](https://img.shields.io/badge/Artifacts-15%20Plots%20Saved-success.svg)]()

A comprehensive, publication-ready repository of **Digital Signal Processing (DSP)** algorithms implemented in MATLAB. Every script is fully validated, equipped with automated batch-execution fallbacks, and paired with high-resolution visual plots aligned directly in its respective `outputs/` folder.

---

## 📑 Master File-to-Output Index

Rather than generic experiment numbers, this index maps every specific **source file**, its mathematical function, and its **respective generated output plot**:

| Folder | Source File Name | DSP Concept / Operation | Test Sequence / Parameters | Respective Output File |
| :--- | :--- | :--- | :--- | :--- |
| **`exp-01/`** | [`signal_generation_basic.m`](./exp-01/signal_generation_basic.m) | Continuous & Discrete Waveform Synthesis (Sine, Cos, Square, Triangular, Sawtooth) | $f = 5\text{ Hz}$, $f_s = 1000\text{ Hz}$, $f_{s,\mathrm{dis}} = 50\text{ Hz}$, $A=1$ | [`continuous_waveforms.png`](./exp-01/outputs/continuous_waveforms.png)<br>[`discrete_waveforms.png`](./exp-01/outputs/discrete_waveforms.png) |
| **`exp-02/`** | [`dtft_frequency_response.m`](./exp-02/dtft_frequency_response.m) | Elementary Discrete Signals ($u[n], \delta[n], r[n]$) via Loop Method | $n \in [-10, 10]$, $L = 21$ | [`dtft_frequency_response_signals.png`](./exp-02/outputs/dtft_frequency_response_signals.png) |
| **`exp-02/`** | [`dtft_plotting.m`](./exp-02/dtft_plotting.m) | Elementary Discrete Signals ($u[n], \delta[n], r[n]$) via Vector Concatenation | $n \in [-5, 5]$, $L = 11$ | [`dtft_plotting_signals.png`](./exp-02/outputs/dtft_plotting_signals.png) |
| **`exp-03/`** | [`dtft_analysis_response.m`](./exp-03/dtft_analysis_response.m) | Discrete-Time Fourier Transform (DTFT) Magnitude & Phase Frequency Response | $x[n] = (0.5)^n u[n]$, $\omega \in [-\pi, \pi]$ | [`dtft_magnitude_phase_response.png`](./exp-03/outputs/dtft_magnitude_phase_response.png) |
| **`exp-04/`** | [`convolution_linear.m`](./exp-04/convolution_linear.m) | Linear Convolution via Algorithmic Nested Loops | $x[n] = [1, 2, 3, 4]$, $h[n] = [1, 1, 1]$ | [`convolution_linear_for_loop.png`](./exp-04/outputs/convolution_linear_for_loop.png) |
| **`exp-04/`** | [`convolution_linear_for_loop.m`](./exp-04/convolution_linear_for_loop.m) | Linear Convolution via MATLAB Built-in `conv()` | $x[n] = [1, 2, 3, 4]$, $h[n] = [1, 1, 1]$ | [`convolution_builtin.png`](./exp-04/outputs/convolution_builtin.png) |
| **`exp-05/`** | [`auto_correlation.m`](./exp-05/auto_correlation.m) | Auto-Correlation $r_{xx}[m] = x[m] * x[-m]$ & Signal Energy Verification | $x[l] = [1, 2, 3, 4]$, Lags $m \in [-3, 3]$ | [`auto_correlation.png`](./exp-05/outputs/auto_correlation.png) |
| **`exp-05/`** | [`cross_correlation.m`](./exp-05/cross_correlation.m) | Cross-Correlation $r_{xy}[m] = x[m] * y[-m]$ between Two Distinct Sequences | $x[l] = [1, 2, 3, 4]$, $y[l] = [1, 2, 1, 2]$ | [`cross_correlation.png`](./exp-05/outputs/cross_correlation.png) |
| **`exp-06/`** | [`dft_analysis.m`](./exp-06/dft_analysis.m) | Discrete Fourier Transform & Spectral Multiplication $Z_1(k) = X_1(k) \cdot X_2(k)$ | $x_1 = [1, 1, 2, 2]$, $x_2 = [1, 2, 3, 4]$ | [`dft_analysis.png`](./exp-06/outputs/dft_analysis.png) |
| **`exp-06/`** | [`dft_implementation.m`](./exp-06/dft_implementation.m) | Full DFT / IDFT Pipeline & Circular Convolution Synthesis | $x_1 = [1, 2, 2, 1]$, $x_2 = [1, 2, 3, 4]$ | [`dft_implementation.png`](./exp-06/outputs/dft_implementation.png) |
| **`exp-07/`** | [`dft_visualization.m`](./exp-07/dft_visualization.m) | $N$-Point DFT Magnitude Spectrum $\|X(k)\|$ & Unwrapped Phase Spectrum $\angle X(k)$ | $x_1 = [1, 2, 3, 4, 4, 3, 2, 1]$, $N=8$ | [`dft_visualization.png`](./exp-07/outputs/dft_visualization.png) |
| **`exp-08/`** | [`fir_filter_design.m`](./exp-08/fir_filter_design.m) | Equivalence of Linear Convolution, $N$-point Circular Convolution, & FFT/IFFT | $x = [1, 2, 3, 4]$, $h = [1, 1, 1]$, $N=6$ | [`linear_vs_circular_convolution.png`](./exp-08/outputs/linear_vs_circular_convolution.png) |
| **`exp-09/`** | [`iir_filter_design.m`](./exp-09/iir_filter_design.m) | 8-Point FFT, Product Spectrum, & Time Reconstruction via IFFT | $x_1 = [1, 2, 3, 4, 0, 0, 0, 0]$, $x_2 = [2, 1, 2, 1, 0, 0, 0, 0]$ | [`fft_8point.png`](./exp-09/outputs/fft_8point.png) |
| **`exp-09/`** | [`iir_filter_response.m`](./exp-09/iir_filter_response.m) | Linear vs Circular Convolution Verification for Multi-Point Sequences | $x = [1, 2, 3, 4, 5]$, $h = [2, 4, 6, 8, 2]$, $N=9$ | [`linear_circular_comparison.png`](./exp-09/outputs/linear_circular_comparison.png) |

---

## 📁 Repository Structure

```
dsp-lab/
├── README.md                               ← Master index & GitHub overview
├── run_all_experiments.m                   ← One-click runner to regenerate all outputs
├── exp-01/                                 ← Waveform Generation
│   ├── signal_generation_basic.m
│   ├── outputs/
│   │   ├── continuous_waveforms.png
│   │   └── discrete_waveforms.png
│   └── README.md
├── exp-02/                                 ← Elementary Discrete Signals
│   ├── dtft_frequency_response.m
│   ├── dtft_plotting.m
│   ├── outputs/
│   │   ├── dtft_frequency_response_signals.png
│   │   └── dtft_plotting_signals.png
│   └── README.md
├── exp-03/                                 ← Discrete-Time Fourier Transform (DTFT)
│   ├── dtft_analysis_response.m
│   ├── outputs/
│   │   └── dtft_magnitude_phase_response.png
│   └── README.md
├── exp-04/                                 ← Linear Convolution
│   ├── convolution_linear.m
│   ├── convolution_linear_for_loop.m
│   ├── outputs/
│   │   ├── convolution_linear_for_loop.png
│   │   └── convolution_builtin.png
│   └── README.md
├── exp-05/                                 ← Auto & Cross Correlation
│   ├── auto_correlation.m
│   ├── cross_correlation.m
│   ├── outputs/
│   │   ├── auto_correlation.png
│   │   └── cross_correlation.png
│   └── README.md
├── exp-06/                                 ← DFT & Circular Convolution via IDFT
│   ├── dft_analysis.m
│   ├── dft_implementation.m
│   ├── outputs/
│   │   ├── dft_analysis.png
│   │   └── dft_implementation.png
│   └── README.md
├── exp-07/                                 ← DFT Magnitude & Phase Spectrum
│   ├── dft_visualization.m
│   ├── outputs/
│   │   └── dft_visualization.png
│   └── README.md
├── exp-08/                                 ← Linear vs Circular Convolution via FFT
│   ├── fir_filter_design.m
│   ├── outputs/
│   │   └── linear_vs_circular_convolution.png
│   └── README.md
└── exp-09/                                 ← 8-Point FFT/IFFT & Convolution Comparison
    ├── iir_filter_design.m
    ├── iir_filter_response.m
    ├── outputs/
    │   ├── fft_8point.png
    │   └── linear_circular_comparison.png
    └── README.md
```

---

## 🚀 How to Run

### 1. One-Click Batch Execution (All Experiments)
To run every script and re-generate all output figures in their respective `outputs/` folders:
```matlab
% In the repository root directory
run_all_experiments
```
Or from the system terminal:
```bash
matlab -batch "run_all_experiments; exit;"
```

### 2. Running Individual Scripts
Each script supports both interactive sequence entry and automated fallback defaults:
```matlab
cd exp-04
convolution_linear
```

---

## 🖼️ Visual Gallery of Selected Generated Outputs

| Continuous Waveforms (`exp-01`) | Linear Convolution (`exp-04`) |
| :---: | :---: |
| ![Continuous](./exp-01/outputs/continuous_waveforms.png) | ![Linear Conv](./exp-04/outputs/convolution_builtin.png) |

| Auto-Correlation Analysis (`exp-05`) | DFT & IDFT Implementation (`exp-06`) |
| :---: | :---: |
| ![Auto-Correlation](./exp-05/outputs/auto_correlation.png) | ![DFT IDFT](./exp-06/outputs/dft_implementation.png) |

| DFT Magnitude & Phase Spectra (`exp-07`) | Linear vs Circular Convolution (`exp-08`) |
| :---: | :---: |
| ![DFT Spectra](./exp-07/outputs/dft_visualization.png) | ![Linear vs Circular](./exp-08/outputs/linear_vs_circular_convolution.png) |

---

## 🛠️ System Requirements
- **MATLAB**: R2018a or newer (Verified on **MATLAB R2024b**).
- **GNU Octave**: Compatible with GNU Octave 5.0+ (requires `signal` package for `sawtooth` / `square`).

---

## 📜 License
This project is open-source and available under the [MIT License](LICENSE).
