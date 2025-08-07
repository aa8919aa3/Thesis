// 第二章：理論背景
// Chapter 2: Theoretical Background
// 設定成段之文字首行皆空2字元
#set par(first-line-indent: (amount: 2em, all: true))
#import "@preview/physica:0.9.3": *
// 設定方程式編號格式
#import "@preview/equate:0.3.2": equate

= 理論背景 <chapter-theoretical-background>

本章節旨在建立理解本研究核心物理現象所需的理論框架。我們將從約瑟夫森效應的基本原理出發，接著介紹作為其關鍵應用的超導量子干涉儀（SQUID），並特別強調非對稱SQUID如何成為探測非傳統電流-相位關係（CPR）的有力工具。最後，我們將聚焦於本研究的核心材料——第二類狄拉克半金屬(type-II Dirac semimetal)二碲化鉑（$"PtTe"_2$），闡述其獨特的拓樸性質為何預期會產生可被SQUID所量測的非正弦CPR。

== 超導體中的宏觀量子現象基礎 Foundations of Macroscopic Quantum Phenomena in Superconductors <section-superconductivity>

超導性 (superconductivity)為超導量子元件的基石。本章節將介紹超導體的基本性質，並解釋約瑟夫森效應如何在超導體中產生宏觀量子現象。

=== 庫柏對凝聚與宏觀波函數 The Cooper Pair Condensate and the Macroscopic Wavefunction <subsection-cooper-pairs>

當一種材料冷卻到其特有的臨界溫度 $T_C$ 以下，進入超導狀態時，這代表了在凝聚態物理中觀察到的最引人注目的相變之一。此現象的微觀起源由巴丁-庫柏-施里弗 (Bardeen-Cooper-Schrieffer, BCS) 理論在 1957 年闡明，至今仍是我們理解傳統超導性的基石@bardeen_theory_1955 @bardeen_microscopic_1957 @bardeen_theory_1957 @schrieffer_theory_1999。根據 BCS 理論，在溫度低於 $T_C$ 時，電子之間一種有效的、儘管微弱的吸引力可以克服它們之間的庫倫排斥力。這種吸引力是由材料的晶格振動，即聲子 (phonons)，所介導的。一個電子穿過晶格時會使正離子晶格變形，產生一個瞬時的正電荷區域，從而吸引第二個電子。這種聲子介導的交互作用導致兩個動量與自旋相反的電子形成束縛態，這個量子力學實體被稱為庫柏對 (Cooper pair)。

庫柏對的束縛能雖然與典型的電子能量尺度相比很小，但卻至關重要。對於溫度 $T < T_C$ 的情況，此束縛能大於可用於散射的熱能，使得庫柏對能夠保持穩定。由於庫柏對由兩個費米子 (fermions)（電子）組成，它們擁有整數自旋，因此表現得像複合玻色子 (bosons)。這種玻色子性質是宏觀量子現象出現的關鍵。在一個類似於玻色-愛因斯坦凝聚 (Bose-Einstein condensation) 的現象中，材料中一大部分的庫柏對會「凝聚」到單一的集體量子基態。這種凝聚意味著處於此狀態的所有庫柏對共享相同的量子力學相位並協同運動，不會與雜質或晶格振動發生散射，這就是零電阻的微觀起源。

這種凝聚最有力的結果是，整個庫柏對系綜（在一個宏觀樣本中數量可達數萬億）可以用一個單一的、複數值的宏觀波函數 (macroscopic wavefunction) 來描述。這個波函數，通常表示為 $Psi(arrow(r))$，其形式類似於單一量子粒子：
$ Psi(arrow(r)) = sqrt(n_s(arrow(r))) e^(i phi(arrow(r))) $
此處，$n_s(arrow(r))$ 代表庫柏對的局域密度，使得 $abs(Psi(arrow(r)))^2 = n_s(arrow(r))$，而 $phi(arrow(r))$ 是宏觀量子相位，在沒有電流或磁場的情況下，它在單一連續的超導體中是均勻的。這個單一波函數的存在，在宏觀距離上擁有明確定義的相位，是推導出超導體定義特徵以及 SQUID 運作原理的核心統一原則。它標誌著一種物質狀態，其中通常僅限於原子尺度的量子相位相關性，在實驗室尺度的維度上得以展現。

=== 邁斯納效應 The Meissner Effect <subsection-meissner-effect>

超導體最主要的特性之一，是它能主動將磁通量從其內部排出，此現象稱為邁斯納效應 (Meissner effect)@callaway_remarkable_1990 @bardeen_microscopic_1957 @hirsch_origin_2012。這將超導體與假設的「完美導體」（僅具零電阻的材料）區分開來。當一個材料在外部磁場存在下被冷卻至其臨界溫度 $T_C$ 以下時，它不僅僅是像完美導體那樣捕獲已存在的磁通線，而是會在表面產生持久的、無耗散的電流，稱為屏蔽電流 (screening currents)。

這些屏蔽電流的流動方向和大小恰到好處，能夠產生一個內部磁場，完全抵銷外部施加的磁場。結果是，超導體內部各處的總磁場 $arrow(B)$ 變為零。這種行為表明，超導性是一種真正的熱力學基態，而不僅僅是無限導電的狀態。從宏觀電磁學的角度來看，超導體表現為完美的抗磁體 (diamagnet)。磁化強度 $arrow(M)$ 與外加磁場強度 $arrow(H)$ 的關係為 $arrow(B) = mu_0(arrow(H) + arrow(M))$。由於超導體內部 $arrow(B) = 0$，因此 $arrow(M) = -arrow(H)$，這意味著磁化率 (magnetic susceptibility) $chi = -1$。邁斯納效應是宏觀量子態對抗外部磁場擾動的剛性的直接結果；系統消耗能量產生屏蔽電流，以維持其相位相關基態的完整性。

== 約瑟夫森效應與電流-相位關係 Josephson Effect and Current-Phase Relation <section-josephson-effect>

約瑟夫森接面 (Josephson Junction, JJ) 是由一個「弱連結 (weak link)」隔開的兩個超導體所構成的量子元件。此弱連結可以是絕緣層 (superconductor–insulator–superconductor, S-I-S)、正常金屬 (superconductor-normal-metal-superconductor, S-N-S)，或如本研究中的狄拉克半金屬 (superconductor-Dirac semimetal-superconductor, S-DSM-S)。1962年，Brian Josephson預測，庫柏對（Cooper pairs）可以應因近接效應 (proximity effect)透過量子穿隧(quantum tunneling)的方式，在弱連結區域建立起相干的超導電流的超導電流的宏觀量子現象。此效應由 Brian Josephson 於 1962 年預測@JOSEPHSON1962251 ，由兩個基本關係式描述@barone1982physics @feynman_feynman_2011：

