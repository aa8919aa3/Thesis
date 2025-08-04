// NSYSU Thesis Template in Typst
// 國立中山大學學位論文 Typst 模板
// Based on the NTNU thesis template and NSYSU LaTeX template

#import "lib.typ": *
#import "info.typ": info
#import "@preview/unify:0.7.1": *
#import "@preview/typsium:0.3.0": ce
#import "@preview/physica:0.9.3": *
#import "@preview/equate:0.3.2": equate
#set heading(numbering: "1.")
// Reset equation counter at each chapter
#show heading.where(level: 1): it => {
  counter(math.equation).update(0)
  it
}
// Custom chapter-aware numbering function
#set math.equation(numbering: n => {
  let count = counter(heading.where(level: 1)).at(here()).first()
  if count > 0 {
    numbering("(1.1)", count, n)
  } else {
    numbering("(1)", n)
  }
})
#show: equate.with(number-mode: "line", sub-numbering: false)
// 設定 thesis-info 為與 info 相同的內容（為了向後相容）
#let thesis-info = info

// 設定成段之文字首行皆空2字元
#set par(first-line-indent: (amount: 2em, all: true))

// 套用 NSYSU 論文模板
#show: nsysu-thesis.with(
  info: thesis-info,
  bibliography: bibliography("references.bib"),
  // 其他選項
  toc-title: "目錄",
  lof-title: "圖次", 
  lot-title: "表目錄",
  // 字體設定 - Times New Roman 與標楷體
  // 提供多個標楷體備用字體名稱以支援不同系統
  cjk-font: ("BiauKai", "標楷體", "DFKai-SB", "KaiTi"),
  en-font: "Times New Roman",
  // 水印設定
  watermark: true,
)

// 前置頁面

// 封面頁（由模板自動生成）

// 論文審定書
#include "frontpages/validation-letter.typ"

// 誌謝
#include "frontpages/acknowledgement.typ"

// 中文摘要
#include "frontpages/chinese-abstract.typ"
// 英文摘要
#include "frontpages/english-abstract.typ"

// 目錄（由模板自動生成）

// 圖次（由模板自動生成）

// 表目錄（由模板自動生成）

// 主要內容
// 第一章：介紹
#include "chapters/Ch1-introduction.typ"

// 第二章：相關研究
#include "chapters/Ch2-related-work.typ"

// 第三章：研究方法
#include "chapters/Ch3-method.typ"

// 第四章：實驗結果
#include "chapters/Ch4-experiments.typ"

// 第五章：結論
#include "chapters/Ch5-conclusion.typ"

// 參考文獻（由模板自動生成）

// 附錄
#include "appendices/appendix.typ"
