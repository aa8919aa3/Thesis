// 第二章之一：SQUID 電流-相位關係分析
// Chapter 2-1: SQUID Current-Phase Relation Analysis
#set par(first-line-indent: (amount: 2em, all: true))
#import "@preview/physica:0.9.3": *
#import "@preview/equate:0.3.2": equate
= 對稱型超導量子干涉儀中的電流-相位關係理論分析 <chapter-squid-cpr>

== 超導體中的巨觀量子現象導論 <section-intro>

超導量子干涉儀 (Superconducting Quantum Interference Device, SQUID) 是應用量子力學於工程領域的代表，其運作不僅受量子效應影響，更由量子效應在巨觀尺度上所支配。由於對磁通量極為靈敏，可量測至飛特斯拉 (femtotesla) 等級的弱磁場，SQUID 在生物磁學、地球物理探勘、基礎物理與量子運算等領域皆扮演關鍵角色。要理解 SQUID 的運作，必須先回顧超導性 (superconductivity) 的核心概念：巨觀量子凝聚態、磁場的排斥與磁通量子的量子化。這些概念構成理解約瑟夫森效應與 SQUID 內部量子干涉現象的理論基礎。

=== 庫柏對凝聚與巨觀波函數 <subsection-cooper-pair>

當材料被冷卻至臨界溫度 (critical temperature, $T_C$) 以下時，會發生劇烈的相變。1957 年 Bardeen、Cooper 與 Schrieffer 提出的 BCS 理論指出，在 $T<T_C$ 的條件下，電子間由聲子 (phonon) 所介導的微弱吸引力能克服庫倫斥力，使得動量與自旋相反的兩電子成對結合形成庫柏對 (Cooper pair)。
庫柏對的束縛能雖小，但在 $T<T_C$ 時足以超越熱能而維持穩定。由於兩電子合成整數自旋，庫柏對表現為玻色子，可大量佔據同一量子基態，形成類似玻色–愛因斯坦凝聚 (Bose–Einstein condensation) 的宏觀量子態。此時億兆計的庫柏對共享同一相位並協同運動，不會因雜質或晶格振動散射，這正是零電阻的微觀起源。
這個凝聚態可由單一複數波函數 $\Psi(\vec{r}) = \sqrt{n_s(\vec{r})}e^{i\phi(\vec{r})}$ 描述，其中 $n_s(\vec{r})$ 為庫柏對密度，$\phi(\vec{r})$ 為巨觀量子相位。在無外加電流與磁場時，單一超導體內的相位為常數。此一具有明確相位的巨觀波函數，是理解超導體特性及 SQUID 運作的核心理念。

=== 麥斯納效應 <subsection-meissner>

超導體與假想的「完美導體」最大的差異在於其會主動排斥磁通量，即麥斯納效應 (Meissner effect)。當材料在外加磁場下被冷卻至 $T_C$ 以下時，超導體表面會產生持續且無耗散的屏蔽電流 (screening current)，產生抵消外場的磁場，使內部磁場 $\vec{B}$ 為零。從巨觀電磁學觀點，超導體表現為完美抗磁體，其磁化率 $\chi=-1$。麥斯納效應反映了巨觀量子態對外部磁擾動的剛性，系統會耗費能量以維持其相干基態。

=== 超導環中的磁通子量子化 <subsection-fluxoid>

巨觀相位 $\phi(\vec{r})$ 在封閉超導環中帶來另一重要結果：磁通子 (fluxoid) 量子化。波函數必須在任意閉合路徑 $C$ 上保持單值性，故繞行一圈後相位差只能為 $2\pi$ 的整數倍，即 $\oint_C \nabla\phi\cdot d\vec{l} = 2\pi n$。將此條件與包含向量勢 $\vec{A}$ 的動量關係結合，可得磁通子量子化條件：

$\oint_C (\Lambda \vec{J_s}+\vec{A})\cdot d\vec{l} = n\frac{h}{2e} = n\Phi_0$，

其中 $\vec{J_s}$ 為超導電流密度，$\Phi_0=h/2e\approx2.07\times10^{-15}$ Wb 為磁通量子。若選擇路徑位於電流衰減為零的深處，便得磁通量本身的量子化 $\Phi = n\Phi_0$。此宏觀量子限制與約瑟夫森效應共同構成 SQUID 的運作基礎。

== 約瑟夫森接面：相干的量子弱連結 <section-jj>

