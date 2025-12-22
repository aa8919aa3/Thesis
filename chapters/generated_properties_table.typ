#table(
  columns: (2.4fr, 3.2fr, 2.1fr, 2.1fr, 1.8fr),
  align: (left, left, right, right, left),
  inset: 4pt,
  stroke: 0.5pt,

  table.header([*Property*], [*Symbol*], [*NbTi (Thin Film)*], [*1T-PtTe₂ (Thin Film)*], [*Units*]),

  // ---- Transport / length scales ----
  [*Diffusion constant*], [$D = v_F^2 tau / 2$], [≈ 5.6×10²–5.6×10³], [≈ 1.5×10²–2.4×10³], [cm²/s],

  [*Resistivity* ¹], [$rho = [n_s e mu_e]^(-1)$], [≈ 0.001–0.01], [≈ 0.0002–0.002], [kΩ (per □)],

  [*Fermi wavelength*], [$lambda_F = 2 pi / k_F$], [≈ 0.32 nm], [≈ 7–11 nm], [nm],

  [*Mean free path*], [$l = v_F tau$], [≈ 80–800 nm], [≈ 8000–12000 nm], [nm],

  [*Phase coherence length* ²],
  [$l_phi = sqrt(D tau_phi)$],
  [≈ 200–… nm·(T/K)^⁻¹/²],
  [≈ 50–500 nm·(T/K)^⁻¹/²],
  [nm·(T/K)^⁻¹/²],

  [*Thermal length*],
  [$l_T = sqrt(planck D / (k_B T))$],
  [≈ 7×10^4–2×10^5 nm·(T/K)^⁻¹/²],
  [≈ 3×10^4–1×10^5 nm·(T/K)^⁻¹/²],
  [nm·(T/K)^⁻¹/²],

  [*Cyclotron radius*],
  [$l_"cycl" = planck k_F / (e B)$],
  [≈ 1.3×10^4 (B/T)^⁻¹ (nm @ 1 T)],
  [≈ 380–570 (B/T)^⁻¹ (nm @ 1 T)],
  [nm·(B/T)^⁻¹],

  [*Magnetic length*], [$l_m = (planck/(e B))^(1/2)$], [26 (B/T)^⁻¹/²], [26 (B/T)^⁻¹/²], [nm·(B/T)^⁻¹/²],

  // ---- Dimensionless parameters ----
  [_Dimensionless parameters:_], [], [], [], [],

  [$k_F l$], [–], [≈ 2×10^3–2×10^4 (≫ 1 ballistic)], [≈ 4.6×10^4–1×10^5 (≫ 1 ballistic)], [–],

  [$omega_c tau$], [–], [≈ 0.01–0.1 (× B/T)], [≈ 0.2–2 (× B/T)], [(B/T)],

  [$E_F/(planck omega_c)$], [–], [≈ 4.3×10^4 (× (B/T)^⁻¹)], [≈ 1.1×10^2–2.5×10^2 (× (B/T)^⁻¹)], [(B/T)^⁻¹],
)
