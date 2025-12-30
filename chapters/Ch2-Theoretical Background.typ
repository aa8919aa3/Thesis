// Ch2 Standalone Compilation Wrapper
// 第二章：理論背景 - 可單獨編譯的版本
// Chapter 2: Theoretical Background - Standalone Version

// 1. Import required libraries (note: paths go up one level with ../)
#import "../lib.typ": *
#import "../info.typ": info
#import "@preview/unify:0.7.1": *
#import "@preview/typsium:0.3.1": *
#import "@preview/physica:0.9.3": *
#import "@preview/equate:0.3.2": equate


#let thesis-info = info

// 2. Set up heading and equation numbering (same as main.typ)
#set heading(numbering: "1.")
#show heading.where(level: 1): it => {
  counter(math.equation).update(0)
  it
}

#set math.equation(numbering: n => {
  let count = counter(heading.where(level: 1)).at(here()).first()
  if count > 0 {
    numbering("(1.1)", count, n)
  } else {
    numbering("(1)", n)
  }
})

// 3. Apply equate styling
#show: equate.with(number-mode: "line", sub-numbering: false)

// 4. Set paragraph indentation
#set par(first-line-indent: (amount: 2em, all: true))

// 5. Apply NSYSU thesis template (note: bibliography path is ../references.bib)
#show: nsysu-thesis.with(
  info: thesis-info,
  bibliography: bibliography("../references.bib"),
  toc-title: "目錄",
  lof-title: "圖次",
  lot-title: "表目錄",
  cjk-font: ("BiauKai", "標楷體", "DFKai-SB", "KaiTi"),
  en-font: "Times New Roman",
  watermark: true,
)

// 6. Include the actual chapter content
#include "Ch2-Theoretical Background-body.typ"
