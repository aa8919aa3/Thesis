# Tilted Washboard Potential Plot Generator

This script generates a visualization of the tilted washboard potential commonly used in the analysis of Josephson junctions and SQUID devices.

## Description

The tilted washboard potential describes the energy landscape of a Josephson junction under bias current. The potential has the mathematical form:

```
U(φ)/E_J = 1 - cos(φ) - γφ
```

Where:
- `φ` is the phase difference across the junction
- `E_J` is the Josephson energy
- `γ` is proportional to the normalized bias current `j`

## Usage

To generate the plot, simply run:

```bash
python3 generate_tilted_washboard_potential.py
```

This will create:
- `Images/tilted_washboard_potential.svg` - High-quality SVG plot
- `Images/tilted_washboard_potential.png` - PNG preview

## Requirements

- Python 3.6+
- numpy
- matplotlib

Install dependencies with:
```bash
pip install numpy matplotlib
```

## Plot Features

The generated plot includes:
- Four curves for different normalized bias currents: j = 0, 0.5, 0.8, 1.3
- Different line styles for each curve (solid, dashed, dash-dot, dotted)
- Gray dots marking local minima positions
- Annotations for plasma oscillation frequency (ωp) and barrier height (U₀)
- Proper mathematical notation and axis labels
- Phase range from 0 to 6π
- Potential range from -12.5 to 1.5 E_J

## Physics Background

The tilted washboard potential is fundamental to understanding:
- Josephson junction dynamics
- SQUID operation principles
- Phase slip phenomena
- Quantum tunneling in superconducting devices

For j = 0, the potential is a standard cosine washboard. As j increases, the linear tilt term becomes more significant, eventually eliminating the potential wells when j approaches the critical value.