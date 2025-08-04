// 英文摘要
// English Abstract
#import "../info.typ": info
#let english-abstract(info) = [
  #set align(center)
  #text(size: 18pt, weight: "bold")[Abstract]

  #v(2em)

  #set align(left)

  This research investigates the relevant research problems, adopts specific research methods, and obtains important research results.

  The main contributions of this thesis include: (1) proposing new research methods; (2) verifying theoretical hypotheses; (3) providing references for practical applications.

  The research results show that the proposed method has significant improvements in performance and has good practicality. This research provides valuable references for the development of related fields.
  #v(2em)
  #text(weight: "bold")[Keywords:] #info.keywords-en
#pagebreak()
]
// 呼叫函數
#english-abstract(info)