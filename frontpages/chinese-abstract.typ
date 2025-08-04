// 中文摘要
// Chinese Abstract
#import "../info.typ": info
#let chinese-abstract(info) = [
  #set align(center)
  #text(size: 18pt, weight: "bold")[摘要]

  #v(2em)

  #set align(left)

  // 在此撰寫您的中文摘要內容
  本研究探討...本文所呈現的結果，不僅揭示了狄拉克物理與超導近接效應之間深刻的交互作用，也為開發新型、可調諧的超導量子電子學元件提供了一條富有前景的途徑。

  #v(2em)

  // 關鍵字
  #text(weight: "bold")[關鍵字：] 關鍵字1、關鍵字2、關鍵字3

  #v(3em)
  #pagebreak()
]
// 呼叫函數
#chinese-abstract(info)