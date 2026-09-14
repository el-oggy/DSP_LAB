# Experiment 07 — DFT Magnitude & Phase Visualization

This module computes and plots the **Magnitude Spectrum** $|X(k)|$ and **Phase Spectrum** $\angle X(k)$ of a discrete-time sequence using the Discrete Fourier Transform.

---

## 📄 Files in this Folder

| File Name | Description | Output Plot |
| :--- | :--- | :--- |
| [`dft_visualization.m`](./dft_visualization.m) | Computes $N$-point DFT and decomposes the complex frequency spectrum into magnitude and unwrapped phase responses | [`dft_visualization.png`](./outputs/dft_visualization.png) |

---

## 🔬 Mathematical Formulation

For an $N$-point real-valued discrete sequence $x[n]$:
$$X[k] = \sum_{n=0}^{N-1} x[n] e^{-j \frac{2\pi}{N} k n} = \mathrm{Re}\{X[k]\} + j\,\mathrm{Im}\{X[k]\}$$

1. **Magnitude Spectrum**:
   $$|X[k]| = \sqrt{\mathrm{Re}\{X[k]\}^2 + \mathrm{Im}\{X[k]\}^2}$$
   - Exhibits **even symmetry** around the Nyquist bin ($N/2$): $|X[k]| = |X[N-k]|$.
2. **Phase Spectrum**:
   $$\angle X[k] = \arctan\left(\frac{\mathrm{Im}\{X[k]\}}{\mathrm{Re}\{X[k]\}}\right)$$
   - Exhibits **odd symmetry**: $\angle X[k] = -\angle X[N-k]$.
3. **DC Component ($k = 0$)**:
   $$X[0] = \sum_{n=0}^{N-1} x[n]$$

---

## 📊 Respective Outputs

### Output from `dft_visualization.m`:
*Figure location: [`outputs/dft_visualization.png`](./outputs/dft_visualization.png)*

```
Input Sequence x1(n):
     1     2     3     4     4     3     2     1

DFT of X1(n):
  20.00 + 0.00i  -5.83 - 2.41i   0.00 - 0.00i  -0.17 - 0.41i   
   0.00 - 0.00i  -0.17 + 0.41i  -0.00 - 0.00i  -5.83 + 2.41i

Magnitude |X1(k)|:
   20.0000    6.3086    0.0000    0.4483    0.0000    0.4483    0.0000    6.3086

Phase in degrees (unwrapped):
         0  -157.50   -86.02  -112.50   -90.00  -247.50  -178.10  -202.50
```

![DFT Visualization Spectrum](./outputs/dft_visualization.png)

- **Subplot 1**: Symmetrical triangular input pulse sequence $x_1[n]$.
- **Subplot 2**: Discrete magnitude spectrum $|X_1(k)|$ highlighting the DC component at $k=0$ (amplitude 20) and even symmetry.
- **Subplot 3**: Phase spectrum in degrees showing phase transitions.

---

## 💻 How to Run
```matlab
% Inside exp-07 folder
dft_visualization
```
Outputs are automatically saved into the [`outputs/`](./outputs/) directory.