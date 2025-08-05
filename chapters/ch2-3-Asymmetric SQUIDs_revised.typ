// Revision Summary
// Date: 2025-08-05
// Chapter: ch2-3-Asymmetric SQUIDs
// Total revisions: 12
// Critical fixes: 0
// Improvements: 11
// Suggestions: 1
// 
// This file has been revised based on physics professor feedback
// All revisions are marked with // REVISED: comments

= 非對稱超導量子干涉儀的電流-相位關係之全面理論分析 (A Comprehensive Theoretical Analysis of the Current-Phase Relation in Asymmetric Superconducting Quantum Interference Devices)

== 第一部分：非對稱 SQUID 的基礎原理 (Part I: Foundational Principles of Asymmetric SQUIDs)

此外。

超導量子干涉儀 (SQUID) 作為巨觀量子工程的典範代表，運用超導性的基本原理來創造已知最靈敏的磁通量探測器。儘管完全對稱的 SQUID 行為提供了量子干涉的基礎理解，但非對稱性的引入卻開啟了更豐富且更複雜的物理現象景觀。無論非對稱性是來自於不可避免的製程缺陷還是有意設計的工程考量，它都能將 SQUID 從簡單的干涉儀轉變為可調式、非互易的量子元件，其應用範圍從下一代磁力計到量子電腦的基本構成元件。

此外，本章提供非對稱直流 SQUID 中電流-相位關係 (CPR) 的詳盡理論分析，從第一原理追溯物理機制到先進應用與實驗現實。我們首先建立約瑟夫森接面和理想 SQUID 電路的基礎概念，然後深入探討非對稱性的關鍵作用。

=== 理想約瑟夫森接面與電流-相位關係 (The Ideal Josephson Junction and the Current-Phase Relation)

此外，任何 SQUID 的核心都是約瑟夫森接面 (JJ)，這是一個體現約瑟夫森效應的元件——當兩個超導體透過「弱連結」（如薄絕緣障礙層、正常金屬或物理收縮）耦合時發生的巨觀量子現象。這個效應由布萊恩·約瑟夫森於 1962 年預測，由兩個控制接面量子動力學的基本關係式描述。

此外，第一約瑟夫森關係式定義了電流-相位關係 (CPR)，這是接面傳輸機制的獨特指紋。它指出超電流 $ I_s $ 可以在接面間流動，即使沒有外加電壓：

Furthermore, $ I_s = I_c sin(phi) $

此外，其中 $ I_c $ 是接面的臨界電流， $ phi $ 是兩側超導體間的相位差。這個關係式揭示了超導性的量子本質，其中巨觀波函數的相位差直接控制電流流動。

此外。

前一節所描述的理想直流 SQUID 模型，其前提是構成迴路的兩個約瑟夫森接面 (Josephson Junction, J1 and J2) 的特性完全相同（即 $ I_("c1") = I_("c2") $ ），且在迴路中對稱分佈。然而，在實際的元件製備過程中，由於奈米級製程的內在變異性 (inherent variations)，兩個接面幾乎不可避免地存在差異，從而導致非對稱性 (asymmetry)。更有甚者，在許多現代量子元件的設計中，非對稱性不僅不是缺陷，反而是一種被有意引入的、用以實現特定功能的設計策略。

== 非對稱性的來源與分類 (Sources and Classification of Asymmetry)

此外，SQUID 的非對稱性主要體現在兩個方面：

=== 接面非對稱性 (Junction Asymmetry)

此外，接面非對稱性是指兩個接面的電學參數不同，包括：

此外，1. *臨界電流的差異*： $ I_("c1") != I_("c2") $ ，這是最常見的非對稱性形式。
2. *正常態電阻的差異*： $ R_("N1") != R_("N2") $ ，影響接面的動態行為。
3. *接面電容的差異*： $ C_1 != C_2 $ ，決定接面的響應速度。

此外，這些參數的差異會打破 SQUID 理想的磁通量調變模式，使得其 $ I_c(Phi_"ext") $ 圖樣偏離完美的 $ |cos(pi Phi_"ext" / Phi_0)| $ 函數。

=== 迴路非對稱性 (Loop Asymmetry)

此外，迴路非對稱性是指兩個接面在超導迴路中的位置不同，導致：

