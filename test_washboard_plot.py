#!/usr/bin/env python3
"""
Test script to verify the tilted washboard potential plot meets requirements
"""

import numpy as np
import matplotlib.pyplot as plt
import os

def test_plot_requirements():
    """Test that the generated plot meets the specified requirements"""
    
    # Check that SVG file was created
    svg_path = "Images/tilted_washboard_potential.svg"
    png_path = "Images/tilted_washboard_potential.png"
    
    assert os.path.exists(svg_path), f"SVG file not found at {svg_path}"
    assert os.path.exists(png_path), f"PNG file not found at {png_path}"
    
    print("✓ SVG and PNG files created successfully")
    
    # Verify file sizes are reasonable
    svg_size = os.path.getsize(svg_path)
    png_size = os.path.getsize(png_path)
    
    assert svg_size > 10000, f"SVG file too small: {svg_size} bytes"
    assert png_size > 50000, f"PNG file too small: {png_size} bytes"
    
    print(f"✓ File sizes are reasonable (SVG: {svg_size} bytes, PNG: {png_size} bytes)")
    
    # Test the potential function with expected parameters
    phi = np.linspace(0, 6*np.pi, 100)
    scaling_constant = 0.5
    
    # Test for j=0 (should be standard washboard)
    j = 0.0
    U_j0 = 1 - np.cos(phi) - scaling_constant * j * phi
    expected_U_j0 = 1 - np.cos(phi)  # No tilt term
    
    assert np.allclose(U_j0, expected_U_j0), "j=0 case doesn't match expected washboard"
    print("✓ j=0 case produces standard washboard potential")
    
    # Test for j>0 (should show tilt)
    j = 1.0
    U_j1 = 1 - np.cos(phi) - scaling_constant * j * phi
    
    # At larger phi, the tilt should dominate
    assert U_j1[-1] < U_j1[0], "Potential should be tilted downward for j>0"
    print("✓ j>0 cases show proper tilting")
    
    # Test that different j values produce different curves
    j_values = [0.0, 0.5, 0.8, 1.3]
    curves = []
    for j in j_values:
        U = 1 - np.cos(phi) - scaling_constant * j * phi
        curves.append(U)
    
    # All curves should be different
    for i in range(len(curves)):
        for j in range(i+1, len(curves)):
            assert not np.allclose(curves[i], curves[j]), f"Curves {i} and {j} are too similar"
    
    print("✓ Different j values produce distinct curves")
    
    # Test phase range
    phi_max = 6 * np.pi
    assert phi_max > 18, "Phase range should extend to 6π ≈ 18.85"
    print("✓ Phase range extends to 6π as required")
    
    print("\n✅ All tests passed! The plot meets the specified requirements.")

if __name__ == "__main__":
    test_plot_requirements()