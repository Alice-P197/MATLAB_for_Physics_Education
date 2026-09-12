# MATLAB for Physics Education

MATLAB scripts for physics education. This repository contains **238** MATLAB programs covering the standard introductory university physics curriculum, organized into 14 chapters from kinematics to quantum physics.

Each `.m` file implements a concrete physics model — a curve, surface, animation, or interactive demonstration of a physical law or phenomenon. All figures follow a unified style (white background, black **Times New Roman** font, size 16, box on).

## Table of Contents

| Chapter | Topic | Files |
| :--- | :--- | :---: |
| [01](第01章%20运动学) | Kinematics | 12 |
| [02](第02章%20牛顿运动定律) | Newton's Laws of Motion | 36 |
| [03](第03章%20运动的守恒定律) | Conservation Laws | 12 |
| [04](第04章%20刚体) | Rigid Body | 18 |
| [05](第05章%20振动) | Oscillations | 23 |
| [06](第06章%20波动) | Waves | 16 |
| [07](第07章%20光学) | Optics | 17 |
| [08](第08章%20气体分子运动论和热力学基础) | Kinetic Theory & Thermodynamics | 13 |
| [09](第09章%20静电场) | Electrostatics | 18 |
| [10](第10章%20恒磁场) | Steady Magnetic Field | 17 |
| [11](第11章%20导体电介质和磁介质) | Conductors, Dielectrics & Magnetic Media | 11 |
| [12](第12章%20变化的电磁场) | Time-Varying Electromagnetic Field | 15 |
| [13](第13章%20狭义相对论) | Special Relativity | 14 |
| [14](第14章%20量子物理基础) | Fundamentals of Quantum Physics | 16 |
| **Total** | | **238** |

## Getting Started

```matlab
> cd '第01章 运动学'
> projectile_range
```

Every model is a standalone `.m` script. Open the chapter folder, run the script name in MATLAB (no extra dependencies or toolboxes required for the core simulations), and a figure window will appear.

- **Analytic / ODE / Symbolic variants.** Several models are provided in multiple forms (e.g. `*_analytic`, `*_first_order_ode`, `*_second_order_ode`, `*_symbolic`). They solve the same physical problem by exact formulas, numerical integration of first-/second-order differential equations, and symbolic computation respectively — useful for comparing solution methods.
- **Interactive animations.** Models that use fast animation (e.g. wave formation, gas molecules, galvan board) loop until you press **ESC**.
- **Reference values.** Constants and initial conditions are given as reference values at the top of each script; edit them to explore different regimes.

## Content Highlights

- **Kinematics & Dynamics** — projectile range, helical motion, viscous drag, parachute fall, sphere sedimentation, chain sliding, inclined plane, boat with power-law resistance.
- **Conservation Laws** — elastic/inelastic collisions and energy-loss surfaces, rocket launch, satellite elliptical orbit, molecular potential.
- **Rigid Body** — moments of inertia, centers of mass, coaxial pulleys, falling rods, rolling rings, figure-skater rotation.
- **Oscillations & Waves** — SHM energy, simple pendulum (elliptic-integral exact period), damped and forced oscillation, beats, Lissajous figures, wave superposition, interference, standing waves, Huygens construction, Doppler effect, shock waves.
- **Optics** — coherent-light interference, single-slit / circular-aperture / grating diffraction, Rayleigh criterion, Newton's rings, film interference, polarization, Wollaston prism.
- **Thermodynamics** — Maxwell speed distribution, Boltzmann height distribution, Carnot/Otto/Diesel cycles, polytropic process.
- **Electromagnetism** — charge configurations and their fields, capacitors, solenoids, Helmholtz coils, displacement current, electromagnetic induction, mutual/self inductance, EM wave propagation.
- **Relativity & Quantum Mechanics** — time dilation, length contraction, Lorentz transforms, relativistic dynamics, Planck blackbody radiation, photoelectric effect, Compton scattering, hydrogen atom energy levels and probability distributions, square well, barrier tunneling.

## Directory Structure

```
MATLAB_for_Physics_Education/
├── 第01章 运动学/
├── 第02章 牛顿运动定律/
├── 第03章 运动的守恒定律/
├── 第04章 刚体/
├── 第05章 振动/
├── 第06章 波动/
├── 第07章 光学/
├── 第08章 气体分子运动论和热力学基础/
├── 第09章 静电场/
├── 第10章 恒磁场/
├── 第11章 导体电介质和磁介质/
├── 第12章 变化的电磁场/
├── 第13章 狭义相对论/
├── 第14章 量子物理基础/
└── README.md
```

## Notes

- File names are English snake_case and describe the modeled feature; comments inside the scripts are in Chinese.
- Fonts, colors, and line styles in every figure are standardized so all outputs look consistent.
- Check the `main` branch for the latest version.

## License

See the [LICENSE](LICENSE) file in the repository root.