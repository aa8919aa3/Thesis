// Revision Summary
// Date: 2025-08-05
// Chapter: ch5-1-Discussion
// Total revisions: 3
// Critical fixes: 1
// Improvements: 1
// Suggestions: 1
// 
// This file has been revised based on physics professor feedback
// All revisions are marked with // REVISED: comments

// 第五章第一節：討論
// Chapter 5.1: Discussion
// 根據 Thesis.md 中 Chapter V Discussion 的內容轉換為 Typst 格式
// 注意：原始內容僅包含章節標題，詳細內容需要後續補充

// 設定成段之文字首行皆空2字元
#set par(first-line-indent: (amount: 2em, all: true))
#import "@preview/physica:0.9.3": *

= 討論 <chapter-discussion>

// REVISED: Added Theoretical Framework improvement

// Enhanced theoretical framework for CPR
對於傳統的約瑟夫森接面，電流-相位關係遵循 $I_s(phi) = I_c sin(phi)$ 的形式。然而，在拓撲材料如 PtTe₂ 中，由於狄拉克費米子的存在，CPR 可能偏離此理想正弦形式，表現出諸如 $I_s(phi) = I_c sin(phi) + I_2 sin(2phi)$ 等高次諧波分量。

== 5.1 $"PtTe"_2$ 超導量子干涉儀中非對稱夫朗和費圖樣的起源 <section-asymmetric-fraunhofer-origin>

// Origin of Asymmetric Fraunhofer Patterns in PtTe₂ SQUIDs
// 本節內容有待補充

在$"PtTe"_2$基礎的超導量子干涉儀（Superconducting Quantum Interference Device, SQUID）中，非對稱夫朗和費（Fraunhofer）干涉圖樣的觀測提供了深入理解約瑟夫森接面（Josephson Junction）內在物理機制的重要線索。

// 待補充：具體的非對稱性分析、物理機制討論、與理論預測的比較

== 5.2 非傳統電流-相位關係的性質與起源 <section-unconventional-cpr-nature>

// Nature and Origin of Unconventional CPRs
// 本節內容有待補充

非傳統的電流-相位關係（Current-Phase Relation, CPR）的出現是第二類狄拉克半金屬（Type-II Dirac Semimetal）與超導性結合的重要表現。在$"PtTe"_2$約瑟夫森接面中，偏離標準正弦函數的CPR反映了其獨特的拓撲電子結構。

// 待補充：CPR的具體形式分析、高階諧波成分、與材料拓撲性質的關聯

== 5.3 [標題待補充] <section-additional-discussion>

// 原始文件中此節標題為空，需要根據具體內容補充

// 本節內容有待補充

== 5.4 製備技術挑戰 <section-fabrication-challenges>

// Fabrication Challenges
// 製備過程中遇到的技術挑戰與解決方案

在$"PtTe"_2$基礎超導元件的製備過程中，遇到了多項技術挑戰，這些挑戰直接影響了最終元件的電學特性與量測結果的可靠性。

=== 5.4.1 薄片尺寸與厚度控制 <subsection-flake-size-thickness>

// Flake Size and Thickness
// 本小節內容有待補充

二維材料薄片（Flake）的尺寸與厚度控制是影響元件性能的關鍵因素。機械剝離法（Mechanical Exfoliation）獲得的$"PtTe"_2$薄片在尺寸分佈和厚度均勻性方面存在固有的變異性。

// 待補充：具體的尺寸要求、厚度對電學特性的影響、改進策略

=== 5.4.2 過渡金屬二硫屬化物表面保護與殘留物清除 <subsection-tmd-surface-protection>

// TMD Surface Protection and Residues Cleaning
// 本小節內容有待補充

此外，過渡金屬二硫屬化物（Transition Metal Dichalcogenide, TMD）材料表面的保護與清潔是確保高品質歐姆接觸（Ohmic Contact）的重要步驟。在電子束微影（Electron Beam Lithography, EBL）與後續製程中，如何有效保護材料表面並完全清除製程殘留物是製備成功的關鍵。

// 待補充：具體的表面處理方法、殘留物的來源與影響、清除技術的比較

=== 5.4.3 濺鍍超導電極的側壁問題 <subsection-sputtered-leads-sidewall>

// Side-Wall Issue of Sputtered Superconducting Leads
// 本小節內容有待補充

磁控濺鍍（Magnetron Sputtering）製程中的側壁沉積問題會影響電極圖案的精確度與電學特性。特別是在製備細線寬的超導電極時，側壁效應可能導致短路或產生非預期的電流路徑。

// 待補充：側壁問題的具體表現、對元件性能的影響、解決方案與改進建議