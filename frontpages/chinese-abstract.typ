// 中文摘要
// Chinese Abstract
#import "@preview/typsium:0.3.1": *
#import "../info.typ": info
#let chinese-abstract(info) = [
  #set align(center)
  #text(size: 18pt, weight: "bold")[摘要]

  #v(2em)

  #set align(left)

  // 在此撰寫您的中文摘要內容

  本研究聚焦於第二類狄拉克半金屬 1T 相二碲化鉑（1T-#ce[PtTe2]）約瑟夫森接面的電流–相位關係（current–phase relation, CPR），旨在闡明超導近接效應所誘發之狄拉克半金屬超導態與面內磁場之耦合行為。

  我們製備微／奈米尺度元件，並於極低溫量測平台上，利用非對稱超導量子干涉儀（asymmetric SQUID, aSQUID）的相位偏置能力，系統性量測 1T-#ce[PtTe2] 約瑟夫森接面的 CPR 及其在外加磁場下的演化。

  實驗結果顯示，在強面內磁場下，接面 CPR 明顯偏離單一正弦形式，呈現顯著高階諧波成分；其中二階諧波佔比最高達 27.3%，且其相位偏移約為 $265.6 degree$，顯著大於傳統擴散輸運約瑟夫森接面對二階諧波之理論預期。此外，電流密度分布亦顯示邊緣態所承載之超電流比例隨面內磁場強度增加而上升，指向強磁場下可能存在多通道近接輸運與非均勻電流路徑。

  進一步地，我們展示可藉由外加磁通量對 CPR 進行可逆調控，並驗證以 1T-#ce[PtTe2] 為弱連結之可調 $phi_0$-接面功能。上述結果不僅加深對狄拉克半金屬中超導近接效應及其磁場耦合機制的理解，也為發展具可調相位偏移與多功能性的超導量子元件提供關鍵物理依據。

  #v(2em)

  // 關鍵字
  #text(weight: "bold")[關鍵字：] #info.keywords

  #v(3em)
  #pagebreak()
]
// 呼叫函數
#chinese-abstract(info)
