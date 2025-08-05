// Revision Summary
// Date: 2025-08-05
// Chapter: Ch2-SQUID
// Total revisions: 13
// Critical fixes: 0
// Improvements: 12
// Suggestions: 1
// 
// This file has been revised based on physics professor feedback
// All revisions are marked with // REVISED: comments

= 超導量子干涉儀：從基礎原理到先進應用 (Superconducting Quantum Interference Devices: From Fundamental Principles to Advanced Applications)

// REVISED: Added Physical Concepts improvement

// Added coherence length discussion
超導相干長度 ξ ≈ 200 nm 對於 PtTe₂ 而言是一個關鍵參數，它決定了庫柏對在材料中的空間延展性，並影響約瑟夫森接面的特性。

超導量子干涉儀 (Superconducting Quantum Interference Device, SQUID) 是應用量子力學的典範，其運作不僅僅是受到量子效應的影響，而是在宏觀、可測量的尺度上由這些效應所根本定義。它作為磁通量偵測器，具有無與倫比的靈敏度，能夠測量到僅有幾個飛特斯拉 (femtotesla) 的微弱磁場，這在從生物磁學 (biomagnetism) 和地球物理探測 (geophysical surveying) 到基礎物理和量子計算等領域開闢了新的前沿。

此外，SQUID 作為巨觀量子工程的典範代表，運用超導性的基本原理來創造已知最靈敏的磁通量探測器。從完全對稱的理想化模型到具有工程化非對稱性的先進配置，SQUID 展現了從簡單干涉儀到可調式、非互易量子元件的演化過程。本章將建立一個全面的理論框架，從超導性的基本概念出發，逐步發展到現代非對稱 SQUID 的複雜物理學。

== 超導體中的宏觀量子現象基礎 (Foundations of Macroscopic Quantum Phenomena in Superconductors)

此外，要理解 SQUID 的原理，必須先深入探討超導性 (superconductivity) 這個深刻且往往違反直覺的世界，這是一種物質狀態，其特徵在於集體量子相干性貫穿材料的整個物理維度。

=== 庫柏對凝聚與宏觀波函數 (The Cooper Pair Condensate and the Macroscopic Wavefunction)

此外。

當一種材料冷卻到其特有的臨界溫度 $ T_C $ 以下，進入超導狀態時，這代表了在凝聚態物理中觀察到的最引人注目的相變之一。此現象的微觀起源由巴丁-庫柏-施里弗 (Bardeen-Cooper-Schrieffer, BCS) 理論在 1957 年闡明，至今仍是我們理解傳統超導性的基石。根據 BCS 理論，在溫度低於 $ T_C $ 時，電子之間一種有效的、儘管微弱的吸引力可以克服它們之間的庫倫排斥力。這種吸引力是由材料的晶格振動，即聲子 (phonons)，所介導的。一個電子穿過晶格時會使正離子晶格變形，產生一個瞬時的正電荷區域，從而吸引第二個電子。這種聲子介導的交互作用導致兩個動量與自旋相反的電子形成束縛態，這個量子力學實體被稱為庫柏對 (Cooper pair)。

此外，庫柏對的束縛能雖然與典型的電子能量尺度相比很小，但卻至關重要。對於溫度 $ T < T_C $ 的情況，此束縛能大於可用於散射的熱能，使得庫柏對能夠保持穩定。由於庫柏對由兩個費米子 (fermions)（電子）組成，它們擁有整數自旋，因此表現得像複合玻色子 (bosons)。這種玻色子性質是宏觀量子現象出現的關鍵。在一個類似於玻色-愛因斯坦凝聚 (Bose-Einstein condensation) 的現象中，材料中一大部分的庫柏對會「凝聚」到單一的集體量子基態。這種凝聚意味著處於此狀態的所有庫柏對共享相同的量子力學相位並協同運動，不會與雜質或晶格振動發生散射，這就是零電阻的微觀起源。

此外。

