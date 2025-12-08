// 第五章第一節：討論
// Chapter 5.1: Discussion
// 根據 Thesis.md 中 Chapter V Discussion 的內容轉換為 Typst 格式
// 注意：原始內容僅包含章節標題，詳細內容需要後續補充

// 設定成段之文字首行皆空2字元
#set par(first-line-indent: (amount: 2em, all: true))
#import "@preview/physica:0.9.3": *

= 討論 <chapter-discussion>

== $"PtTe"_2$ 超導量子干涉儀中非對稱夫朗和費圖樣的起源 <section-asymmetric-fraunhofer-origin>

// Origin of Asymmetric Fraunhofer Patterns in PtTe₂ SQUIDs
// 本節內容有待補充

在$"PtTe"_2$基礎的超導量子干涉儀（Superconducting Quantum Interference Device, SQUID）中，非對稱夫朗和費（Fraunhofer）干涉圖樣的觀測提供了深入理解約瑟夫森接面（Josephson Junction）內在物理機制的重要線索。

// 待補充：具體的非對稱性分析、物理機制討論、與理論預測的比較

== 非傳統電流-相位關係的性質與起源 <section-unconventional-cpr-nature>

// Nature and Origin of Unconventional CPRs
// 本節內容有待補充

非傳統的電流-相位關係（Current-Phase Relation, CPR）的出現是第二類狄拉克半金屬（Type-II Dirac Semimetal）與超導性結合的重要表現。在$"PtTe"_2$約瑟夫森接面中，偏離標準正弦函數的CPR反映了其獨特的拓撲電子結構。

// 待補充：CPR的具體形式分析、高階諧波成分、與材料拓撲性質的關聯

== 與相關研究之比較 <section-comparison-related-work>

本文的研究結果與近期關於第二類狄拉克半金屬 Josephson 二極體效應的報導高度一致，特別是針對 $1T-"PtTe"_2$ 與同族材料 $"NiTe"_2$ 的研究。

首先，我們觀察到的約瑟夫森二極體效應（JDE）與近期在 $1T-"PtTe"_2$ 單一接面中報導的現象 [arXiv:2403.19445] 相呼應。相關研究同樣發現了可透過磁場調控的二階 Josephson 效應（$phi_0$-junction behavior），並將其歸因於螺旋自旋-動量鎖定的表面態。我們的 SQUID 量測進一步提供了電流-相位關係（CPR）的直接相位敏感證據，確認了高階諧波 ($I_2$) 的存在及其相位偏移 ($delta$) 是導致二極體效應的微觀根源。

其次，與 $"NiTe"_2$ 的研究相比，我們同樣觀察到了二極體效率隨面內磁場的振盪與反轉行為。這被認為是有限動量庫柏對（Finite-momentum Cooper pairing）機制的特徵。然而，我們的角度依賴性測量顯示出獨特的對稱性特徵，這可能反映了 $"PtTe"_2$ 表面態具體的自旋織構差異。

總體而言，本研究採用非對稱 SQUID 技術，不僅驗證了先前基於傳輸測量（Transport）的發現，更提供了關於超導電流相位動力學的細緻資訊，補充了現有文獻在相位敏感性測量方面的不足。

== 製備技術挑戰 <section-fabrication-challenges>

// Fabrication Challenges
// 製備過程中遇到的技術挑戰與解決方案

在$"PtTe"_2$基礎超導元件的製備過程中，遇到了多項技術挑戰，這些挑戰直接影響了最終元件的電學特性與量測結果的可靠性。

=== 薄片尺寸與厚度控制 <subsection-flake-size-thickness>

// Flake Size and Thickness
// 本小節內容有待補充

二維材料薄片（Flake）的尺寸與厚度控制是影響元件性能的關鍵因素。機械剝離法（Mechanical Exfoliation）獲得的$"PtTe"_2$薄片在尺寸分佈和厚度均勻性方面存在固有的變異性。

// 待補充：具體的尺寸要求、厚度對電學特性的影響、改進策略

=== 過渡金屬二硫屬化物表面保護與殘留物清除 <subsection-tmd-surface-protection>

// TMD Surface Protection and Residues Cleaning
// 本小節內容有待補充

過渡金屬二硫屬化物（Transition Metal Dichalcogenide, TMD）材料表面的保護與清潔是確保高品質歐姆接觸（Ohmic Contact）的重要步驟。在電子束微影（Electron Beam Lithography, EBL）與後續製程中，如何有效保護材料表面並完全清除製程殘留物是製備成功的關鍵。

// 待補充：具體的表面處理方法、殘留物的來源與影響、清除技術的比較

=== 濺鍍超導電極的側壁問題 <subsection-sputtered-leads-sidewall>

// Side-Wall Issue of Sputtered Superconducting Leads
// 本小節內容有待補充

磁控濺鍍（Magnetron Sputtering）製程中的側壁沉積問題會影響電極圖案的精確度與電學特性。特別是在製備細線寬的超導電極時，側壁效應可能導致短路或產生非預期的電流路徑。

// 待補充：側壁問題的具體表現、對元件性能的影響、解決方案與改進建議
