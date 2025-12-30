// 英文摘要
// English Abstract
#import "@preview/typsium:0.3.1": *
#import "../info.typ": info
#let english-abstract(info) = [
  #set align(center)
  #text(size: 18pt, weight: "bold")[Abstract]

  #v(1em)

  #set align(left)

  This work presents an in-depth investigation of the current–phase relation (current–phase relation, CPR) in Josephson junctions based on the type-II Dirac semimetal 1T-phase platinum ditelluride (1T-#ce[PtTe2]). The aim is to clarify how the superconducting state induced in a Dirac semimetal via the proximity effect couples to an in-plane magnetic field.

  We fabricated micro-/nanoscale devices and, using an ultralow-temperature measurement platform, employed the phase-biasing capability of an asymmetric superconducting quantum interference device (asymmetric SQUID, aSQUID) to systematically measure the CPR of 1T-#ce[PtTe2] Josephson junctions and its evolution under applied magnetic fields.

  The experimental results show that under strong in-plane magnetic fields, the junction CPR deviates markedly from a single-sine form and exhibits pronounced higher-harmonic contributions. In particular, the second-harmonic component reaches up to 27.3%, with a phase offset of approximately ($265.6 degree$), significantly exceeding theoretical expectations for second-harmonic content in conventional diffusive Josephson junctions. Moreover, the extracted current-density distribution indicates that the fraction of supercurrent carried by edge states increases with the in-plane field strength, suggesting the possible emergence of multichannel proximity transport and spatially nonuniform current paths in the high-field regime.

  Furthermore, we demonstrate reversible control of the CPR via externally applied magnetic flux, and verify the operation of a tunable $phi_0$-junction in which 1T-#ce[PtTe2] serves as the weak link. These results not only deepen the understanding of the superconducting proximity effect in Dirac semimetals and its magnetic-field coupling mechanisms, but also provide key physical insights for developing superconducting quantum devices with controllable phase offsets and enhanced multifunctionality.



  #v(0.8em)
  #text(weight: "bold")[Keywords:] #info.keywords-en
  #pagebreak()
]
// 呼叫函數
#english-abstract(info)