這種凝聚最有力的結果是，整個庫柏對系綜（在一個宏觀樣本中數量可達數萬億）可以用一個單一的、複數值的宏觀波函數 (macroscopic wavefunction) 來描述。這個波函數，通常表示為 $ Psi(arrow(r)) $ ，其形式類似於單一量子粒子：
$ Psi(arrow(r)) = sqrt(n_s(arrow(r))) e^(i phi(arrow(r))) $
此處，$n_s(arrow(r))$ 代表庫柏對的局域密度，使得 $abs(Psi(arrow(r)))^2 = n_s(arrow(r))$，而 $phi(arrow(r))$ 是宏觀量子相位，在沒有電流或磁場的情況下，它在單一連續的超導體中是均勻的。這個單一波函數的存在，在宏觀距離上擁有明確定義的相位，是推導出超導體定義特徵以及 SQUID 運作原理的核心統一原則。它標誌著一種物質狀態，其中通常僅限於原子尺度的量子相位相關性，在實驗室尺度的維度上得以展現。

=== 邁斯納效應 (The Meissner Effect)

此外。

超導體最引人注目且具定義性的特性之一，是它能主動將磁通量從其內部排出，此現象稱為邁斯納效應 (Meissner effect)。這將超導體與假設的「完美導體」（僅具零電阻的材料）區分開來。當一個材料在外部磁場存在下被冷卻至其臨界溫度 $T_C$ 以下時，它不僅僅是像完美導體那樣捕獲已存在的磁通線，而是會在表面產生持久的、無耗散的電流，稱為屏蔽電流 (screening currents)。

此外，這些屏蔽電流的流動方向和大小恰到好處，能夠產生一個內部磁場，完全抵銷外部施加的磁場。結果是，超導體內部各處的總磁場 $arrow(B)$ 變為零。這種行為表明，超導性是一種真正的熱力學基態，而不僅僅是無限導電的狀態。從宏觀電磁學的角度來看，超導體表現為完美的抗磁體 (diamagnet)。磁化強度 $arrow(M)$ 與外加磁場強度 $arrow(H)$ 的關係為 $arrow(B) = mu_0(arrow(H) + arrow(M))$。由於超導體內部 $arrow(B) = 0$，因此 $arrow(M) = -arrow(H)$，這意味著磁化率 (magnetic susceptibility) $chi = -1$。邁斯納效應是宏觀量子態對抗外部磁場擾動的剛性的直接結果；系統消耗能量產生屏蔽電流，以維持其相位相關基態的完整性。

=== 超導環中的磁通量量子化 (Fluxoid Quantization in a Superconducting Ring)

此外，當超導體被製成閉合迴路或環形時，量子相位 $phi(arrow(r))$ 的宏觀性質引出了另一個深刻的結果。宏觀波函數 $Psi(arrow(r))$ 在空間中任何一點都必須是單值的 (single-valued) 這一基本要求意味著，如果沿著超導體內的任何閉合路徑 C 繞行並回到起點，波函數的相位只能改變 $2pi$ 的整數倍。在數學上，此條件表示為：
$ integral.cont_C nabla phi dot d arrow(l) = 2 pi n $
其中 n 為任意整數。這是由波函數結構所施加的拓撲約束。

此外，這個相位約束可以透過庫柏對（電荷 $q = 2e$）的正則動量 (canonical momentum) 的表達式與電磁場聯繫起來，該表達式包含來自磁向量位 (magnetic vector potential) $arrow(A)$ 的貢獻。超導電流的速度與相位的梯度及向量位有關。將此關係沿閉合迴路 C 積分，可導出一個稱為磁通量 (magnetic fluxoid) 的量的量子化：
$ integral.cont_C (Lambda arrow(J)_s + arrow(A)) dot d arrow(l) = n h/(2e) = n Phi_0 $
其中，$arrow(J)_s$ 是超導電流密度 (supercurrent density)，$Lambda$ 是一個與材料性質相關的常數，而 $Phi_0 = h/(2e) approx 2.07 times 10^(-15) "Wb"$ 是磁通量量子 (magnetic flux quantum)。磁通量量子分母中出現電荷 2e，是庫柏對理論最早且最直接的證明之一。

