<div align="center">

# 🌐 Digital Signal Processing (DSP) Lab

<a href="https://git.io/typing-svg"><img src="https://readme-typing-svg.herokuapp.com/?font=Fira+Code&weight=600&size=24&pause=1000&color=007acc&center=true&vCenter=true&width=600&lines=MATLAB+Implementations+%26+Visualizations;From+Signal+Generation+to+Advanced+Filtering;Publication-Ready+Code+Suite" alt="Typing SVG" /></a>

[![MATLAB](https://img.shields.io/badge/MATLAB-R2024b%2B-blue.svg?style=for-the-badge&logo=mathworks)](https://www.mathworks.com/products/matlab.html)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

*A comprehensive, simple, and clean repository of Digital Signal Processing (DSP) algorithms implemented in MATLAB. Every script is fully validated and equipped with automated batch-execution fallbacks.*

<br/>

</div>

---

<div align="center">
  
## 🌊 Signal Processing Animations

<table>
  <tr>
    <td align="center"><b>Continuous Wave Generation</b></td>
    <td align="center"><b>Discrete Signal Processing</b></td>
  </tr>
  <tr>
    <td><img src="./animations/continuous_wave.gif" alt="Continuous Wave" width="400"/></td>
    <td><img src="./animations/discrete_wave.gif" alt="Discrete Signal" width="400"/></td>
  </tr>
</table>

</div>

Mastering Digital Signal Processing requires a structured journey from basic continuous signals to complex frequency domain filtering. This repository is organized to guide you step-by-step through this transformation:

1. **Signals Foundations (`exp-01`, `exp-02`)**: Start by generating basic continuous and discrete waveforms. Understand the fundamental building blocks like unit impulses, steps, and ramps.
2. **Frequency Domain Analysis (`exp-03`, `exp-06`, `exp-07`)**: Transition from the time domain to the frequency domain using the Discrete-Time Fourier Transform (DTFT) and Discrete Fourier Transform (DFT). Visualize magnitude and phase spectra.
3. **System Operations (`exp-04`, `exp-05`)**: Learn how systems interact with signals through linear convolution, auto-correlation, and cross-correlation.
4. **Advanced Filtering & Reconstruction (`exp-08`, `exp-09`)**: Understand the equivalence of linear and circular convolution using the Fast Fourier Transform (FFT). Design filters and reconstruct signals efficiently.

---

## 🚀 How to Run

<details open>
<summary><b>1. One-Click Batch Execution (Recommended)</b></summary>
<br/>
To run every script and re-generate all output figures in their respective <code>outputs/</code> folders instantly:

```matlab
% In the repository root directory
run_all_experiments
```
Or from the system terminal (headless mode):
```bash
matlab -batch "run_all_experiments; exit;"
```
</details>

<details>
<summary><b>2. Running Individual Scripts</b></summary>
<br/>
Each script supports both interactive sequence entry and automated fallback defaults. For example:

```matlab
cd exp-04
convolution_linear
```
</details>

---

## 📑 Master File-to-Output Index

This index maps every specific **source file** to its mathematical function. (Note: Experimental output plots are saved locally when you run the scripts, but are ignored from version control to keep the repository lightweight.)

| 📁 Folder | 📄 Source File | 🧠 DSP Concept / Operation |
| :--- | :--- | :--- |
| **`exp-01/`** | [`signal_generation_basic.m`](./exp-01/signal_generation_basic.m) | Continuous & Discrete Waveform Synthesis |
| **`exp-02/`** | [`dtft_frequency_response.m`](./exp-02/dtft_frequency_response.m) | Elementary Discrete Signals (Loop Method) |
| **`exp-02/`** | [`dtft_plotting.m`](./exp-02/dtft_plotting.m) | Elementary Discrete Signals (Vector Method) |
| **`exp-03/`** | [`dtft_analysis_response.m`](./exp-03/dtft_analysis_response.m) | DTFT Magnitude & Phase Frequency Response |
| **`exp-04/`** | [`convolution_linear.m`](./exp-04/convolution_linear.m) | Linear Convolution via Nested Loops |
| **`exp-04/`** | [`convolution_linear_for_loop.m`](./exp-04/convolution_linear_for_loop.m) | Linear Convolution via MATLAB Built-in |
| **`exp-05/`** | [`auto_correlation.m`](./exp-05/auto_correlation.m) | Auto-Correlation & Signal Energy |
| **`exp-05/`** | [`cross_correlation.m`](./exp-05/cross_correlation.m) | Cross-Correlation between Sequences |
| **`exp-06/`** | [`dft_analysis.m`](./exp-06/dft_analysis.m) | Discrete Fourier Transform |
| **`exp-06/`** | [`dft_implementation.m`](./exp-06/dft_implementation.m) | Full DFT/IDFT Pipeline |
| **`exp-07/`** | [`dft_visualization.m`](./exp-07/dft_visualization.m) | $N$-Point DFT Magnitude & Phase Spectrum |
| **`exp-08/`** | [`fir_filter_design.m`](./exp-08/fir_filter_design.m) | Linear vs Circular Convolution via FFT |
| **`exp-09/`** | [`iir_filter_design.m`](./exp-09/iir_filter_design.m) | 8-Point FFT & Time Reconstruction |
| **`exp-09/`** | [`iir_filter_response.m`](./exp-09/iir_filter_response.m) | Multi-Point Linear vs Circular Verification |

---

## 🛠️ System Requirements
- **MATLAB**: R2018a or newer (Verified on **MATLAB R2024b**).
- **GNU Octave**: Compatible with GNU Octave 5.0+ (requires `signal` package for `sawtooth` / `square`).

---

## 📜 License
This project is open-source and available under the [MIT License](LICENSE).