SQUID 的核心元件為約瑟夫森接面，它在兩個超導電極間形成一個「弱連結」 (weak link)。Brian Josephson 於 1962 年預測此效應，描述庫柏對可相干穿隧於此接面。超導電流與相位差間的關係，即電流-相位關係 (Current-Phase Relation, CPR)，決定了接面的響應並形成 SQUID 內部的量子干涉現象。本節將介紹兩個約瑟夫森關係式與經典正弦 CPR。

=== 第一與第二約瑟夫森關係式 <subsection-josephson-rel>

典型的接面為超導體-絕緣體-超導體 (Superconductor–Insulator–Superconductor, S-I-S) 結構。雖然絕緣層在經典上阻止電流通過，但兩側超導體的巨觀波函數可在勢壘中重疊，使庫柏對穿隧而不破對。
第一約瑟夫森關係式 (DC Josephson effect) 指出，在無外加電壓的情況下，接面可以傳遞無耗散的超導電流 $I_s=I_c\sin\phi$，其中 $I_c$ 為臨界電流，$\phi$ 為兩側波函數的相位差。此式顯示電流是由相位差驅動，而非電壓。
第二約瑟夫森關係式 (AC Josephson effect) 描述當接面兩端施加電壓 $V$ 時，相位差隨時間演化的關係：$\frac{d\phi}{dt} = \frac{2e}{\hbar}V$。因此在固定電壓下，超導電流會以頻率 $f_J=(2e/h)V$ 震盪。此電壓與頻率間的精確關係已被用作電壓標準。

=== 正弦電流-相位關係 <subsection-sinusoidal-cpr>

... 

== 含有高次諧波的電流-相位關係 <section-higher-harm>

### 高次諧波對磁通調變圖樣的影響 <subsection-flux-pattern>

考慮兩個具相同 CPR 的對稱 SQUID，若每個接面具有兩階諧波：$I_s(\phi)=I_{c1}\sin\phi + I_{c2}\sin(2\phi)$，則總超導電流為兩分支電流之和。由於磁通量量子化條件 $\phi_2-\phi_1=2\pi\Phi/\Phi_0$，第一諧波產生 $\Phi_0$ 週期的調變，而第二諧波則具 $\Phi_0/2$ 週期。總臨界電流 $I_{\max}(\Phi)$ 需對平均相位 $\phi_{avg}$ 最大化，會形成不同週期成分疊加的複雜圖樣。透過對臨界電流曲線進行傅立葉分析，可反向推得接面 CPR 的諧波內容，讓對稱 SQUID 成為探測 CPR 的工具。

### 對元件效能與新應用的影響 <subsection-device>

非正弦 CPR 會影響 SQUID 的磁場靈敏度。以 RCSJ 模型為基礎的數值模擬顯示，在高透明度的 S-N-S 接面中常見的前偏式 CPR 會降低訊雜比。反之，若將 SQUID 視為具有特製非線性響應的元件，則可望應用於新型量子電路。例如，理論上若只允許兩對庫柏對 (charge-4e) 穿隧，CPR 將呈現純粹的 $\pi$ 週期。對稱 SQUID 在磁通量 $\Phi=\Phi_0/2$ 時可抑制第一諧波並強化第二諧波，因此能以傳統接面實現等效的 charge-4e 元件，為受保護量子位元提供可能途徑。

== 結論與展望 <section-conclusion>

本文建立了一套完整的理論框架，以理解對稱型直流 SQUID 的電流-相位關係。從庫柏對凝聚的巨觀波函數出發，導出了麥斯納效應與磁通量子化，再進一步介紹約瑟夫森接面與其 CPR。對稱 SQUID 中磁通量與 CPR 的結合，產生了以磁通量子為週期的臨界電流調變，類似雙狹縫干涉實驗。考量實際元件的非理想因素，如有限電感與熱噪聲，可看出 CPR 對元件動態與靈敏度的決定性影響。最後，我們討論了高次諧波 CPR 對 SQUID 的調變圖樣與量測能力的影響，以及在量子計算等新興應用中的潛力。未來隨著材料與製程的進步，對 CPR 的精確控制將持續推動超導電子學與量子資訊科技的發展。

== 參考文獻 <section-references>

#let _ = @cite[anderson_probable_1963; barone1982physics; clarke_low-frequency_1973; clarke_squid_2004; golubov_current-phase_2004; JOSEPHSON1962251; kleiner_superconducting_2004; likharev_superconducting_1979; tinkham_introduction_2015]
#bibliography("references.bib")
