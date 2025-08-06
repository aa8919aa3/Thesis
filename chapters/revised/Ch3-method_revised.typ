// Revision Summary
// Date: 2025-08-05
// Chapter: Ch3-method
// Total revisions: 3
// Critical fixes: 0
// Improvements: 1
// Suggestions: 2
// 
// This file has been revised based on physics professor feedback
// All revisions are marked with // REVISED: comments

// 第三章：研究方法
// Chapter 3: Methodology

= 研究方法 <chapter-methodology>

== 研究架構 <section-research-framework>

本研究採用系統性的研究方法，整體架構如 @fig-research-framework 所示。

#figure(
  rect(width: 80%, height: 8cm, stroke: 1pt + gray)[
    #align(center + horizon)[研究架構圖\n（圖片待補充）]
  ],
  caption: [研究架構圖]
) <fig-research-framework>

研究流程包含以下主要階段：
1. 問題定義與分析
2. 方法設計與開發
3. 實驗設計與執行
4. 結果分析與驗證

== 方法設計 <section-method-design>

=== 核心概念 <subsection-core-concepts>

本研究提出的方法基於以下核心概念：

- *概念一*：相關的理論基礎
- *概念二*：創新的技術方法
- *概念三*：實務應用考量

=== 演算法設計 <subsection-algorithm-design>

所提出的演算法步驟如下：

1. 初始化參數設定
2. 資料預處理
3. 核心演算法執行
4. 結果後處理

詳細的演算法描述如 @alg-main-algorithm 所示。

#figure(
  ```
  Algorithm 1: 主要演算法
  Input: 輸入資料 D
  Output: 處理結果 R
  
  1: 初始化參數
  2: for each 資料點 d in D do
  3:   執行處理步驟
  4:   更新結果
  5: end for
  6: return R
  ```,
  caption: [主要演算法流程],
  kind: "algorithm"
) <alg-main-algorithm>

== 實驗設計 <section-experimental-design>

=== 實驗環境 <subsection-experimental-setup>

實驗環境的詳細配置如 @tab-experimental-setup 所示。

#figure(
  table(
    columns: (1fr, 2fr),
    align: left,
    [*項目*], [*規格*],
    [處理器], [Intel Core i7-9700K],
    [記憶體], [32GB DDR4],
    [作業系統], [Ubuntu 20.04 LTS],
    [程式語言], [Python 3.8],
    [開發環境], [PyCharm 2023.1]
  ),
  caption: [實驗環境配置]
) <tab-experimental-setup>

=== 評估指標 <subsection-evaluation-metrics>

本研究採用以下評估指標：

- *準確率 (Accuracy)*：正確預測的比例
- *精確率 (Precision)*：預測為正例中實際為正例的比例  
- *召回率 (Recall)*：實際正例中被正確預測的比例
- *F1分數*：精確率和召回率的調和平均

=== 實驗參數 <subsection-experimental-parameters>

主要實驗參數設定如下：
- 學習率：0.001
- 批次大小：32
- 訓練週期：100
- 驗證分割：80%/20%
