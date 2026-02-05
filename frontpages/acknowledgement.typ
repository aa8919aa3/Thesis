// 誌謝
// Acknowledgement
#import "../info.typ": info
#import "../lib.typ": nsysu-acknowledgement-page

#let acknowledgement(info) = nsysu-acknowledgement-page[
  在此感謝所有在研究過程中給予我幫助和支持的人們。

  首先要感謝我的指導教授#info.advisor，讓我有機會加入研究團隊，並在修課與研究期間皆給予我寶貴的指導和建議，讓我能夠順利完成這項研究。

  另外，特別感謝中央研究院物理中央研究院物理研究所的柯忠廷教授，他在元件的製程設計和實驗上以及論文的撰寫上給予我很大的幫助，若非他的指導，我可能無法完成這項研究。

  感謝QC Lab的同學們，Avi、程瀚、永翔和彥智在我剛加入研究團隊時與他們的討論和交流對於研究的理論和實驗操作讓我獲益良多。

  感謝Ke Lab的成員們，正源和振瑋，特別是宜臻、有義和遠堂，他們在我於物理所的樣品製作與儀器使用上給予我莫大的幫助，對於有幸能與他們一起看過凌晨四點的南港，我深感榮幸。

  感謝我的女友廷如，她在我研究期間的陪伴、鼓勵與體諒，讓我每天回家充電後都有力量繼續研究。

  最後要感謝我的家人，他們的支持和鼓勵是我完成學業的重要動力。

  #v(3em)

  #align(right)[
    #info.author 謹於

    國立中山大學

    中華民國#info.year 年#info.month
  ]
]

// 呼叫函數
#acknowledgement(info)
