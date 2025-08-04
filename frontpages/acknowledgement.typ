// 誌謝
// Acknowledgement
#import "../info.typ": info
#let acknowledgement(info) = [
  #set align(center)
  #text(size: 18pt, weight: "bold")[誌謝]

  #v(2em)

  #set align(left)

  在此感謝所有在研究過程中給予我幫助和支持的人們。

  首先要感謝我的指導教授 #info.advisor 教授，在研究期間給予我寶貴的指導和建議，讓我能夠順利完成這項研究。

  感謝實驗室的同學們，與他們的討論和交流讓我獲益良多。

  最後要感謝我的家人，他們的支持和鼓勵是我完成學業的重要動力。

  #v(3em)

  #align(right)[
    #info.author 謹於

    國立中山大學

    中華民國#info.year 年#info.month
  ]
  #pagebreak()
]
#pagebreak()
// 呼叫函數
#acknowledgement(info)