第一約瑟夫森關係式（first Josephson relation）闡述了流經接面的無耗散超導電流 $I_s$ 與兩端超導體波函數的相位差 $phi$ 之間的關係，這便是電流-相位關係 (Current-Phase Relation, CPR)。它指出，在無任何電壓的情況下，超導電流$I_s$仍可流過接面，其驅動力完全來自於兩個超導電極中序參數 (order parameters) 的宏觀量子相位差$phi$，對於傳統的SIS穿隧接面，此關係呈現為一簡單的正弦形式，即直流約瑟夫森效應（The DC Josephson effect）：
$ I_s(phi) = I_c sin(phi) $ <eq-1st-josephson>
其中$phi = phi_2 - phi_1$為金兹堡-朗道序參數（Ginzburg–Landau order parameter）在接面處的相位差，即約瑟夫森相位（Josephson phase）， $I_s$ 是接面的切換電流（有時也稱跳躍電流）為外加偏壓超過某一門檻時，元件由超導態跳變至電阻態時的電流值，而 $I_c$ 是接面在完全維持超導態（無電阻）時所能承受的最大電流，即臨界電流 (critical current)，其取決於超導體的性質，亦會受到溫度以及外加磁場等環境因素的影響。

標準正弦電流-相位關係 $I_s = I_c sin(phi)$ 是理想 S-I-S 穿隧接面的典型形式，並作為理解基本 SQUID 操作的基礎模型。此形式源於單一庫柏對穿隧障壁的最低階量子力學過程。然而，隨著材料科學和奈米製造技術的進步，已開發出多種多樣的約瑟夫森接面，每種都展現出獨特的 CPR 特性。

一個通用的 CPR 可以表示為傅立葉級數 (Fourier series)：
$ I_s(phi) = sum_(n=1)^infinity A_n sin(n phi) + B_n cos(n phi) $
高次諧波 ($n > 1$) 或餘弦項的存在，意味著偏離了簡單的 S-I-S 模型，並指向更複雜的基礎物理。不同接面類型展現出不同的 CPR 特性：

*高透明度接面 (High-Transparency Junctions, S-N-S)*：在弱連結是正常金屬 (N)、半導體 (Sm) 或石墨烯等材料的接面中，庫柏對傳輸的障壁遠低於 S-I-S 接面。在這些系統中，一種稱為安德烈夫反射 (Andreev reflection) 的過程主導電荷傳輸。多個庫柏對的相干傳輸同時變得可能，從而在 CPR 中產生高次諧波。這導致 CPR 呈非正弦且常被描述為「偏斜」(skewed) 或「鋸齒狀」(saw-toothed)。

*鐵磁性接面 (Ferromagnetic Junctions, S-F-S)*：當弱連結是鐵磁性材料時，鐵磁體內的交換場 (exchange field) 會與庫柏對中電子的自旋相互作用。根據 F 層的厚度和交換場的強度，波函數的相位在穿過接面時可能會移動 $pi$。這會產生一個「$pi$-接面」，其 CPR 形式為 $I_s = I_c sin(phi + pi) = -I_c sin(phi)$。

第二約瑟夫森關係式（second Josephson relation）或超導相演變方程式（superconducting phase evolution equation）@barone1982physics，描述了在接面兩端存在電壓$V$時，相位差的演化，即交流約瑟夫森效應（The AC Josephson effect）：

$ (partial phi)/(partial t) = (2e V(t))/hbar"," $ <eq-2nd-josephson>

其中$e$是基本電荷$1.602176634 times 10^(−19) C$（庫倫）@jeckelmann_elementary_2019@mohr_codata_2024，$hbar$是約化普朗克常數（reduced Planck constant） $1.054571817... times 10^(−34) J dot s$（焦耳$dot$秒）@mohr_codata_2024。

對一個恆定電壓 V 積分此方程式可得 $phi(t) = phi_0 + (2e V) / planck.reduce t$。將這個隨時間變化的相位代入第一約瑟夫森關係，會發現超導電流以一個高頻振盪，稱為約瑟夫森頻率 (Josephson frequency)，$f_J = (2e)/planck V$。對於 1 微伏 (microvolt) 的外加電壓，此頻率約為 483.6 MHz。其電壓和頻率之間的關係僅依賴於基本常數，為國際電壓標準的來源。


約瑟夫森常數（Josephson constant）的定義為$K_J=frac(2e, h)$，其倒數則為磁通量子（magnetic flux quantum）$Phi_0=frac(h, 2e)=2pi frac(hbar, 2e)$。則超導相變化方程式@eq-2nd-josephson 可以重新表達為：

$ (partial phi)/(partial t)=2pi [K_J V(t)]=(2pi)/(Phi_0) V(t)"," $ <eq-sc-phase-evolution>
此時定義$Phi=Phi_0 phi/(2pi)$，則接面兩端的電壓為：

$ V = (Phi_0)/(2pi) (partial phi)/(partial t) = (d Phi)/(d t) "," $

換句話說，即在接面處施加固定電壓$V_(D C)$時，相位將隨時間線性變化，而電流則為幅度為$I_c$、頻率$f$為$K_J V_(D C)$的正弦交流電。
此現象與法拉第感應定律的形式非常相似。但此電壓並非來自磁能，因為超導體中沒有磁場；相反地，此電壓來自載體的動能（即庫珀對）。此現象也稱為動態電感（Kinetic inductance）。
當電流與約瑟夫森相位隨時間變化時，接面兩端的電壓降也會隨之變化；如下方導出所示，約瑟夫森關係確定此行為可由一個名為約瑟夫森電感（Josephson inductance）之動態電感來描述。@devoret_superconducting_2004
將約瑟夫森關係式@eq-1st-josephson，@eq-sc-phase-evolution 改寫為：

$
  (partial I) / (partial phi) = & I_c cos phi ,\
  (partial phi) / (partial t) = & (2 pi) / (Phi_0) V.
$

接著，應用連鎖律（chain rule）計算電流的時間導數：

