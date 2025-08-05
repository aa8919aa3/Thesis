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
from matplotlib.patches import FancyArrowPatch
from matplotlib.patches import ConnectionPatch
from matplotlib.path import Path
from matplotlib.patches import PathPatch
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

def find_local_maxima_near_3pi(j, scaling_constant=0.5):
    """
    Find local maxima of the tilted washboard potential near φ=3π using first derivative.
    
    For maxima: sin(φ) = γ and second derivative cos(φ) < 0
    """
    gamma = scaling_constant * j
    
    # Only find solutions if |gamma| <= 1
    if abs(gamma) > 1:
        return []
    
    maxima = []
    
    # Search for solutions near 3π
    search_ranges = [
        (2.5*np.pi, 3.5*np.pi),  # Around 3π
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
            
            # Check if solution is in the search range and verify it's a maximum
            if start <= solution <= min(end, 6*np.pi):
                # Second derivative test: cos(φ) < 0 for maximum
                if np.cos(solution) < 0:
                    maxima.append(solution)
        except:
            continue
    
    return maxima

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
    
    # 6. Add plasma oscillation frequency arrow (enhanced U-shaped double arrow at j=0 curve near φ=2π)
    # For j=0, the minimum is exactly at φ=2π with U=0
    phi_center = 2*np.pi
    U_center = 0  # For j=0 case
    # Create enhanced U-shaped arrow showing oscillation around the minimum
    delta_phi = 0.28  # Width of the U-shape
    delta_U = 0.75    # Height of the U-shape
    
    # Create a smooth U-shaped curve using parametric approach
    t = np.linspace(0, np.pi, 50)  # Parameter for creating smooth U-curve
    # U-shaped path: starts low, goes up, curves across top, comes back down
    phi_curve = phi_center + delta_phi * np.cos(t)  # X coordinates  
    U_curve = U_center + delta_U * (1 - np.cos(t)) / 2  # Y coordinates for U-shape
    
    # Plot the U-shaped curve
    ax.plot(phi_curve, U_curve, 'k-', linewidth=2.0, alpha=0.8)
    
    # Add arrowheads at both ends to indicate bidirectional oscillation
    # Left arrow (pointing inward/upward)
    arrow_left = FancyArrowPatch((phi_center - delta_phi, U_center + 0.05), 
                                (phi_center - delta_phi*0.85, U_center + delta_U*0.15),
                                arrowstyle='->', mutation_scale=18, 
                                linewidth=2.2, color='black')
    ax.add_patch(arrow_left)
    
    # Right arrow (pointing inward/upward)
    arrow_right = FancyArrowPatch((phi_center + delta_phi, U_center + 0.05), 
                                 (phi_center + delta_phi*0.85, U_center + delta_U*0.15),
                                 arrowstyle='->', mutation_scale=18, 
                                 linewidth=2.2, color='black')
    ax.add_patch(arrow_right)
    
    # Add small vertical indicators to show oscillation amplitude
    ax.plot([phi_center - delta_phi, phi_center - delta_phi], 
            [U_center, U_center + 0.15], 'k-', linewidth=1.5, alpha=0.7)
    ax.plot([phi_center + delta_phi, phi_center + delta_phi], 
            [U_center, U_center + 0.15], 'k-', linewidth=1.5, alpha=0.7)
    
    # Add omega_p label with improved positioning
    ax.text(phi_center, U_center + delta_U + 0.4, r'$\omega_p$', 
            ha='center', va='bottom', fontsize=14, fontweight='bold',
            bbox=dict(boxstyle="round,pad=0.3", facecolor='white', alpha=0.8, edgecolor='none'))
    
    # 7. Add barrier height annotation (U0) for j=0.5 case
    # Find the exact minimum for j=0.5 near φ=2π and maximum near φ=3π
    j_05_minima = find_local_minima_near_2pi(0.5, scaling_constant)
    j_05_maxima = find_local_maxima_near_3pi(0.5, scaling_constant)
    
    if j_05_minima and j_05_maxima:
        phi_min = j_05_minima[0]  # First minimum near 2π
        phi_max = j_05_maxima[0]  # First maximum near 3π
        U_min = 1 - np.cos(phi_min) - scaling_constant * 0.5 * phi_min
        U_max = 1 - np.cos(phi_max) - scaling_constant * 0.5 * phi_max
        
        # Draw vertical double arrow between minimum and maximum
        ax.annotate('', xy=(phi_min, U_max), xytext=(phi_min, U_min),
                    arrowprops=dict(arrowstyle='<->', lw=1.5, color='black'))
        ax.text(phi_min + 0.3, (U_max + U_min)/2, r'$U_0$', va='center', fontsize=12)
    
    # 8. Coordinate system and appearance settings
    ax.set_xticks([0, 2*np.pi, 4*np.pi, 6*np.pi])
    ax.set_xticklabels([r'$0$', r'$2\pi$', r'$4\pi$', r'$6\pi$'], fontsize=12)
    ax.set_yticks([2, 0, -4, -8, -12])
    ax.set_yticklabels(['2', '0', '-4', '-8', '-12'], fontsize=12)
    ax.set_xlabel(r'$\varphi$', fontsize=14)
    ax.set_ylabel(r'$U(\varphi)$ [$E_J$]', fontsize=14)
    ax.set_xlim(0, 6*np.pi)
    ax.set_ylim(-12.8, 2.5)  # Adjusted range to show all curves completely
    
    # Remove top and right spines
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    
    # Position left spine at x=0 and bottom spine at bottom of plot area (standard coordinate system)
    ax.spines['left'].set_position(('data', 0))
    ax.spines['bottom'].set_position(('axes', 0))  # Move x-axis to bottom of canvas
    
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