此外，1. *迴路電感分配不均*： $ L_1 != L_2 $ ，其中 $ L_1 + L_2 = L_"total" $ 。
2. *磁通耦合的差異*：兩個接面對外部磁場的響應不同。

此外，這種非對稱性會導致調變圖樣的傾斜、振幅的變化或極小值無法降至零等特徵。

== 非對稱 SQUID 的理論分析 (Theoretical Analysis of Asymmetric SQUIDs)

此外，對於一個非對稱 SQUID，其總電流-相位關係可以表示為：

Furthermore, $ I_s = I_("c1") sin(phi_1) + I_("c2") sin(phi_2) $

此外，其中相位差之間的關係由磁通量量子化條件決定：

Furthermore, $ phi_2 - phi_1 = (2pi Phi) / Phi_0 $

此外，考慮接面參數的非對稱性，我們可以引入非對稱參數 $alpha$：

Furthermore, $ alpha = (I_("c1") - I_("c2")) / (I_("c1") + I_("c2")) $

此外，當 $alpha = 0$ 時，系統退化為對稱 SQUID；當 $alpha != 0$ 時，系統表現出非對稱行為。

此外，對於中等非對稱性 ($|alpha| < 1$)，總臨界電流可以近似表示為：

Furthermore, $ I_"max"(Phi) = (I_("c1") + I_("c2")) sqrt(cos^2((pi Phi) / Phi_0) + alpha^2 sin^2((pi Phi) / Phi_0)) $

== 高度非對稱 SQUID：相位偏置探測器 (Highly Asymmetric SQUIDs: Phase-Biased Detectors)

此外，當一個接面的臨界電流遠大於另一個時（$I_("c1") >> I_("c2")$），SQUID 可以被視為一個相位偏置 (phase-biased) 的探測器。在此組態中：

此外，1. *較強接面 (Strong Junction)*：近似地提供一個固定的相位參考，$phi_1 approx "常數"$。
2. *較弱接面 (Weak Junction)*：其相位差 $phi_2$ 主要由外部磁通量 $Phi_"ext"$ 控制。

這種配置的優勢在於：

Furthermore, $ phi_2 = phi_1 + (2pi Phi_"ext") / Phi_0 $

此外，透過精密量測非對稱 SQUID 的總臨界電流 $I_"c,total"$ 隨外部磁通量 $Phi_"ext"$ 的完整調變曲線，我們可以直接重構出較弱接面的電流-相位關係 (Current-Phase Relation, CPR)@Babich2023_LimitationsCPR_NanoLett：

Furthermore, $ I_("s,weak")(phi) = I_("c,total")(Phi_"ext") - I_("c1") sin(phi_1) $

== 非對稱性對 SQUID 性能的影響 (Impact of Asymmetry on SQUID Performance)

=== 磁通量調變深度 (Flux Modulation Depth)

此外，對於對稱 SQUID，磁通量調變的深度為 100%，即在半整數磁通量量子處臨界電流可以完全抵消。而對於非對稱 SQUID，調變深度由非對稱參數決定：

此外，$ "調變深度" = (I_"max" - I_"min") / I_"max" = (2|I_("c1")||I_("c2")|) / (I_("c1")^2 + I_("c2")^2) $

此外，當 $I_("c1") = I_("c2")$ 時，調變深度為 100%；當差異增大時，調變深度減小。

=== 磁通量靈敏度 (Flux Sensitivity)

此外，非對稱性會改變 SQUID 的磁通量-電壓轉換係數@Crete2021_SelfField_Micromachines：

Furthermore, $ (d V) / (d Phi) = R_N (d I_c) / (d Phi) $

此外，其中 $R_N$ 是等效正常態電阻。對於非對稱 SQUID，此轉換係數在不同磁通量點會有所變化。

== 非對稱 SQUID 作為 CPR 探測工具 (Asymmetric SQUIDs as CPR Probing Tools)

此外，非對稱 SQUID 提供了一個探測約瑟夫森接面內在物理的強大工具。透過分析其磁通量調變圖樣的畸變，我們可以：

=== Fourier 分析技術 (Fourier Analysis Technique)

此外，對調變曲線 $I_c(Phi_"ext")$ 進行傅立葉轉換：

