// 論文審定書
// Validation Letter
#import "../info.typ": info
#let validation-letter(info) = [
  #set align(center)
  #text(size: 18pt, weight: "bold")[論文審定書]

  #v(2em)

  #set align(left)

  本論文係 #info.author 君在國立中山大學#info.department 完成之#info.degree 論文，於民國#info.year 年#info.month 承下列考試委員審查通過及口試及格，特此證明。

  #v(2em)

  口試委員：

  #v(1em)

  指導教授：#info.advisor #h(2em) #line(length: 4cm)

  #v(1em)

  委員：#line(length: 4cm) #h(2em) #line(length: 4cm)

  #v(1em)

  委員：#line(length: 4cm) #h(2em) #line(length: 4cm)

  #v(3em)

  #align(right)[
    #info.department 主任：#line(length: 6cm)

    #v(1em)

    中華民國#info.year 年#info.month
  ]
#pagebreak()
]

// 呼叫函數
#validation-letter(info)
