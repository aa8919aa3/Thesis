#!/usr/bin/env python3
"""
Generate Tilted Washboard Potential Plot

This script creates a tilted washboard potential plot showing U(φ)/E_J vs φ
for different normalized bias currents j, similar to the theoretical analysis
of Josephson junctions and SQUID devices.

The potential has the form: U(φ)/E_J = 1 - cos(φ) - γφ
where γ is proportional to the normalized bias current j.
"""

import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import fsolve

def find_local_minima_near_2pi(j, scaling_constant=0.5):
    """
    Find local minima of the tilted washboard potential near φ=2π using first derivative.
    
    The potential is: U(φ)/E_J = 1 - cos(φ) - γφ where γ = scaling_constant * j
    First derivative: dU/dφ = sin(φ) - γ
    For minima: sin(φ) = γ and second derivative cos(φ) > 0
    """
    gamma = scaling_constant * j
    
    # Only find solutions if |gamma| <= 1 (otherwise no solutions exist for sin(φ) = γ)
    if abs(gamma) > 1:
        return []
    
    minima = []
    
    # Search for solutions near 2π
    # For φ near 2π, we look in the range [π, 3π] to capture minima around 2π
    search_ranges = [
        (1.5*np.pi, 2.5*np.pi),  # Around 2π
        (3.5*np.pi, 4.5*np.pi),  # Around 4π  
        (5.5*np.pi, 6.5*np.pi),  # Around 6π
    ]
    
    for start, end in search_ranges:
        if start > 6*np.pi:  # Don't search beyond our plot range
            break
            
        # Initial guess for root finding
        initial_guess = (start + end) / 2
        
        try:
            # Solve sin(φ) - γ = 0
            def derivative_eq(phi):
                return np.sin(phi) - gamma
            
            solution = fsolve(derivative_eq, initial_guess)[0]
            
            # Check if solution is in the search range and verify it's a minimum
            if start <= solution <= min(end, 6*np.pi):
                # Second derivative test: cos(φ) > 0 for minimum
                if np.cos(solution) > 0:
                    minima.append(solution)
        except:
            continue
    
    return minima

def main():
    # 1. Phase range and bias current settings
    phi = np.linspace(0, 6*np.pi, 1000)
    j_values = [0.0, 0.5, 0.8, 1.3]
    linestyles = ['-', '--', '-.', ':']
    scaling_constant = 0.5  # Scaling factor for tilt
    
    # 2. Create figure
    fig, ax = plt.subplots(figsize=(8, 4.5))
    
    # 3. Plot each potential curve
    for j, ls in zip(j_values, linestyles):
        U = 1 - np.cos(phi) - scaling_constant * j * phi  # Potential function
        ax.plot(phi, U, linestyle=ls, color='black', linewidth=2, label=f'j = {j}')
    
    # 4. Add gray dots at local minima positions calculated using first derivative
    for j in j_values:
        minima_positions = find_local_minima_near_2pi(j, scaling_constant)
        for pos in minima_positions:
            U_val = 1 - np.cos(pos) - scaling_constant * j * pos
            ax.plot(pos, U_val, 'o', color='grey', markersize=6)
    
    # 5. Add text labels for each curve
    annotations_phi = {0.0: 4.5*np.pi, 0.5: 4.6*np.pi, 0.8: 4.7*np.pi, 1.3: 3.2*np.pi}
    for j, x_pos in annotations_phi.items():
        if x_pos <= 6*np.pi:
            y_pos = 1 - np.cos(x_pos) - scaling_constant * j * x_pos
            ax.text(x_pos, y_pos + 0.3, f'$j = {j}$', fontsize=12, ha='center')
    
    # 6. Add plasma oscillation frequency arrow
    x_arrow_start, x_arrow_end = np.pi, 2.5*np.pi
    y_arrow = 1 - np.cos((x_arrow_start + x_arrow_end)/2)  # For j=0 case
    ax.annotate('', xy=(x_arrow_start, y_arrow + 0.5), xytext=(x_arrow_end, y_arrow + 0.5),
                arrowprops=dict(arrowstyle='<->', lw=1.5, color='black'))
    ax.text((x_arrow_start + x_arrow_end)/2, y_arrow + 0.8, r'$\omega_p$', 
            ha='center', fontsize=12)
    
    # 7. Add barrier height annotation (U0) for j=0.5 case
    phi_max, phi_min = np.pi, 2*np.pi
    U_max = 1 - np.cos(phi_max) - scaling_constant * 0.5 * phi_max
    U_min = 1 - np.cos(phi_min) - scaling_constant * 0.5 * phi_min
    mid_point = (phi_max + phi_min)/2
    ax.annotate('', xy=(mid_point, U_max), xytext=(mid_point, U_min),
                arrowprops=dict(arrowstyle='<->', lw=1.5, color='black'))
    ax.text(mid_point + 0.3, (U_max + U_min)/2, r'$U_0$', va='center', fontsize=12)
    
    # 8. Coordinate system and appearance settings
    ax.set_xticks([0, 2*np.pi, 4*np.pi, 6*np.pi])
    ax.set_xticklabels([r'$0$', r'$2\pi$', r'$4\pi$', r'$6\pi$'], fontsize=12)
    ax.set_yticks([0, -4, -8, -12])
    ax.set_yticklabels(['0', '-4', '-8', '-12'], fontsize=12)
    ax.set_xlabel(r'$\varphi$', fontsize=14)
    ax.set_ylabel(r'$U(\varphi)$ [$E_J$]', fontsize=14)
    ax.set_xlim(0, 6*np.pi)
    ax.set_ylim(-12.5, 1.5)
    
    # Remove top and right spines
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    
    # Position left spine at x=0 and bottom spine at y=0
    ax.spines['left'].set_position(('data', 0))
    ax.spines['bottom'].set_position(('data', 0))
    
    # Disable grid
    ax.grid(False)
    
    # 9. Save as SVG file
    fig.tight_layout()
    output_file = 'Images/tilted_washboard_potential.svg'
    fig.savefig(output_file, format='svg', bbox_inches='tight', dpi=300)
    print(f"Tilted washboard potential plot saved as: {output_file}")
    
    # Also save as PNG for preview
    fig.savefig('Images/tilted_washboard_potential.png', format='png', bbox_inches='tight', dpi=300)
    print(f"Preview saved as: Images/tilted_washboard_potential.png")
    
    plt.close()

if __name__ == "__main__":
    main()