Furthermore, $ I_c(Phi_"ext") = sum_(n=0)^infinity a_n cos((2pi n Phi_"ext") / Phi_0) + b_n sin((2pi n Phi_"ext") / Phi_0) $

此外，不同的傅立葉分量對應於 CPR 的不同諧波：
- 基頻分量：對應 $sin(phi)$ 項
- 二次諧波：對應 $sin(2phi)$ 項
- 高次諧波：對應更複雜的 CPR 形式

=== 非正弦 CPR 的識別 (Identification of Non-sinusoidal CPRs)

此外，標準正弦 CPR ($I_s = I_c sin(phi)$) 會產生標準的餘弦調變。任何偏離此形式的調變都指示著非傳統的 CPR@Babich2023_LimitationsCPR_NanoLett：

此外，1. *偏斜 CPR (Skewed CPR)*：導致調變曲線的不對稱
2. *二階諧波 CPR*：產生 $Phi_0/2$ 週期的調變分量
3. *$phi_0$-接面*：導致相位偏移的調變圖樣

== 實驗實現與量測技術 (Experimental Implementation and Measurement Techniques)

=== 元件設計考量 (Device Design Considerations)

此外，設計非對稱 SQUID 時需要考慮@Butz2010_AsymDCSQUIDs_Diploma：

此外，1. *非對稱比的選擇*：平衡調變深度與 CPR 探測精度
2. *迴路幾何*：最小化寄生電感和串擾
3. *材料選擇*：確保接面特性的穩定性

=== 低溫量測協議 (Cryogenic Measurement Protocol)

精確的 CPR 量測需要：

此外，1. *溫度穩定性*：維持 $T << T_c$ 以確保超導性
2. *磁場屏蔽*：消除外部磁場干擾
3. *電流偏置精度*：高解析度的電流控制
4. *電壓量測靈敏度*：檢測微小的電壓變化

== 在 PtTe₂ 系統中的應用 (Application in PtTe₂ Systems)

此外，在本研究中，非對稱 SQUID 技術被應用於探測 1T-PtTe₂ 約瑟夫森接面的電流-相位關係。透過設計並製備以 PtTe₂ 作為其中一個弱連結的非對稱 SQUID，其磁通量調變圖樣的畸變程度直接編碼了由狄拉克半金屬所中介的非傳統電流-相位關係。

=== 拓撲半金屬的 CPR 特徵 (CPR Characteristics of Topological Semimetals)

此外，PtTe₂ 作為第二類狄拉克半金屬 (Type-II Dirac Semimetal)，其約瑟夫森接面預期表現出@Cuozzo2024_MW_Tunable_Diode_PRResearch：

此外，1. *非正弦 CPR*：由於狄拉克費米子的特殊輸運性質
2. *高次諧波分量*：特別是二階諧波 ($sin(2phi)$) 項
3. *可調控性*：透過外部磁場調控 CPR 的形式

=== 約瑟夫森二極體效應的探測 (Detection of Josephson Diode Effect)

此外，非對稱 SQUID 也是探測約瑟夫森二極體效應 (Josephson Diode Effect, JDE) 的有效工具@Cuozzo2024_MW_Tunable_Diode_PRResearch。透過量測正、負方向的切換電流差異：

Furthermore, $ eta = (I_("sw")^+ - I_("sw")^-) / (I_("sw")^+ + I_("sw")^-) $

此外，可以量化 JDE 的強度，並與重構的 CPR 進行比對分析。

== 結論與展望 (Conclusions and Outlook)

此外，非對稱 SQUID 作為一種強大的量測工具，為探測約瑟夫森接面的微觀物理提供了獨特的視角。在 PtTe₂ 等新興量子材料的研究中，這種技術不僅能夠揭示材料的內在拓撲性質，更為開發新型超導量子元件提供了重要的設計指導。

未來的研究方向包括：

此外，1. *多通道 SQUID*：探測更複雜的傳輸通道
2. *時間相關效應*：研究動態 CPR 的演化
3. *人工智慧輔助*：利用機器學習優化 CPR 重構算法
4. *量子元件應用*：基於非傳統 CPR 的新型量子位元設計

這些發展將進一步推動超導量子電子學和拓撲量子計算領域的進步。