$
  (partial I) / (partial t) 
  = & (partial I) / (partial phi) (partial phi) / (partial t)
  = & I_c cos phi dot (2 pi) / Phi_0 V,
$

將上述結果整理為電感器的電流-電壓特性形式：
$ V = Phi_0/(2pi I_c cos phi) (partial I) / (partial t)= L(phi) (partial I) / (partial t). $
這便得到動態電感的表達式，其為約瑟夫森相位的函數：
$ L(phi) = Phi_0/(2pi I_c cos phi) = L_J/(cos phi). $
其中$L_J=L(0)=Phi_0/(2pi I_c)$為約瑟夫森接面的一個特性參數，稱為約瑟夫森電感。
基於約瑟夫森接面與非線性電感的相似性，當超流經約瑟夫森接面時，其儲存的能量可以計算@tinkham_introduction_2015。
超導相位演進方程式類似於法拉第定律：

$ V = (dif Phi)/(dif t). $
假設在時間 $t_1$ 時，約瑟夫森相位為 $phi_1$ ；在較晚的時間 $t_2$ ，約瑟夫森相位演變為 $phi_2$ 。接面的能量增加等於對面點所做的功：

$
  Delta E = limits(integral)_(t_1)^(t_2) V I dif t = limits(integral)_(t_1)^(t_2) V I dif Phi = limits(integral)_(phi_1)^(phi_2) I_c sin phi dif (Phi_0 phi/(2pi)) = -(Phi_0 I_c)/(2pi) Delta cos phi.
$

這表明約瑟夫森接面中能量的變化僅取決於接面的初始狀態和最終狀態，而與路徑無關。因此，約瑟夫森接面中儲存的能量是一種狀態函數，其定義如下：

$ E(phi) = -(Phi_0 I_c)/(2pi) cos phi ＝ -E_J cos phi. $

$E_J = abs(E(0)) = (Phi_0 I_c)/(2pi)$是約瑟夫森接面的特徵參數，稱為約瑟夫森能量（Josephson energy）。且如$E_J = L_J I_c^2$所示，它與約瑟夫森電感有關。此外，也常用另一個等價的定義$E(phi) = E_J (1 - cos phi)$。
與非線性磁場線圈電感在電流通過時在其磁場中積累潛在能量不同，在約瑟夫森接面的情況下，超導電流並不產生磁場其儲存的能量來自於載荷載體的動能。

=== 電阻電容並聯連接模型 Resistively and Capacitively Shunted Junction Model <subsection-RCSJ-model>
阻電容並聯連接模型（Resistively and Capacitively Shunted Junction, RCSJ model）或簡稱為並聯連接模型@mccumber_effect_1968 @chakravarty_quantum_1988，是描述約瑟夫森接面的經典模型之一。該模型將約瑟夫森接面視為一個具有電阻（$R$）、電容（$C$）和約瑟夫森電感（$L_J$）的並聯電路，除了基本約瑟夫森關係@eq-1st-josephson，@eq-sc-phase-evolution 外，還包含了實際約瑟夫連接的交流阻抗效應。這個模型能夠捕捉到接面在不同操作條件下的動態行為，特別是在存在外部電壓和噪聲時的響應。

依據戴維寧定理（Thévenin's theorem）@johnson_origins_2003， 接面的交流阻抗可由一個電容與一個並聯電阻來表示，這兩者均與理想約瑟夫森接面並聯@barone_physics_1996。電流驅動的完整表達式 $I_("ext")$變為：

$ I_("ext") = I_s + I_R + I_C = I_c sin(phi) + V/R + C_J (dif V)/(dif t). $

其中$I_C$項為接面等效電容（effective capacitance）$C_J$帶有的位移電流（displacement current），$I_R$項為接面等效電阻（effective resistance）$R$帶有的正常電流（normal current）。


根據克希荷夫電路定律（Kirchhoff Circuit Laws），流過接面的總電流 $ I $ 可寫為：
$ I = I_s + I_R + I_C $. <eq-rcsj-kcl>

其中 $ I_s = I_c sin(phi) $ 為超導電流，$ I_R = V / R $ 為流過電阻的電流，$ I_C = C (dif V) / (dif t) $ 為流過電容的電流。將 $ V = (hbar) / (2 e) (dif phi) / (dif t) $ 代入，得到 RCSJ 模型核心方程：

$ I = I_c sin(phi) + (hbar) / (2 e R) (dif phi) / (dif t) + (hbar C) / (2 e) (dif^2 phi) / (dif t^2) $. <eq-rcsj-core>

此方程為非線性微分方程，描述約瑟夫森接面在施加電流下的動態行為。RCSJ 模型能良好解釋約瑟夫森接面的 I–V 特性，包括遲滯（hysteresis）與電壓跳變（voltage jumps）。

*物理意義：*
- *$I_c sin(phi)$項：*代表超導電流，是約瑟夫森效應的量子本質；使得接面在零電壓下亦能傳輸電流，直至電流達臨界值$I_c$。
- *$(hbar) / (2 e R) (dif phi) / (dif t)$項：* 代表正常電流，描述接面在電壓態下的耗散；電阻$R$反映準粒子激發與能量耗散。
- *$(hbar C) / (2 e) (dif^2 phi) / (dif t^2)$項：* 代表電容電流，描述接面的電容效應；電容$C$決定接面對電壓變化的響應速度，並在某些情況下導致 I–V 特性的遲滯。

RCSJ 模型是理解 DC SQUID 工作原理的基礎，因 SQUID 的響應直接取決於內部約瑟夫森接面的動態行為。透過分析此模型，可預測 SQUID 的電壓響應、臨界電流調製與雜訊特性。


=== 約瑟夫森穿透深度 Josephson Penetration Depth <subsection-josephson-penetration-depth>

約瑟夫森穿透深度(Josephson penetration depth)描述了外加磁場穿透長約瑟夫森接面之典型長度。它通常以$lambda_J$ 表示，並由下列公式給出：

