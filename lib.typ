// NSYSU Thesis Template Library
// 國立中山大學學位論文 Typst 模板函式庫

// 封面頁面函數
#let nsysu-cover-page(info) = {
  set page(numbering: none)
  
  // 設定 1.5 倍行距
  set par(leading: 1.5em)
  
  set align(center)
  
  // 校徽 - 對應範本的校徽位置
  image("Images/logo_nsysu_thesis.jpg", width: 20%)

  
  
  // 中文校系名稱和學位類型
  text(size: 18pt, weight: "bold")[
    國立中山大學#info.department\
  ]
  
  // 學位論文類型（中文）
  text(size: 18pt, weight: "bold")[
    #if info.degree == "碩士" [碩士論文] else [博士論文]\
  ]
  
  
  // 英文校系名稱
  text(size: 16pt)[
    #info.department-en \
    National Sun Yat-sen University\
  ]

  // 英文學位類型
  text(size: 16pt)[
    #if info.degree == "碩士" [Master's Thesis] else [Doctoral Dissertation]
  ]
  
  // 對應範本的間距
  v(5em)
  
  // 論文標題（中文）
  text(size: 20pt, weight: "bold")[
    #info.title\
  ]
  
  // 論文標題（英文）
  text(size: 18pt, weight: "bold")[
    #info.title-en\
  ]

  // 對應範本的間距
  v(5em)

  // 作者與指導教授資訊 - 垂直排列
  set text(size: 16pt)
  // 使用 align(center) 將整個作者資訊區塊置中
  align(center)[
  
  // 使用 table 來建立一個結構穩固的對齊系統
  #table(
    // 關鍵設定 1：定義兩欄，寬度都由內容自動決定
    columns: (auto, auto),
    
    // 關鍵設定 2：為每一欄設定對齊方式
    // 第一欄全部靠右對齊，第二欄全部靠左對齊
    align: (right, left),
    
    // 移除表格的框線
    stroke: none,
    
    // 設定列與列之間的間距
    row-gutter: 0.8em,

    // --- Table 內容 ---

    // 第一列：研究生
    // 第一欄 (標籤)
    [#pad(left: 3em)[研究生：]],
    
    // 第二欄 (內容)
    [
      #pad(left: 0em)[#info.author]
      #pad(left: 0em)[#info.author-en]
    ],

    // 第二列：指導教授
    // 第一欄 (標籤)
    [#pad(left: 3em)[指導教授：]],

    // 第二欄 (內容)
    [
      #pad(left: 0em)[#info.advisor]
      #pad(left: 0em)[#info.advisor-en]
    ],
  )
]



  // 對應範本的間距
  v(1em)

  // 日期（中英文）
  text(size: 14pt)[
    中華民國 #info.year 年 #info.month \
    #info.month-en #info.year-en
  ]
  

}

// 摘要頁面函數
#let nsysu-abstract-page(title: "", content, keywords: "") = {
  pagebreak()
  
  {
    set align(center)
    text(size: 18pt, weight: "bold")[#title]
  }
  
  v(2em)
  
  content
  
  v(2em)
  
  [關鍵詞：#keywords]
}

// 誌謝頁面函數
#let nsysu-acknowledgement-page(content) = {
  pagebreak()
  
  {
    set align(center)
    text(size: 18pt, weight: "bold")[誌謝]
  }
  
  v(2em)
  
  content
}

// 論文審定書頁面函數
#let nsysu-validation-page(content) = {
  pagebreak()
  
  {
    set align(center)
    text(size: 18pt, weight: "bold")[論文審定書]
  }
  
  v(2em)
  
  content
}

// 基本設定
#let nsysu-thesis(
  info: (:),
  bibliography: none,
  toc-title: "目錄",
  lof-title: "圖次",
  lot-title: "表目錄",
  cjk-font: ("BiauKai", "標楷體", "DFKai-SB", "KaiTi"),
  en-font: "Times New Roman",
  watermark: true,
  body
) = {
  
  // 設定頁面格式（不含水印）
  set page(
    paper: "a4",
    margin: (
      top: 2.5cm,
      bottom: 2.5cm,
      left: 3cm,
      right: 2.5cm
    ),
    numbering: "1",
  )
  
  // 設定文字格式
  set text(
    font: ("Times New Roman", "BiauKai", "DFKai-SB", "Kai", "STKaiti"),
    size: 12pt,
    lang: "zh",
    region: "TW",
  )
  
  // 設定段落格式
  set par(
    justify: true,
    first-line-indent: 2em,
    leading: 1.5em,
  )
  
  // 設定標題格式
  set heading(numbering: "1.1.1")
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(2em)
    set text(size: 18pt, weight: "bold")
    set align(center)
    it
    v(1.5em)
  }
  
  show heading.where(level: 2): it => {
    v(1.5em)
    set text(size: 16pt, weight: "bold")
    it
    v(1em)
  }
  
  show heading.where(level: 3): it => {
    v(1em)
    set text(size: 14pt, weight: "bold")
    it
    v(0.5em)
  }
  
  // 設定圖表格式
  set figure(
    supplement: [圖],
    numbering: "1.1",
  )
  
  set figure.caption(
    position: bottom,
    separator: [　],
  )
  
  show figure.where(kind: table): set figure(
    supplement: [表],
  )
  
  // 生成封面頁
  nsysu-cover-page(info)
  
  // 重設頁碼為羅馬數字
  set page(numbering: "i")
  counter(page).update(1)
  
  // 生成目錄 - 僅在此頁面顯示水印
  pagebreak()
  
  // 為目錄頁面設定水印
  set page(
    background: if watermark {
      place(
        center + horizon,
        rotate(0deg,
          rect(
            fill: none,
            stroke: none,
            image("Images/watermark.jpg", width: 8cm, fit: "contain")
          )
        )
      )
    } else {
      none
    }
  )
  
  {
    set align(center)
    text(size: 18pt, weight: "bold")[#toc-title]
  }
  v(1em)
  
  show outline.entry.where(level: 1): it => {
    strong(it)
  }
  
  outline(
    title: none,
    indent: auto,
    depth: 3,
  )
  
  // 移除水印設定，回到一般頁面
  set page(background: none)
  
  // 生成圖次
  pagebreak()
  {
    set align(center)
    text(size: 18pt, weight: "bold")[#lof-title]
  }
  v(1em)
  
  outline(
    title: none,
    target: figure.where(kind: image),
  )
  
  // 生成表目錄
  pagebreak()
  {
    set align(center)
    text(size: 18pt, weight: "bold")[#lot-title]
  }
  v(1em)
  
  outline(
    title: none,
    target: figure.where(kind: table),
  )
  
  // 主要內容重設頁碼
  pagebreak()
  set page(numbering: "1")
  counter(page).update(1)
  
  // 插入主要內容
  body
  
  // 顯示參考文獻
  if bibliography != none {
    pagebreak()
    {
      set align(center)
      text(size: 18pt, weight: "bold")[參考文獻]
    }
    v(1em)
    bibliography
  }
}
