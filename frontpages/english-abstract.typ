// 英文摘要
// English Abstract
#import "../info.typ": info
#let english-abstract(info) = [
  #set align(center)
  #text(size: 18pt, weight: "bold")[Abstract]

  #v(2em)

  #set align(left)

  This thesis investigates the transport properties of Superconducting Quantum Interference Devices (SQUIDs) based on the type-II Dirac semimetal 1T-PtTe₂, aiming to elucidate the interplay between topological materials and the superconducting proximity effect. We established a complete fabrication process and an ultra-low temperature measurement platform to systematically study the Current-Phase Relation (CPR) of PtTe₂ Josephson junctions and its evolution under external magnetic fields.

  The experimental results demonstrate that PtTe₂ junctions exhibit a significant non-sinusoidal CPR, with the second harmonic component ($I_2$) reaching up to 36% of the first harmonic, far exceeding theoretical expectations for conventional tunneling junctions. Furthermore, we observed a pronounced Josephson Diode Effect (JDE) and verified that its efficiency can be continuously tuned by an in-plane magnetic field. Further analysis revealed a strong correlation between the asymmetry of Fraunhofer interference patterns and the unconventional CPR, providing direct evidence for the involvement of helical spin-momentum locked topological surface states in superconducting transport.

  This study successfully achieved flux-control over the CPR and demonstrated the functionality of a tunable $φ_0$-junction based on PtTe₂. These findings not only deepen the understanding of the superconducting proximity effect in topological semimetals but also lay a crucial physical foundation for developing novel and multifunctional superconducting quantum electronic devices.
  #v(2em)
  #text(weight: "bold")[Keywords:] #info.keywords-en
  #pagebreak()
]
// 呼叫函數
#english-abstract(info)