$ lambda_J = sqrt(Phi_0/(2pi mu_0 d' j_c)), $

其中$Phi_0$為磁通量量子，$j_c$為臨界超導電流密度（critical supercurrent density, $A/m^2$ ），而$d'$則代表超導電極的電感@weihnacht_influence_1969：

$ d' = d_I + lambda_1 tanh(d_1/(2 lambda_1)) + lambda_2 tanh(d_2/(2 lambda_2)) $

其中$d_I$為約瑟夫森勢壘（Josephson barrier）的厚度（通常為絕緣體），$d_1$ 和$d_2$ 分別為超導電極的厚度，而$lambda_1$和 $lambda_2$則為其倫敦穿透深度（London penetration depths）。若臨界電流密度非常低，約瑟夫森穿透深度通常在數微米至數毫米之間@buckel_supraleitung:_2004。

== 超導量子干涉儀作為CPR探測工具 SQUID as a Probe for CPR <section-squid-as-probe>

超導量子干涉儀（Superconducting Quantum Interference Device, SQUID），是應用約瑟夫森效應最成功的元件之一，其對磁通量具有極高的靈敏度，其運作不僅僅是受到量子效應的影響，而是在宏觀、可測量的尺度上由這些效應所根本定義。它作為磁通量偵測器，具有無與倫比的靈敏度，能夠測量到僅有幾個飛特斯拉 (femtotesla) 的微弱磁場，這在從生物磁學 (biomagnetism) 和地球物理探測 (geophysical surveying) 到基礎物理和量子計算等領域開闢了新的前沿。

本章節將從SQUID的基本原理開始，探討其在CPR（臨界電流-相位關係）測量中的應用。


=== 超導環中的磁通量量子化 Fluxoid Quantization in a Superconducting Ring <subsection-flux-quantization>

當超導體被製成閉合迴路或環形時，量子相位 $phi(arrow(r))$ 的宏觀性質引出了另一個深刻的結果。宏觀波函數 $Psi(arrow(r))$ 在空間中任何一點都必須是單值的 (single-valued) 這一基本要求意味著，如果沿著超導體內的任何閉合路徑 C 繞行並回到起點，波函數的相位只能改變 $2pi$ 的整數倍。在數學上，此條件表示為：
$ integral.cont_C nabla phi dot d arrow(l) = 2 pi n $
其中 n 為任意整數。這是由波函數結構所施加的拓撲約束。

這個相位約束可以透過庫柏對（電荷 $q = 2e$）的正則動量 (canonical momentum) 的表達式與電磁場聯繫起來，該表達式包含來自磁向量位 (magnetic vector potential) $arrow(A)$ 的貢獻。超導電流的速度與相位的梯度及向量位有關。將此關係沿閉合迴路 C 積分，可導出一個稱為磁通量 (magnetic fluxoid) 的量的量子化：
$ integral.cont_C (Lambda arrow(J)_s + arrow(A)) dot d arrow(l) = n h/(2e) = n Phi_0 $
其中，$arrow(J)_s$ 是超導電流密度 (supercurrent density)，$Lambda$ 是一個與材料性質相關的常數，而 $Phi_0 = h/(2e) approx 2.07 times 10^(-15) "Wb"$ 是磁通量量子 (magnetic flux quantum)。磁通量量子分母中出現電荷 2e，是庫柏對理論最早且最直接的證明之一。

對於一個厚的超導環（其厚度遠大於磁穿透深度 (magnetic penetration depth)），積分路徑 C 可以選擇在超導材料深處，那裡的屏蔽電流已衰減為零，即 $arrow(J)_s = 0$。在這個重要的極限下，磁通量量子化條件簡化為穿過迴路的磁通量 $Phi$ 本身的量子化。對向量位項應用斯托克斯定理 (Stokes' theorem) ($integral.cont_C arrow(A) dot d arrow(l) = integral_S (nabla times arrow(A)) dot d arrow(S) = integral_S arrow(B) dot d arrow(S) = Phi$)，條件變為：
$ Phi = n Phi_0," " n = ± 1, ± 2, ... $
此結果指出，困在超導環內的磁通量不能取任意值，而是被限制為基本通量量子的整數倍。這個宏觀量子約束與約瑟夫森效應一起，是所有 SQUID 運作所依據的核心物理原理。


=== 直流超導量子干涉儀 DC SQUID <subsection-dc-squid>
SQUID 主要有兩種類型：直流（DC）和射頻（RF）。RF SQUID 只需要一個約瑟夫森接面（超導穿隧接面），這可能使其生產成本較低，但靈敏度較低。直流SQUID（DC SQUID）的基本結構是在一個超導環路中並聯兩個約瑟夫森接面，如 @fig-squid-schematic 所示。

#figure(
  image("../Images/SQUID_schematic.png", width: 70%),
  caption: [DC SQUID示意圖：兩個約瑟夫森接面（以叉號表示）並聯於一個電感為 L 的超導環上。偏置電流（bias current） $I$ 分流通過兩個臂，外加磁通量 $Phi_("ext")$ 穿過環路。 圖片來源：IMS, KIT@kit_squid_schematic]
) <fig-squid-schematic>

直流超導量子干涉儀（DC SQUID）於 1964 年由福特研究實驗室（Ford Research Labs）的 Robert Jaklevic、John J. Lambe、James Mercereau 和 Arnold Silver 所發明，此後於 1962 年由 Brian Josephson 提出約瑟夫森效應，並於 1963 年由 John Rowell 和 Philip Anderson 在貝爾實驗室（Bell Labs）製造了第一個約瑟夫森接面@anderson_probable_1963。SQUID的運作基於兩個宏觀量子現象：超導環路中的磁通量量子化，以及流經兩個接面的超導電流的量子干涉。

而超導迴路中若並聯兩個約瑟夫森接面，基於直流約瑟夫森效應，在沒有任何外部磁場的情況下，輸入電流（input current）$I_("input")$會平均分佈到兩個分支。若對超導迴路施加一個小的外部磁場，則會開始在迴路中循環一個屏蔽電流（screening current）$I_s$，該電流會產生一個抵銷外加磁通量的磁場，並創造一個與外部磁通量成正比的額外約瑟夫森相位。感應電流（induced current）的方向與$I$在超導迴路的一個分支中相同，而在另一個分支中與 $I$ 相反；總電流變為 $1/2I_("input")+I_s$ 在某一分支，而$1/2I_("input")-I_s$ 在另一分支。一旦任一分支中的電流超過約瑟夫森接面的臨界電流$I_c$，則在接面上會出現電壓。

現在假設外部磁通量進一步增加，直到超過$Phi_0$，即磁通量量子的一半。由於超導迴路所包圍的磁通量必須是磁通量量子的整數倍，因此 SQUID 不再顯著屏蔽磁通量，而是能量上更傾向於將其增加到$Phi_1$。此時電流反向流動，抵禦了所容許的磁通量$Phi_2$ 與略超過 $Phi_3$ 的外部磁場之間的差異。隨著外部磁場的增加，電流逐漸減小，當磁通量剛好為 $Phi_4$ 時電流為零，並且當外部磁場進一步增加時，電流再次反向。因此，電流的方向會週期性地改變，每當磁通量增加半整數倍數的 $Phi_5$ 時就會改變一次，在最大電流時每增加半整數加整數倍數的 $Phi_6$ 時會改變一次，而在整數倍數時電流為零。

若輸入電流大於$I_c$，則 SQUID 始終運作於電阻模式。此時，電壓即為外加磁場的函數，且週期等於$Phi_0$。由於直流 SQUID 的電流-電壓特性（current-voltage characteristic）具有遲滯現象（hysteretic），故在接面間連接一個並聯電阻$R$以消除遲滯（在內稟電阻（intrinsic resistance）足夠的情況下）。屏蔽電流為應用磁通量除以環路的自感。因此$Delta Phi$可估算為$Delta V$磁通量至電壓轉換器）@de_lacheisserie_magnetism:_2002 @clarke_squid_2004 ，如下所示：

$
  Delta V=R dot Delta I, \
  2 dot Delta I = 2 dot (Delta Phi)/ L, \
  Delta V = R/L dot Delta Phi.
$
其中 $L$ 為超導環路的自感（self inductance），本節的討論假設迴路中存在完美的磁通量量子化。然而，這僅對具有較大自感的較大迴路才成立。根據上述關係，這也意味著電流和電壓變化較小。實際上，迴路的自感$L$並不這麼大。一般情況可通過引入一個參數

$ lambda = (i_c L)/Phi_0 $

其中$i_c$為SQUID的臨界電流。通常$lambda$為一個數量級@de_waele_quantum-interference_1969。

=== 對稱直流 SQUID 的理論模型 Theoretical Model of Symmetric DC SQUIDs <subsection-symmetric-dc-squid>

直流 SQUID，如@fig-squid-schematic 示意圖所示，由一個幾何自感為 L 的閉合超導迴路組成，該迴路被兩個並聯的約瑟夫森接面 JJ1 和 JJ2 中斷。偏置電流 $I_b$ 從迴路一側注入，從另一側導出，導致電流分流並流經包含接面的兩個臂。

對於一個理想的對稱SQUID（即兩個接面完全相同），具體來說，假設滿足以下條件：
1. *相同的接面*：兩個約瑟夫森接面具有相同的臨界電流 ($I_(c 1) = I_(c 2 ) = I_c$)、正常態電阻 ($R_(N 1) = R_(N 2) = R_N$) 和電容 ($C_1 = C_2 = C$)。
2. *對稱的電感*：總迴路電感 $L$ 被認為在干涉儀的兩個臂之間平均分配，因此臂 1 的電感為 $L_1 = L/2$，臂 2 的電感為 $L_2 = L/2$。

=== 總電流-相位關係的推導 Derivation of the Total Current-   Phase Relation <subsection-total-cpr-derivation>
直流 SQUID 的核心特性是其總電流-相位關係，它描述了總超導電流如何同時依賴於一個有效相位差和磁通量。推導過程始於對對稱 SQUID 迴路應用克希荷夫電流定律 (Kirchhoff's current law) 和磁通量量子化條件。

假設接面具有標準的正弦 CPR，則通過兩個臂的超導電流 $I_1$ 和 $I_2$ 為：
$ I_1 = I_c sin(phi_1) $
$ I_2 = I_c sin(phi_2) $
其中 $phi_1$ 和 $phi_2$ 分別是 JJ1 和 JJ2 兩端的規範不變相位差。流經 SQUID 的總超導電流 $I_s$ 是兩個並聯支路電流的總和：
$ I_s = I_1 + I_2 = I_c (sin phi_1 + sin phi_2) $

相位差 $phi_1$ 和 $phi_2$ 並非獨立，它們透過穿過迴路的磁通量 $Phi$ 耦合。宏觀波函數的單值性要求，沿任何閉合超導迴路積分的總相位變化必須是 $2pi$ 的整數倍。當應用於通過兩個接面的 SQUID 迴路時，這個拓撲約束直接導致規範不變相位之間的以下關係：
$ phi_2 - phi_1 = (2pi Phi) / Phi_0 + 2 n pi $

使用三角恆等式 $sin A + sin B = 2 sin((A+B)/2) cos((A-B)/2)$，可得：
$ I_s = 2I_c sin((phi_1 + phi_2)/2) cos((phi_2 - phi_1)/2) $
將磁通約束代入餘弦項，得到：
$ 
  I_s = & 2I_c sin((phi_1 + phi_2)/2) cos((pi Phi)/Phi_0) \
  = & 2I_c sin(phi_1 + (pi Phi)/Phi_0)  cos((pi Phi)/Phi_0)
$

這個方程式是對稱直流 SQUID的總電流-相位關係。

=== SQUID 臨界電流的磁通調變 Flux Modulation of SQUID Critical Current <subsection-squid-critical-current-modulation>

整個 SQUID 的臨界電流，我們表示為 $I_max(Phi)$，是在給定磁通量 $Phi$ 下，總超導電流 $I_s$ 能達到的最大值。從總 CPR 中，我們可以直接寫出 SQUID 臨界電流的表達式：
$ I_max(Phi) = 2I_c abs(cos((pi Phi)/Phi_0)) $
其中 $Phi_0 = h/(2e)$ 是磁通量量子。此調變是庫柏對波函數通過兩條路徑發生建設性與破壞性干涉的直接結果。
這個基本方程式描述了 SQUID 臨界電流作為穿過迴路的磁通量的函數的週期性調變。此關係的關鍵特徵是：

- *週期性*：臨界電流是磁通量 $Phi$ 的週期函數，週期恰好為一個磁通量量子 $Phi_0$。測得的臨界電流每次振盪對應於磁通量變化一個 $Phi_0$。
- *建設性干涉*：當磁通量是磁通量量子的整數倍，即 $Phi = n Phi_0$（n 為整數）時，臨界電流達到其絕對最大值 $2I_c$。在這些磁通值下，餘弦項為 $±1$。
- *破壞性干涉*：當磁通量是磁通量量子的半整數倍，即 $Phi = (n + 1/2)Phi_0$ 時，臨界電流達到其最小值 0。在這些點上，餘弦項為 0。

這種行為是宏觀量子干涉的直接而明確的體現。SQUID 作為庫柏對的量子干涉儀，其功能類似於邁克生 (Michelson) 或馬赫-曾德 (Mach-Zehnder) 干涉儀對光子的作用。

== 非理想性對 SQUID 性能的影響 (Impact of Non-Idealities on SQUID Performance) <section-non-idealities-impact>

真實世界中 SQUID 的性能和行為受到非理想因素的顯著影響，其中最主要的是超導迴路的有限電感和熱漲落 (thermal fluctuations) 的效應。

=== 有限迴路電感：屏蔽參數 $beta_L$ Finite Loop Inductance: The Screening Parameter $beta_L$ <subsection-finite-loop-inductance>

在任何物理 SQUID 中，連接兩個約瑟夫森接面的超導迴路都具有非零的幾何自感 L。此電感對裝置對外部磁通量 $Phi_("ext")$ 的響應有深遠的影響。當施加外部磁通時，SQUID 會根據冷次定律 (Lenz's law) 和磁通量量子化原理，在迴路中感應出一個持久的、循環的屏蔽電流 $I_("cir")$，以抵抗變化。

循環電流可以用個別接面電流表示為 $I_("cir") = (I_2 - I_1)/2$。對於具有正弦 CPR 的相同接面，這變為：
$ I_("cir") = -I_c cos(phi_1 + (pi Phi)/Phi_0) sin((pi Phi)/Phi_0) $

這揭示了一個自洽的回饋迴路：總磁通量 $Phi$ 決定了相位差，相位差決定了循環電流 $I_("cir")$，而循環電流又反過來貢獻於總磁通量 $Phi$。這種內在回饋的強度由無因次的*屏蔽參數* $beta_L$ 量化：
$ beta_L equiv (2 L I_c) / Phi_0 $

參數 $beta_L$ 的值對 SQUID 的行為至關重要：

- *可忽略的屏蔽 ($beta_L << 1$)*：當電感或臨界電流很小時，自感應磁通量與磁通量量子相比可以忽略不計。在此極限下，$Phi approx Phi_("ext")$，SQUID 的行為符合理想模型。
- *強屏蔽 ($beta_L >> 1$)*：當電感很大時，屏蔽效應佔主導地位。循環電流會調整以幾乎完全抵消外部磁通的任何變化，使總內部磁通 $Phi$ 固定在最接近 $Phi_0$ 整數倍的位置。
- *最佳區域 ($beta_L approx 1$)*：對於大多數應用，特別是作為靈敏磁力計，需要達到最佳平衡。

=== 動態行為與熱漲落 Dynamic Behavior and Thermal Fluctuations <subsection-dynamic-behavior-thermal-fluctuations>
當 SQUID 被偏置電流 $I_b$ 驅動，且該電流超過其依賴於磁通的臨界電流 $I_max(Phi)$ 時，它會轉變為電阻態，並在其端點出現有限電壓。為了模擬這種動態、耗散的行為，我們採用*電阻與電容並聯接面 (RCSJ) 模型*。

在此模型中，每個理想的約瑟夫森元件（由其 CPR 描述）與一個電阻 $R_N$（代表準粒子穿隧）和一個電容 C（代表接面的幾何電容）並聯。通過 SQUID 每個臂的總電流是超導電流、正常（歐姆）電流和位移電流的總和。

最終的運動方程式是一組耦合的郎之萬方程式 (Langevin equations)：
$ (Phi_0)/(2pi) C (d^2 phi_1)/(d t^2) + (Phi_0)/(2pi R_N) (d phi_1)/(d t) + I_c sin phi_1 = I_b/2 - I_("cir") + I_(N 1)(t) $
$ (Phi_0)/(2pi) C (d^2 phi_2)/(d t^2) + (Phi_0)/(2pi R_N) (d phi_2)/(d t) + I_c sin phi_2 = I_b/2 + I_("cir") + I_(N 2)(t) $

這些方程式通過循環電流 $I_("cir")$ 耦合，完全描述了在存在熱雜訊的情況下 SQUID 的古典動力學。

然而，真實世界的SQUID往往存在非對稱性（例如 $I_(c 1) != I_(c 2)$ 或環路電感分配不均）。這種非對稱性雖然在傳統應用中常被視為缺陷，卻能將SQUID轉變為一個強大的分析工具。特別是對於一個高度非對稱的SQUID（例如 $I_(c 1) >> I_(c 2)$），其總臨界電流的磁通調變曲線的形狀，會直接反映較弱接面（weak junction）的電流-相位關係。透過精密量測SQUID的臨界電流 $I_("max")$ 隨外部磁通量 $Phi_("ext")$ 的完整調變曲線，我們可以直接重構出弱連結的CPR，$I_("s,weak")(phi)$ @Babich2023_LimitationsCPR_NanoLett。這正是本研究採用非對稱SQUID來探測PtTe₂接面非傳統CPR的核心方法學基礎。

== 非對稱 SQUID：理論與應用 Asymmetric SQUIDs: Theory and Applications <section-asymmetric-squid>
雖然完全對稱的 SQUID 行為提供了量子干涉的基礎理解，但非對稱性的引入卻開啟了更豐富且更複雜的物理現象景觀。無論非對稱性是來自於不可避免的製程缺陷還是有意設計的工程考量，它都能將 SQUID 從簡單的干涉儀轉變為可調式、非互易的量子元件。

=== 非對稱性的來源與分類 Sources and Classification of Asymmetry <subsection-asymmetry-sources>

SQUID 的非對稱性主要體現在兩個方面：

*接面非對稱性 (Junction Asymmetry)*：接面非對稱性是指兩個接面的電學參數不同，包括：
+ 臨界電流的差異：$I_("c1") != I_("c2")$，這是最常見的非對稱性形式。
+ 正常態電阻的差異：$R_("N1") != R_("N2")$，影響接面的動態行為。
+ 接面電容的差異：$C_1 != C_2$，決定接面的響應速度。

*迴路非對稱性 (Loop Asymmetry)*：迴路非對稱性是指兩個接面在超導迴路中的位置不同，導致：
+ 迴路電感分配不均：$L_1 != L_2$，其中 $L_1 + L_2 = L_"total"$。
+ 磁通耦合的差異：兩個接面對外部磁場的響應不同。

=== 非對稱 SQUID 的理論分析 Theoretical Analysis of Asymmetric SQUIDs <subsection-asymmetric-squid-theoretical-analysis>
對於一個非對稱 SQUID，其總電流-相位關係可以表示為：
$ I_s = I_("c1") sin(phi_1) + I_("c2") sin(phi_2) $

考慮接面參數的非對稱性，我們可以引入非對稱參數 $alpha$：
$ alpha = (I_("c1") - I_("c2")) / (I_("c1") + I_("c2")) $

當 $alpha = 0$ 時，系統退化為對稱 SQUID；當 $alpha != 0$ 時，系統表現出非對稱行為。

對於中等非對稱性 ($|alpha| < 1$)，總臨界電流可以近似表示為：
$ I_"max"(Phi) = (I_("c1") + I_("c2")) sqrt(cos^2((pi Phi) / Phi_0) + alpha^2 sin^2((pi Phi) / Phi_0)) $

=== 高度非對稱 SQUID：相位偏置探測器 Highly Asymmetric SQUIDs: Phase-Biased Detectors
當一個接面的臨界電流遠大於另一個時（$I_("c1") >> I_("c2")$），SQUID 可以被視為一個相位偏置 (phase-biased) 的探測器。在此組態中：

1. *較強接面 (Strong Junction)*：近似地提供一個固定的相位參考，$phi_1 approx "常數"$。
2. *較弱接面 (Weak Junction)*：其相位差 $phi_2$ 主要由外部磁通量 $Phi_"ext"$ 控制。

透過精密量測非對稱 SQUID 的總臨界電流 $I_"c,total"$ 隨外部磁通量 $Phi_"ext"$ 的完整調變曲線，我們可以直接重構出較弱接面的電流-相位關係 (Current-Phase Relation, CPR)@Babich2023_LimitationsCPR_NanoLett：
$ I_("s,weak")(phi) = I_("c,total")(Phi_"ext") - I_("c1") sin(phi_1) $

=== 非對稱性對性能的影響與應用 (Impact of Asymmetry on Performance and Applications)

*磁通量調變深度（flux modulation depth, FMD）*：對於對稱 SQUID，磁通量調變的深度為 100%，即在半整數磁通量量子處臨界電流可以完全抵消。而對於非對稱 SQUID，調變深度由非對稱參數決定：
$ "FMD" = (I_"max" - I_"min") / I_"max" = (2|I_("c1")||I_("c2")|) / (I_("c1")^2 + I_("c2")^2) $

*磁通量靈敏度*：非對稱性會改變 SQUID 的磁通量-電壓轉換係數@Crete2021_SelfField_Micromachines：
$ (d V) / (d Phi) = R_N (d I_c) / (d Phi) $
其中 $R_N$ 是等效正常態電阻。對於非對稱 SQUID，此轉換係數在不同磁通量點會有所變化。

*CPR 探測能力*：非對稱 SQUID 提供了一個探測約瑟夫森接面內在物理的強大工具。透過分析其磁通量調變圖樣的畸變，我們可以進行傅立葉分析：
$ I_c(Phi_"ext") = sum_(n=0)^infinity a_n cos((2pi n Phi_"ext") / Phi_0) + b_n sin((2pi n Phi_"ext") / Phi_0) $

不同的傅立葉分量對應於 CPR 的不同諧波，從而可以識別非正弦 CPR 的特徵@Babich2023_LimitationsCPR_NanoLett。

=== 實驗設計與量測技術 (Experimental Design and Measurement Techniques)

*元件設計考量*：設計非對稱 SQUID 時需要考慮@Butz2010_AsymDCSQUIDs_Diploma：
1. 非對稱比的選擇：平衡調變深度與 CPR 探測精度
2. 迴路幾何：最小化寄生電感和串擾
3. 材料選擇：確保接面特性的穩定性

*低溫量測協議*：精確的 CPR 量測需要：
1. 溫度穩定性：維持 $T << T_c$ 以確保超導性
2. 磁場屏蔽：消除外部磁場干擾
3. 電流偏置精度：高解析度的電流控制
4. 電壓量測靈敏度：檢測微小的電壓變化

== 非正弦 CPR 與先進應用 Non-Sinusoidal CPRs and Advanced Applications <section-non-sinusoidal-cpr>

將非正弦 CPR 納入 SQUID 的理論中，揭示了更豐富、更複雜的現象學。磁通調變模式的形狀成為接面 CPR 諧波含量的直接探測器。

=== 高次諧波對磁通調變的影響 Effect of Higher Harmonics on Flux Modulation <subsection-higher-harmonics-effect>

考慮一個 SQUID，其中接面具有包含前兩個諧波的 CPR：
$ I_s(phi) = I_(c 1) sin(phi) + I_(c 2) sin(2phi) $

SQUID 的總超導電流變為：
$ I_s^"total" (Phi) =  
2 & I_(c 1) sin(phi_1 + (pi Phi)/Phi_0) cos((pi Phi)/Phi_0) #<equate:revoke> \  
+ & 2I_(c 2) sin(2(phi_1 +(pi Phi)/Phi_0)) cos((2pi Phi)/Phi_0) $

這揭示了一個關鍵結果：CPR 的第二諧波以 $Phi_0/2$ 的磁通週期進行干涉。一般來說，接面 CPR 的第 n 次諧波 $sin(n phi)$ 將在 SQUID 的總電流中產生一個干涉項，該干涉項以 $Phi_0/n$ 的週期進行調變。

=== 拓撲量子材料的應用 Applications in Topological Quantum Materials <subsection-topological-materials>

在 PtTe₂ 等新興量子材料的研究中，非對稱 SQUID 技術不僅能夠揭示材料的內在拓撲性質，更為開發新型超導量子元件提供了重要的設計指導。

PtTe₂ 作為第二類狄拉克半金屬 (Type-II Dirac Semimetal)，其約瑟夫森接面預期表現出@Cuozzo2024_MW_Tunable_Diode_PRResearch：
1. 非正弦 CPR：由於狄拉克費米子的特殊輸運性質
2. 高次諧波分量：特別是二階諧波 ($sin(2phi)$) 項
3. 可調控性：透過外部磁場調控 CPR 的形式

非對稱 SQUID 也是探測約瑟夫森二極體效應 (Josephson Diode Effect, JDE) 的有效工具@Cuozzo2024_MW_Tunable_Diode_PRResearch。透過量測正、負方向的切換電流差異：
$ eta = (I_("sw")^+ - I_("sw")^-) / (I_("sw")^+ + I_("sw")^-) $
可以量化 JDE 的強度，並與重構的 CPR 進行比對分析。


== 二碲化鉑 ($"PtTe"_2$)：拓樸半金屬中的非傳統超導近接效應 <section-ptte2-properties>

二碲化鉑（Platinum ditelluride, $"PtTe"_2$）是一種過渡金屬二硫屬化物（Transition Metal Dichalcogenide, TMD），屬於通式為 MX₂ 的材料家族，近年來因其豐富的物理內涵而備受關注。在結構上，二碲化鉑結晶為1T相 (CdI₂-type)，呈現出一種由鉑（Platinum, #math.attach(math.upright("Pt"), bl: "78")）原子層夾在兩層碲（Tellurium, #math.attach(math.upright("Te"), bl: "52")）原子層之間的八面體配位層狀結構。這種層狀特性使其可以透過機械剝離法，輕易地獲得從塊材到幾個原子層甚至單原子層厚度的二維薄片，為構建凡德瓦爾異質結構 (van der Waals heterostructures) 和平面型奈米元件提供了極大的可能性。
在電子特性方面，二碲化鉑最引人注目的特徵是它已被理論預測並由角解析光電子能譜 (ARPES) 等實驗技術證實為一種第二類狄拉克半金屬 (Type-II Dirac Semimetal)。與傳統的第一類狄拉克半金屬（如石墨烯 Graphene）中點狀的費米面不同，第二類狄拉克半金屬擁有極度傾斜的狄拉克錐，使得電子和電洞口袋在狄拉克點處相切接觸。這些受晶體對稱性保護的狄拉克點，賦予了二碲化鉑獨特的低能電子態和輸運性質。特別是其拓樸保護的表面態，具有螺旋自旋-動量鎖定（helical spin-momentum locking）的特性，這意味著電子的動量與其自旋方向是鎖定的，賦予了二碲化鉑獨特的低能電子態和輸運性質，使其成為研究拓撲物理與超導性之間交互作用的理想材料平台。

#figure(
  image("../Images/Fig2-Characterization of PtTe2.png", width: 100%, fit: "stretch"),
  caption: [II型狄拉克半金屬的二碲化鉑表徵。Ref.@yan_lorentz-violating_2017])<fig-Characterization-of-PtTe2>
a, b：I型與II型狄拉克費米子的示意圖。
c, d：二碲化鉑晶體結構的側視圖與頂視圖。綠色球體代表 Pt 原子，紅色球體代表 Te 原子，黑色虛線標示單位晶胞。
e：(001) 平面的體相與投影表面(Brillouin Zone）。紅點（標記 D）顯示三維狄拉克點的位置。
f：室溫下測得的拉曼光譜（Raman spectroscopy）。
g：室溫下二碲化鉑的 X 射線繞射（X-ray diffractometer, XRD）圖譜，插圖為邊長數毫米的單晶樣品照片。
h：電子束能量 70 eV 下的低能量電子衍射（Low-energy electron diffraction, LEED）圖樣。




值得注意的是，塊材二碲化鉑本身並沒有超導性，然而，在本研究所探討的約瑟夫森接面元件中，二碲化鉑作為「弱連結 (weak link)」區域，其局部超導性主要是透過與具有更高超導轉變溫度的電極（如鈮鈦合金 Niobium–titanium, Nb-Ti）接觸，經由超導近接效應 (superconducting proximity effect) 所誘導產生。這就構成了一個超導體-狄拉克半金屬-超導體 (superconductor-Dirac semimetal-superconductor, S-DSM-S) 的混合結構。

在這個S-DSM-S混合結構中，超導電流的傳輸是由由二碲化鉑內部獨特的狄拉克費米子所中介的。理論預測，這種由拓樸表面態主導的傳輸機制，會促進多重安德烈夫反射(multiple Andreev reflections, MAR))過程，從而導致一個偏離標準正弦函數的非傳統電流-相位關係@Cuozzo2024_MW_Tunable_Diode_PRResearch。此外，外加磁場可以與表面態的自旋相互作用，進而調控CPR的形式，甚至產生約瑟夫森二極體效應（Josephson Diode Effect, JDE），即正反方向的臨界電流不相等（$I_c^+ != I_c^-$），深入研究二碲化鉑約瑟夫森接面的電學特性，對於理解拓撲半金屬中的近接超導物理，以及探索其在未來量子技術中的應用潛力，具有至關重要的意義。

因此，本研究的理論假說是：透過將PtTe₂作為弱連結整合進一個非對稱SQUID中，我們不僅能夠直接觀測到其預期中的非正弦CPR，還能利用外部磁場作為調控手段，系統性地研究其拓樸性質如何體現在宏觀的量子輸運現象上。

#figure(
  image("../Images/Fig3-S-DSM-S.png", width: 90%, fit: "stretch"),
  caption: [S-DSM-S約瑟夫森接面示意圖(Type-I)。Ref.@li_4-periodic_2018])
<fig-S-DSM-S>
其中安德烈夫束縛態將超電流從一端超導電極 (S) 傳送到另一端超導電極。在DSM夾層中，沿其中一個狄拉克錐(Dirac cone)錐向右移動的電子（藍色 e）在右側介面可被安德烈夫反射成同一狄拉克錐中向左移動的電洞（橙色 h）。該電洞又可在左側介面被反射回電子。
#figure(
  image("../Images/Fig4-S-DSM-S Andreev reflections.png", width: 90%, fit: "stretch"),
  caption: [狄拉克錐由I型傾斜轉變到II型。Ref.@PhysRevB.101.214508])
<fig-S-DSM-S-Dirac-cone>
向右（向左）移動之電子分別以藍色（紅色）標記。插圖顯示兩個狄拉克錐沿 $k_y$ 軸朝相反方向傾斜之示意。能量軸位於平面外。與費米能相交之狄拉克錐截面，分別以實線（電子）與虛線（空穴）所示之橢圓標示。狄拉克節點位於 $k_y$ 軸上的 $±k_D$。下方面板則示意在所示 $ζ$ 值下狄拉克錐的傾斜情形。