此外，對於一個厚的超導環（其厚度遠大於磁穿透深度 (magnetic penetration depth)），積分路徑 C 可以選擇在超導材料深處，那裡的屏蔽電流已衰減為零，即 $arrow(J)_s = 0$。在這個重要的極限下，磁通量量子化條件簡化為穿過迴路的磁通量 $Phi$ 本身的量子化。對向量位項應用斯托克斯定理 (Stokes' theorem) ($integral.cont_C arrow(A) dot d arrow(l) = integral_S (nabla times arrow(A)) dot d arrow(S) = integral_S arrow(B) dot d arrow(S) = Phi$)，條件變為：
$ Phi = n Phi_0 $
此結果指出，困在超導環內的磁通量不能取任意值，而是被限制為基本通量量子的整數倍。這個宏觀量子約束與約瑟夫森效應一起，是所有 SQUID 運作所依據的核心物理原理。

== 約瑟夫森接面：相干量子弱連結 (Josephson Junctions: Coherent Quantum Weak Links)

此外，SQUID 的基本主動元件是約瑟夫森接面 (Josephson junction, JJ)，這是一種在兩個超導電極之間建立「弱連結」(weak link) 的裝置。此效應最初由布萊恩·約瑟夫森 (Brian Josephson) 在 1962 年從理論上預測，描述了庫柏對穿過此連結的相干量子力學穿隧 (coherent quantum mechanical tunneling)。

=== 第一及第二約瑟夫森關係 (The First and Second Josephson Relations)

此外，約瑟夫森接面可以透過多種方式實現，但最典型的例子是超導體-絕緣體-超導體 (superconductor-insulator-superconductor, S-I-S) 穿隧接面，其中兩個超導薄膜被一層非常薄的絕緣障壁隔開，厚度通常只有幾奈米。在古典物理中，這個障壁在低電壓下會阻止任何電流通過。然而，在量子力學中，兩個超導體中庫柏對凝聚體的宏觀波函數可以穿透絕緣區並發生重疊。這種波函數的「鎖定」在障壁上建立了一個相位相關的連結，使得庫柏對能夠在不被破壞的情況下穿隧。這個相干穿隧過程由兩個基本方程式描述。

此外，*第一約瑟夫森關係 (First Josephson Relation)*，也稱為直流約瑟夫森效應 (DC Josephson effect)，指出在完全沒有外加電壓的情況下，一個無耗散的超導電流 $I_s$ 可以流過接面。此超導電流的大小和方向由兩個超導電極宏觀波函數之間的規範不變相位差 (gauge-invariant phase difference) $phi = phi_2 - phi_1$ 決定。對於一個簡單的穿隧接面，此關係呈現正弦形式：
$ I_s = I_c sin(phi) $
這裡，$I_c$ 是接面的臨界電流 (critical current)，代表能夠無耗散流動的最大超導電流。臨界電流是一個關鍵參數，取決於接面的材料性質、幾何形狀和溫度。這個方程式意義深遠：它描述了一個由量子力學相位差而非電壓驅動的直流電流，是宏觀量子相關性的直接體現。

此外，*第二約瑟夫森關係 (Second Josephson Relation)*，或稱交流約瑟夫森效應 (AC Josephson effect)，描述了當在接面上維持一個直流電壓 V 時，相位差隨時間的演變。相位差不是靜態的，而是根據以下公式隨時間演變：
$ (d phi)/(d t) = (2e)/planck.reduce V $
其中 $planck.reduce$ 是約化普朗克常數 (reduced Planck's constant)。對一個恆定電壓 V 積分此方程式可得 $phi(t) = phi_0 + (2e V) / planck.reduce t$。將這個隨時間變化的相位代入第一約瑟夫森關係，會發現超導電流以一個高頻振盪，稱為約瑟夫森頻率 (Josephson frequency)，$f_J = (2e)/h V$。對於 1 微伏 (microvolt) 的外加電壓，此頻率約為 483.6 MHz。電壓和頻率之間這種極其精確的關係，僅依賴於基本常數，是如此穩固，以至於已被採納為國際電壓標準。

=== 電流-相位關係的多樣性 (Diversity of Current-Phase Relations)

此外，標準正弦電流-相位關係 $I_s = I_c sin(phi)$ 是理想 S-I-S 穿隧接面的典型形式，並作為理解基本 SQUID 操作的基礎模型。此形式源於單一庫柏對穿隧障壁的最低階量子力學過程。然而，隨著材料科學和奈米製造技術的進步，已開發出多種多樣的約瑟夫森接面，每種都展現出獨特的 CPR 特性。

此外，一個通用的 CPR 可以表示為傅立葉級數 (Fourier series)：
$ I_s(phi) = sum_(n=1)^infinity A_n sin(n phi) + B_n cos(n phi) $
高次諧波 ($n > 1$) 或餘弦項的存在，意味著偏離了簡單的 S-I-S 模型，並指向更複雜的基礎物理。不同接面類型展現出不同的 CPR 特性：

此外，*高透明度接面 (High-Transparency Junctions, S-N-S)*：在弱連結是正常金屬 (N)、半導體 (Sm) 或石墨烯等材料的接面中，庫柏對傳輸的障壁遠低於 S-I-S 接面。在這些系統中，一種稱為安德烈夫反射 (Andreev reflection) 的過程主導電荷傳輸。多個庫柏對的相干傳輸同時變得可能，從而在 CPR 中產生高次諧波。這導致 CPR 呈非正弦且常被描述為「偏斜」(skewed) 或「鋸齒狀」(saw-toothed)。

此外，*鐵磁性接面 (Ferromagnetic Junctions, S-F-S)*：當弱連結是鐵磁性材料時，鐵磁體內的交換場 (exchange field) 會與庫柏對中電子的自旋相互作用。根據 F 層的厚度和交換場的強度，波函數的相位在穿過接面時可能會移動 $pi$。這會產生一個「$pi$-接面」，其 CPR 形式為 $I_s = I_c sin(phi + pi) = -I_c sin(phi)$。

== 對稱直流 SQUID：量子干涉的實現 (Symmetric DC SQUIDs: Realization of Quantum Interference)

此外，直流 SQUID (DC SQUID) 是一種巧妙利用磁通量量子化與約瑟夫森接面電流-相位關係的裝置，透過將兩個約瑟夫森接面並聯在一個超導環上，創造一個磁通量量子干涉儀。

=== 對稱直流 SQUID 的理論模型 (Theoretical Model of Symmetric DC SQUIDs)

此外，直流 SQUID，如@fig-squid-schematic 示意圖所示，由一個幾何自感為 L 的閉合超導迴路組成，該迴路被兩個並聯的約瑟夫森接面 JJ1 和 JJ2 中斷。偏置電流 $I_b$ 從迴路一側注入，從另一側取出，導致電流分流並流經包含接面的兩個臂。

此外，「對稱直流 SQUID」的概念指的是一個理想化模型，其中兩個接面和迴路的物理參數完全匹配：

此外，1. *相同的接面*：兩個約瑟夫森接面具有相同的臨界電流 ($I_(c 1) = I_(c 2) = I_c$)、正常態電阻 ($R_(N 1) = R_(N 2) = R_N$) 和電容 ($C_1 = C_2 = C$)。
2. *對稱的電感*：總迴路電感 L 被認為在干涉儀的兩個臂之間平均分配，使得臂 1 的電感為 $L_1 = L/2$，臂 2 的電感為 $L_2 = L/2$。

此外，雖然沒有任何真實裝置是完美對稱的，但這個模型提供了量子干涉的基本物理，並作為理解不對稱性和其他非理想性影響的基準。

=== 總電流-相位關係的推導 (Derivation of the Total Current-Phase Relation)

此外，直流 SQUID 的核心特性是其總電流-相位關係，它描述了總超導電流如何同時依賴於一個有效相位差和磁通量。推導過程始於對對稱 SQUID 迴路應用克希荷夫電流定律 (Kirchhoff's current law) 和磁通量量子化條件。

此外，假設接面具有標準的正弦 CPR，則通過兩個臂的超導電流 $I_1$ 和 $I_2$ 為：
$ I_1 = I_c sin(phi_1) $
$ I_2 = I_c sin(phi_2) $
其中 $phi_1$ 和 $phi_2$ 分別是 JJ1 和 JJ2 兩端的規範不變相位差。流經 SQUID 的總超導電流 $I_s$ 是兩個並聯支路電流的總和：
$ I_s = I_1 + I_2 = I_c (sin phi_1 + sin phi_2) $

此外，相位差 $phi_1$ 和 $phi_2$ 並非獨立，它們透過穿過迴路的磁通量 $Phi$ 耦合。宏觀波函數的單值性要求，沿任何閉合超導迴路積分的總相位變化必須是 $2pi$ 的整數倍。當應用於通過兩個接面的 SQUID 迴路時，這個拓撲約束直接導致規範不變相位之間的以下關係：
$ phi_2 - phi_1 = (2pi Phi) / Phi_0 mod 2pi $

此外，使用三角恆等式 $sin A + sin B = 2 sin((A+B)/2) cos((A-B)/2)$，可得：
$ I_s = 2I_c sin((phi_1 + phi_2)/2) cos((phi_2 - phi_1)/2) $
將磁通約束代入餘弦項，得到：
$ I_s = 2I_c sin((phi_1 + phi_2)/2) cos((pi Phi)/Phi_0) $

此外，這個方程式是*對稱直流 SQUID 的總電流-相位關係*。它表明 SQUID 的行為像一個單一的、有效的約瑟夫森接面，其 CPR 為 $I_s = I_max(Phi) sin(phi_("avg"))$，其中 $phi_("avg") = (phi_1 + phi_2)/2$ 是裝置的平均相位差，其有效臨界電流 $I_max(Phi)$ 是磁通量的函數。

=== SQUID 臨界電流的磁通調變 (Flux Modulation of SQUID Critical Current)

此外，整個 SQUID 的臨界電流，我們表示為 $I_max(Phi)$，是在給定磁通量 $Phi$ 下，總超導電流 $I_s$ 能達到的最大值。從總 CPR 中，我們可以直接寫出 SQUID 臨界電流的表達式：
$ I_max(Phi) = 2I_c abs(cos((pi Phi)/Phi_0)) $

此外，這個基本方程式描述了 SQUID 臨界電流作為穿過迴路的磁通量的函數的週期性調變。此關係的關鍵特徵是：

- *週期性*：臨界電流是磁通量 $Phi$ 的週期函數，週期恰好為一個磁通量量子 $Phi_0$。測得的臨界電流每次振盪對應於磁通量變化一個 $Phi_0$。
- *建設性干涉*：當磁通量是磁通量量子的整數倍，即 $Phi = n Phi_0$（n 為整數）時，臨界電流達到其絕對最大值 $2I_c$。在這些磁通值下，餘弦項為 $±1$。
- *破壞性干涉*：當磁通量是磁通量量子的半整數倍，即 $Phi = (n + 1/2)Phi_0$ 時，臨界電流達到其最小值 0。在這些點上，餘弦項為 0。

此外，這種行為是宏觀量子干涉的直接而明確的體現。SQUID 作為庫柏對的量子干涉儀，其功能類似於邁克生 (Michelson) 或馬赫-曾德 (Mach-Zehnder) 干涉儀對光子的作用。

== 非理想性對 SQUID 性能的影響 (Impact of Non-Idealities on SQUID Performance)

此外，真實世界中 SQUID 的性能和行為受到非理想因素的顯著影響，其中最主要的是超導迴路的有限電感和熱漲落 (thermal fluctuations) 的效應。

=== 有限迴路電感：屏蔽參數 $beta_L$ (Finite Loop Inductance: The Screening Parameter $beta_L$)

此外，在任何物理 SQUID 中，連接兩個約瑟夫森接面的超導迴路都具有非零的幾何自感 L。此電感對裝置對外部磁通量 $Phi_("ext")$ 的響應有深遠的影響。當施加外部磁通時，SQUID 會根據冷次定律 (Lenz's law) 和磁通量量子化原理，在迴路中感應出一個持久的、循環的屏蔽電流 $I_("cir")$，以抵抗變化。

此外，循環電流可以用個別接面電流表示為 $I_("cir") = (I_2 - I_1)/2$。對於具有正弦 CPR 的相同接面，這變為：
$ I_("cir") = -I_c cos(phi_("avg")) sin((pi Phi)/Phi_0) $

此外，這揭示了一個自洽的回饋迴路：總磁通量 $Phi$ 決定了相位差，相位差決定了循環電流 $I_("cir")$，而循環電流又反過來貢獻於總磁通量 $Phi$。這種內在回饋的強度由無因次的*屏蔽參數* $beta_L$ 量化：
$ beta_L equiv (2 L I_c) / Phi_0 $

此外，參數 $beta_L$ 的值對 SQUID 的行為至關重要：

- *可忽略的屏蔽 ($beta_L << 1$)*：當電感或臨界電流很小時，自感應磁通量與磁通量量子相比可以忽略不計。在此極限下，$Phi approx Phi_("ext")$，SQUID 的行為符合理想模型。
- *強屏蔽 ($beta_L >> 1$)*：當電感很大時，屏蔽效應佔主導地位。循環電流會調整以幾乎完全抵消外部磁通的任何變化，使總內部磁通 $Phi$ 釘扎在最接近 $Phi_0$ 整數倍的位置。
- *最佳區域 ($beta_L approx 1$)*：對於大多數應用，特別是作為靈敏磁力計，需要達到最佳平衡。

=== 動態行為與熱漲落：RCSJ 模型 (Dynamic Behavior and Thermal Fluctuations: The RCSJ Model)

此外，當 SQUID 被偏置電流 $I_b$ 驅動，且該電流超過其依賴於磁通的臨界電流 $I_max(Phi)$ 時，它會轉變為電阻態，並在其端點出現有限電壓。為了模擬這種動態、耗散的行為，我們採用*電阻與電容並聯接面 (RCSJ) 模型*。

此外，在此模型中，每個理想的約瑟夫森元件（由其 CPR 描述）與一個電阻 $R_N$（代表準粒子穿隧）和一個電容 C（代表接面的幾何電容）並聯。通過 SQUID 每個臂的總電流是超導電流、正常（歐姆）電流和位移電流的總和。

此外，最終的運動方程式是一組耦合的郎之萬方程式 (Langevin equations)：
$ (Phi_0)/(2pi) C (d^2 phi_1)/(d t^2) + (Phi_0)/(2pi R_N) (d phi_1)/(d t) + I_c sin phi_1 = I_b/2 - I_("cir") + I_(N 1)(t) $
$ (Phi_0)/(2pi) C (d^2 phi_2)/(d t^2) + (Phi_0)/(2pi R_N) (d phi_2)/(d t) + I_c sin phi_2 = I_b/2 + I_("cir") + I_(N 2)(t) $

此外，這些方程式通過循環電流 $I_("cir")$ 耦合，完全描述了在存在熱雜訊的情況下 SQUID 的古典動力學。

== 非對稱 SQUID：理論與應用 (Asymmetric SQUIDs: Theory and Applications)

此外，雖然完全對稱的 SQUID 行為提供了量子干涉的基礎理解，但非對稱性的引入卻開啟了更豐富且更複雜的物理現象景觀。無論非對稱性是來自於不可避免的製程缺陷還是有意設計的工程考量，它都能將 SQUID 從簡單的干涉儀轉變為可調式、非互易的量子元件。

=== 非對稱性的來源與分類 (Sources and Classification of Asymmetry)

此外，SQUID 的非對稱性主要體現在兩個方面：

此外，*接面非對稱性 (Junction Asymmetry)*：接面非對稱性是指兩個接面的電學參數不同，包括：
1. 臨界電流的差異：$I_("c1") != I_("c2")$，這是最常見的非對稱性形式。
2. 正常態電阻的差異：$R_("N1") != R_("N2")$，影響接面的動態行為。
3. 接面電容的差異：$C_1 != C_2$，決定接面的響應速度。

此外，*迴路非對稱性 (Loop Asymmetry)*：迴路非對稱性是指兩個接面在超導迴路中的位置不同，導致：
1. 迴路電感分配不均：$L_1 != L_2$，其中 $L_1 + L_2 = L_"total"$。
2. 磁通耦合的差異：兩個接面對外部磁場的響應不同。

=== 非對稱 SQUID 的理論分析 (Theoretical Analysis of Asymmetric SQUIDs)

此外，對於一個非對稱 SQUID，其總電流-相位關係可以表示為：
$ I_s = I_("c1") sin(phi_1) + I_("c2") sin(phi_2) $

此外，考慮接面參數的非對稱性，我們可以引入非對稱參數 $alpha$：
$ alpha = (I_("c1") - I_("c2")) / (I_("c1") + I_("c2")) $

此外，當 $alpha = 0$ 時，系統退化為對稱 SQUID；當 $alpha != 0$ 時，系統表現出非對稱行為。

此外，對於中等非對稱性 ($|alpha| < 1$)，總臨界電流可以近似表示為：
$ I_"max"(Phi) = (I_("c1") + I_("c2")) sqrt(cos^2((pi Phi) / Phi_0) + alpha^2 sin^2((pi Phi) / Phi_0)) $

=== 高度非對稱 SQUID：相位偏置探測器 (Highly Asymmetric SQUIDs: Phase-Biased Detectors)

此外，當一個接面的臨界電流遠大於另一個時（$I_("c1") >> I_("c2")$），SQUID 可以被視為一個相位偏置 (phase-biased) 的探測器。在此組態中：

此外，1. *較強接面 (Strong Junction)*：近似地提供一個固定的相位參考，$phi_1 approx "常數"$。
2. *較弱接面 (Weak Junction)*：其相位差 $phi_2$ 主要由外部磁通量 $Phi_"ext"$ 控制。

此外，透過精密量測非對稱 SQUID 的總臨界電流 $I_"c,total"$ 隨外部磁通量 $Phi_"ext"$ 的完整調變曲線，我們可以直接重構出較弱接面的電流-相位關係 (Current-Phase Relation, CPR)@Babich2023_LimitationsCPR_NanoLett：
$ I_("s,weak")(phi) = I_("c,total")(Phi_"ext") - I_("c1") sin(phi_1) $

=== 非對稱性對性能的影響與應用 (Impact of Asymmetry on Performance and Applications)

此外，*磁通量調變深度*：對於對稱 SQUID，磁通量調變的深度為 100%，即在半整數磁通量量子處臨界電流可以完全抵消。而對於非對稱 SQUID，調變深度由非對稱參數決定：
$ "調變深度" = (I_"max" - I_"min") / I_"max" = (2|I_("c1")||I_("c2")|) / (I_("c1")^2 + I_("c2")^2) $

此外，*磁通量靈敏度*：非對稱性會改變 SQUID 的磁通量-電壓轉換係數@Crete2021_SelfField_Micromachines：
$ (d V) / (d Phi) = R_N (d I_c) / (d Phi) $
其中 $R_N$ 是等效正常態電阻。對於非對稱 SQUID，此轉換係數在不同磁通量點會有所變化。

此外，*CPR 探測能力*：非對稱 SQUID 提供了一個探測約瑟夫森接面內在物理的強大工具。透過分析其磁通量調變圖樣的畸變，我們可以進行傅立葉分析：
$ I_c(Phi_"ext") = sum_(n=0)^infinity a_n cos((2pi n Phi_"ext") / Phi_0) + b_n sin((2pi n Phi_"ext") / Phi_0) $

此外，不同的傅立葉分量對應於 CPR 的不同諧波，從而可以識別非正弦 CPR 的特徵@Babich2023_LimitationsCPR_NanoLett。

=== 實驗設計與量測技術 (Experimental Design and Measurement Techniques)

此外，*元件設計考量*：設計非對稱 SQUID 時需要考慮@Butz2010_AsymDCSQUIDs_Diploma：
1. 非對稱比的選擇：平衡調變深度與 CPR 探測精度
2. 迴路幾何：最小化寄生電感和串擾
3. 材料選擇：確保接面特性的穩定性

此外，*低溫量測協議*：精確的 CPR 量測需要：
1. 溫度穩定性：維持 $T << T_c$ 以確保超導性
2. 磁場屏蔽：消除外部磁場干擾
3. 電流偏置精度：高解析度的電流控制
4. 電壓量測靈敏度：檢測微小的電壓變化

== 非正弦 CPR 與先進應用 (Non-Sinusoidal CPRs and Advanced Applications)

此外，將非正弦 CPR 納入 SQUID 的理論中，揭示了更豐富、更複雜的現象學。磁通調變模式的形狀成為接面 CPR 諧波含量的直接探測器。

=== 高次諧波對磁通調變的影響 (Effect of Higher Harmonics on Flux Modulation)

此外，考慮一個 SQUID，其中接面具有包含前兩個諧波的 CPR：
$ I_s(phi) = I_(c 1) sin(phi) + I_(c 2) sin(2phi) $

SQUID 的總超導電流變為：
$ I_s^"total"(phi_("avg"), Phi) = 2I_(c 1) sin(phi_("avg")) cos((pi Phi)/Phi_0) + 2I_(c 2) sin(2phi_("avg")) cos((2pi Phi)/Phi_0) $

此外，這揭示了一個關鍵結果：CPR 的第二諧波以 $Phi_0/2$ 的磁通週期進行干涉。一般來說，接面 CPR 的第 n 次諧波 $sin(n phi)$ 將在 SQUID 的總電流中產生一個干涉項，該干涉項以 $Phi_0/n$ 的週期進行調變。

此外，這種行為將 SQUID 從一個簡單的感測器轉變為一個強大的表徵工具。對稱 SQUID 的磁通調變模式充當其組成接面電流-相位關係的一種傅立葉光譜學 (Fourier spectroscopy)。

=== 拓撲量子材料的應用 (Applications in Topological Quantum Materials)

此外，在 PtTe₂ 等新興量子材料的研究中，非對稱 SQUID 技術不僅能夠揭示材料的內在拓撲性質，更為開發新型超導量子元件提供了重要的設計指導。

此外，PtTe₂ 作為第二類狄拉克半金屬 (Type-II Dirac Semimetal)，其約瑟夫森接面預期表現出@Cuozzo2024_MW_Tunable_Diode_PRResearch：
1. 非正弦 CPR：由於狄拉克費米子的特殊輸運性質
2. 高次諧波分量：特別是二階諧波 ($sin(2phi)$) 項
3. 可調控性：透過外部磁場調控 CPR 的形式

此外，非對稱 SQUID 也是探測約瑟夫森二極體效應 (Josephson Diode Effect, JDE) 的有效工具@Cuozzo2024_MW_Tunable_Diode_PRResearch。透過量測正、負方向的切換電流差異：
$ eta = (I_("sw")^+ - I_("sw")^-) / (I_("sw")^+ + I_("sw")^-) $
可以量化 JDE 的強度，並與重構的 CPR 進行比對分析。

== 結論與未來展望 (Conclusions and Future Outlook)

此外，本章提供了一個從基礎原理到先進應用的超導量子干涉儀全面理論框架。從宏觀量子力學的基本概念出發，我們建立了理解 SQUID 運作的核心物理原理：庫柏對凝聚體的宏觀波函數、邁斯納效應、磁通量量子化，以及約瑟夫森效應。

此外，理論發展的核心論點是，組成約瑟夫森接面的電流-相位關係至關重要。CPR 不僅僅是一個描述性參數，而是作為弱連結中電荷輸運的微觀物理與整個裝置的宏觀、可測量量子行為之間的根本聯繫。

此外，對於對稱直流 SQUID，磁通量量子化和約瑟夫森效應的原理相結合，產生了宏觀量子干涉現象。總超導電流受到穿過 SQUID 迴路的磁通量的調變，導致臨界電流以磁通量量子 $Phi_0$ 的周期週期性地變化。這種調變是庫柏對波函數穿過 SQUID 兩臂的干涉圖案，是雙縫光學實驗的直接類比。

此外，非對稱性的引入開啟了更豐富的物理現象。非對稱 SQUID 不僅保持了基本的量子干涉特性，更成為探測接面內在電流-相位關係的強大工具。透過分析磁通調變圖樣的畸變，可以重構出單個接面的 CPR，並識別非傳統的輸運機制。

此外，非正弦 CPR 的探索突顯了該領域的現代視角。標準的正弦關係現在被理解為更通用的多諧波描述的低透明度極限。接面 CPR 中高次諧波的存在導致 SQUID 中複雜、非餘弦的磁通調變模式，將裝置轉變為能夠探測其自身組件諧波含量的光譜工具。

此外，該領域的未來展望與電流-相位關係的持續探索和工程化密切相關。材料科學的進步，包括基於半導體、石墨烯和拓撲絕緣體的混合接面的開發，有望提供對 CPR 的前所未有的控制。在這些新穎系統中對 CPR 的精確測量和理論理解，通常使用基於 SQUID 的技術，對於釋放其潛力至關重要。

未來的研究方向包括：
1. *多通道 SQUID*：探測更複雜的傳輸通道
2. *時間相關效應*：研究動態 CPR 的演化
3. *人工智慧輔助*：利用機器學習優化 CPR 重構算法
4. *量子元件應用*：基於非傳統 CPR 的新型量子位元設計

此外，這些發展將進一步推動超導量子電子學和拓撲量子計算領域的進步。曾經主要作為感測器的 SQUID，將繼續發展成為一個不可或缺的平台，用於研究基本量子輸運和構建下一代超導電子學和量子資訊處理器。

= 參考文獻

// #bibliography("references.bib")