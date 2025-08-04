// 第二章：相關研究
// Chapter 2: Related Work
// 設定成段之文字首行皆空2字元
#set par(first-line-indent: (amount: 2em, all: true))
#import "@preview/physica:0.9.3": *
// 設定方程式編號格式
#import "@preview/equate:0.3.2": equate
= 相關研究 <chapter-related-work>

== 理論基礎 <section-theoretical-foundation>

本章節回顧與本研究相關的理論基礎和先前研究成果。相關研究可以分為以下幾個主要方向：

=== 二碲化鉑 (Platinum Ditelluride, $"PtTe"_2$)：材料性質 <subsection-material-properties>

二碲化鉑（Platinum ditelluride, $"PtTe"_2$）是一種過渡金屬二硫屬化物（Transition Metal Dichalcogenide, TMD），屬於通式為 MX₂ 的材料家族，近年來因其豐富的物理內涵而備受關注。在結構上，二碲化鉑結晶為1T相 (CdI₂-type)，呈現出一種由鉑（Platinum, #math.attach(math.upright("Pt"), bl: "78")）原子層夾在兩層碲（Tellurium, #math.attach(math.upright("Te"), bl: "52")）原子層之間的八面體配位層狀結構。這種層狀特性使其可以透過機械剝離法，輕易地獲得從塊材到幾個原子層甚至單原子層厚度的二維薄片，為構建凡德瓦爾異質結構 (van der Waals heterostructures) 和平面型奈米元件提供了極大的可能性。
在電子特性方面，二碲化鉑最引人注目的特徵是它已被理論預測並由角解析光電子能譜 (ARPES) 等實驗技術證實為一種第二類狄拉克半金屬 (Type-II Dirac Semimetal)。與傳統的第一類狄拉克半金屬（如石墨烯 Graphene）中點狀的費米面不同，第二類狄拉克半金屬擁有極度傾斜的狄拉克錐，使得電子和電洞口袋在狄拉克點處相切接觸。這些受晶體對稱性保護的狄拉克點，賦予了二碲化鉑獨特的低能電子態和輸運性質，使其成為研究拓撲物理與超導性之間交互作用的理想材料平台。

值得注意的是，塊材二碲化鉑本身並沒有超導性，然而，在本研究所探討的約瑟夫森接面元件中，二碲化鉑 作為「弱連結 (weak link)」區域，其超導性主要是透過與具有更高超導轉變溫度的電極（如鈮鈦合金 Niobium–titanium, Nb-Ti）接觸，經由超導近接效應 (superconducting proximity effect) 所誘導產生。這就構成了一個超導體-拓撲半金屬-超導體 (Superconductor–Topological Semimetal–Superconductor, S-TS-S) 的混合結構。

將超導性與二碲化鉑的狄拉克半金屬的拓撲特性相結合，為探索新奇的量子輸運現象提供了獨特的機會。在此S-TS-S結構中，庫柏對 (Cooper pairs) 穿越接面的傳輸過程，是由二碲化鉑內部獨特的狄拉克費米子所中介的。這種非傳統的傳輸機制，被預期將導致一個偏離標準正弦函數的非傳統電流-相位關係 (unconventional Current-Phase Relation)。因此，深入研究二碲化鉑約瑟夫森接面的電學特性，對於理解拓撲半金屬中的近接超導物理，以及探索其在未來量子技術中的應用潛力，具有至關重要的意義。

=== 約瑟夫森接面 <subsection-Josephson-Junction>

約瑟夫森接面 (Josephson Junction, JJ) 是構成超導量子電路的基本構建模組。其物理結構為由一個「弱連結 (weak link)」隔開的兩個超導體。這個弱連結可以是一個極薄的絕緣層 (S-I-S)、一段正常金屬 (S-N-S)，或如本研究中的拓撲半金屬 (S-TS-S)。儘管庫柏對 (Cooper pairs) 無法在弱連結材料中長距離穩定存在，但它們可以透過量子穿隧 (quantum tunneling) 或近接效應 (proximity effect) 的方式，發生約瑟夫森效應即在弱連結區域建立起相干的超導電流的宏觀量子現象。
此效應由 Brian Josephson 於 1962 年預測 @JOSEPHSON1962251 ，並由兩個支配接面量子動力學的基本關係式所描述。

第一約瑟夫森關係式（first Josephson relation）@barone1982physics，闡述了流經接面的無耗散超導電流 $I_s$ 與兩端超導體波函數的相位差 $phi$ 之間的關係，這便是電流-相位關係 (Current-Phase Relation, CPR)。它指出，在無任何電壓的情況下，超導電流$I_s$仍可流過接面，其驅動力完全來自於兩個超導電極中序參數 (order parameters) 的宏觀量子相位差$phi$@feynman_feynman_2011，對於傳統的「超導體-絕緣體-超導體」(SIS) 穿隧接面，此關係呈現為一簡單的正弦形式，即直流約瑟夫森效應（The DC Josephson effect）：

$ 
I_(s)(phi) = I_c sin(phi(t))","
$ <eq-1st-josephson>

其中$phi = phi_2 - phi_1$為金兹堡-朗道序參數（Ginzburg–Landau order parameter）在接面處的相位差，即約瑟夫森相位（Josephson phase）， $I_s$ 是接面的切換電流（有時也稱跳躍電流）為外加偏壓超過某一門檻時，元件由超導態跳變至電阻態時的電流值，而 $I_c$ 是接面在完全維持超導態（無電阻）時所能承受的最大電流，即臨界電流 (critical current)，其取決於超導體的性質，亦會受到溫度以及外加磁場等環境因素的影響。此正弦形式是一種理想化模型，許多類型的接面展現出更複雜的非正弦 CPR，這在非對稱系統的研究中是至關重要的課題 [需引用討論非正弦CPR的相關研究]。

第二約瑟夫森關係式（second Josephson relation）或超導相演變方程式（superconducting phase evolution equation）@barone1982physics，描述了在接面兩端存在電壓$V$時，相位差的演化，即交流約瑟夫森效應（The AC Josephson effect）：

$ 
(partial phi)/(partial t) = (2e V(t))/hbar","
$ <eq-2nd-josephson>

其中$e$是基本電荷$1.602176634 times 10^(−19) C$（庫倫）@jeckelmann_elementary_2019@mohr_codata_2024，$hbar$是約化普朗克常數（reduced Planck constant） $1.054571817... times 10^(−34) J dot s$（焦耳$dot$秒）@mohr_codata_2024。

約瑟夫森常數（Josephson constant）的定義為$K_J=frac(2e, h)$，其倒數則為磁通量子（magnetic flux quantum）$Phi_0=frac(h, 2e)=2pi frac(hbar, 2e)$。則超導相變化方程式@eq-2nd-josephson 可以重新表達為：

$ 
(partial phi)/(partial t)=2pi [K_J V(t)]=(2pi)/(Phi_0) V(t)","
$ <eq-sc-phase-evolution>
此時定義$Phi=Phi_0 phi/(2pi)$，則接面兩端的電壓為：

$
V = (Phi_0)/(2pi) (partial phi)/(partial t) = (d Phi)/(d t) ","
$

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
  (partial I) / (partial t) = & (partial I) / (partial phi) (partial phi) / (partial t)
  = & I_c cos phi dot (2 pi) / Phi_0 V,
$

將上述結果整理為電感器的電流-電壓特性形式：

$
  V = Phi_0/(2pi I_c cos phi) (partial I) / (partial t)= L(phi) (partial I) / (partial t).
$

這便得到動態電感的表達式，其為約瑟夫森相位的函數：

$
  L(phi) = Phi_0/(2pi I_c cos phi) = L_J/(cos phi).
$

其中$L_J=L(0)=Phi_0/(2pi I_c)$為約瑟夫森接面的一個特性參數，稱為約瑟夫森電感。


基於約瑟夫森接面與非線性電感的相似性，當超流經約瑟夫森接面時，其儲存的能量可以計算。@tinkham_introduction_2015
流經接面之超導電流與約瑟夫森位相差，透過電流-相位關係式（CPR）相關聯：

$
  I = I_c sin(phi).
$

超導相位演進方程式類似於法拉第定律：

$
  V = (dif Phi)/(dif t).
$

假設在時間 $t_1$ 時，約瑟夫森相為 $phi_1$ ；在較晚的時間 $t_2$ ，約瑟夫森相演變為 $phi_2$ 。接面的能量增加等於對面點所做的功：

$
  Delta E = limits(integral)_(t_1)^(t_2) V I dif t = limits(integral)_(t_1)^(t_2) V I dif Phi = limits(integral)_(phi_1)^(phi_2) I_c sin phi dif (Phi_0 phi/(2pi)) = -(Phi_0 I_c)/(2pi) Delta cos phi.
$

這表明約瑟夫森接面中能量的變化僅取決於接面的初始狀態和最終狀態，而與路徑無關。因此，約瑟夫森接面中儲存的能量是一種狀態函數，其定義如下：

$
  E(phi) = -(Phi_0 I_c)/(2pi) cos phi ＝ -E_J cos phi.
$

$E_J = abs(E(0)) = (Phi_0 I_c)/(2pi)$是約瑟夫森接面的特徵參數，稱為約瑟夫森能量（Josephson energy）。且如$E_J = L_J I_c^2$所示，它與約瑟夫森電感有關。此外，也常用另一個等價的定義$E(phi) = E_J (1 - cos phi)$。
與非線性磁場線圈電感在電流通過時在其磁場中積累潛在能量不同，在約瑟夫森接面的情況下，超導電流並不產生磁場其儲存的能量來自於載荷載體的動能。

=== 電阻電容並聯連接（RCSJ）模型 <subsection-RCSJ-model>
阻電容並聯連接模型（Resistively and Capacitively Shunted Junction, RCSJ model）或簡稱為並聯連接模型@mccumber_effect_1968 @chakravarty_quantum_1988，是描述約瑟夫森接面的經典模型之一。該模型將約瑟夫森接面視為一個具有電阻（$R$）、電容（$C$）和約瑟夫森電感（$L_J$）的並聯電路，除了基本約瑟夫森關係@eq-1st-josephson，@eq-sc-phase-evolution 外，還包含了實際約瑟夫連接的交流阻抗效應。這個模型能夠捕捉到接面在不同操作條件下的動態行為，特別是在存在外部電壓和噪聲時的響應。

依據戴維寧定理（Thévenin's theorem）@bhlpage4797088 @johnson_origins_2003， 接面的交流阻抗可由一個電容與一個並聯電阻來表示，這兩者均與理想約瑟夫森接面並聯@barone_physics_1996。電流驅動的完整表達式 $I_("ext")$變為：

$
  I_("ext") = I_s + I_R + I_C = I_c sin(phi) + V/R + C_J (dif V)/(dif t).
$

其中$I_C$項為接面等效電容（effective capacitance）$C_J$帶有的位移電流（displacement current），$I_R$項為接面等效電阻（effective resistance）$R$帶有的正常電流（normal current）。


根據克希荷夫電路定律（Kirchhoff Circuit Laws），流過結的總電流 $ I $ 可寫為：
$ I = I_s + I_R + I_C $. <eq-rcsj-kcl>

其中 $ I_s = I_c sin(phi) $ 為超導電流，$ I_R = V / R $ 為流過電阻的電流，$ I_C = C (dif V) / (dif t) $ 為流過電容的電流。將 $ V = (hbar) / (2 e) (dif phi) / (dif t) $ 代入，得到 RCSJ 模型核心方程：

$ I = I_c sin(phi) + (hbar) / (2 e R) (dif phi) / (dif t) + (hbar C) / (2 e) (dif^2 phi) / (dif t^2) $. <eq-rcsj-core>

此方程為非線性微分方程，描述約瑟夫森結在施加電流下的動態行為。RCSJ 模型能良好解釋約瑟夫森結的 I–V 特性，包括遲滯（hysteresis）與電壓跳變（voltage jumps）。

*物理意義：*
- *$I_c sin(phi)$項：*代表超導電流，是約瑟夫森效應的量子本質；使得結在零電壓下亦能傳輸電流，直至電流達臨界值$I_c$。
- *$(hbar) / (2 e R) (dif phi) / (dif t)$項：* 代表正常電流，描述結在電壓態下的耗散；電阻$R$反映準粒子激發與能量耗散。
- *$(hbar C) / (2 e) (dif^2 phi) / (dif t^2)$項：* 代表電容電流，描述結的電容效應；電容$C$決定結對電壓變化的響應速度，並在某些情況下導致 I–V 特性的遲滯。

RCSJ 模型是理解 DC SQUID 工作原理的基礎，因 SQUID 的響應直接取決於內部約瑟夫森結的動態行為。透過分析此模型，可預測 SQUID 的電壓響應、臨界電流調製與雜訊特性。

=== 約瑟夫森穿透深度

約瑟夫森穿透深度(Josephson penetration depth)描述了外加磁場穿透長約瑟夫森接面之典型長度。它通常以$lambda_J$ 表示，並由下列公式給出：

$
  lambda_J = sqrt(Phi_0/(2pi mu_0 d' j_c)),
$

其中$Phi_0$為磁通量量子，$j_c$為臨界超導電流密度（critical supercurrent density, $A/m^2$ ），而$d'$則代表超導電極的電感@weihnacht_influence_1969：

$ 
d' = d_I + lambda_1 tanh(d_1/(2 lambda_1)) + lambda_2 tanh(d_2/(2 lambda_2)) 
$



其中$d_I$為約瑟夫森勢壘（Josephson barrier）的厚度（通常為絕緣體），$d_1$ 和$d_2$ 分別為超導電極的厚度，而$lambda_1$和 $lambda_2$則為其倫敦穿透深度（London penetration depths）。若臨界電流密度非常低，約瑟夫森穿透深度通常在數微米至數毫米之間@buckel_supraleitung:_2004。


=== 超導量子干涉儀 (SQUID) <subsection-SQUID>

超導量子干涉儀（Superconducting Quantum Interference Device, SQUID）是基於約瑟夫森效應的超導元件，具有極高的磁場靈敏度和精確度，其工作原理基於磁通量量子化和量子干涉效應。RF SQUID 只需要一個約瑟夫森接面（超導穿隧接面），這可能使其生產成本較低，但靈敏度較低。DC。SQUID 主要有兩種類型：直流（DC）和射頻（RF）。DC SQUID 的基本結構由兩個約瑟夫森接面組成，這些接面被一個薄材料所隔開形成弱連結。RF SQUID 只需要一個約瑟夫森接面（超導穿隧接面），這可能使其生產成本較低，但靈敏度較低。

直流超導量子干涉儀（DC SQUID）於 1964 年由福特研究實驗室（Ford Research Labs）的 Robert Jaklevic、John J. Lambe、James Mercereau 和 Arnold Silver 所發明，此後於 1962 年由 Brian Josephson 提出約瑟夫森效應，並於 1963 年由 John Rowell 和 Philip Anderson 在貝爾實驗室（Bell Labs）製造了第一個約瑟夫森接面@anderson_probable_1963。它在超導迴路中並聯了兩個約瑟夫森結。它基於直流約瑟夫森效應。在沒有任何外部磁場的情況下，輸入電流（input current）$I_("input")$會平均分佈到兩個分支。若對超導迴路施加一個小的外部磁場，則會開始在迴路中循環一個屏蔽電流（screening current）$I_s$，該電流會產生一個抵銷外加磁通量的磁場，並創造一個與外部磁通量成正比的額外約瑟夫森相位。感應電流（induced current）的方向與$I$在超導迴路的一個分支中相同，而在另一個分支中與 $I$ 相反；總電流變為 $1/2I_("input")+I_s$ 在某一分支，而$1/2I_("input")-I_s$ 在另一分支。一旦任一分支中的電流超過約瑟夫森接面的臨界電流$I_c$，則在接面上會出現電壓。

現在假設外部磁通量進一步增加，直到超過$Phi_0$，即磁通量量子的一半。由於超導迴路所包圍的磁通量必須是磁通量量子的整數倍，因此 SQUID 不再顯著屏蔽磁通量，而是能量上更傾向於將其增加到$Phi_1$。此時電流反向流動，抵禦了所容許的磁通量$Phi_2$ 與略超過 $Phi_3$ 的外部磁場之間的差異。隨著外部磁場的增加，電流逐漸減小，當磁通量剛好為 $Phi_4$ 時電流為零，並且當外部磁場進一步增加時，電流再次反向。因此，電流的方向會週期性地改變，每當磁通量增加半整數倍數的 $Phi_5$ 時就會改變一次，在最大電流時每增加半整數加整數倍數的 $Phi_6$ 時會改變一次，而在整數倍數時電流為零。

若輸入電流大於$I_c$，則 SQUID 始終運作於電阻模式。此時，電壓即為外加磁場的函數，且週期等於$Phi_0$。由於直流 SQUID 的電流-電壓特性（current-voltage characteristic）具有遲滯現象（hysteretic），故在接面間連接一個並聯電阻$R$以消除遲滯（在內稟電阻（intrinsic resistance）足夠的情況下）。屏蔽電流為應用磁通量除以環路的自感。因此$Delta Phi$可估算為$Delta V$磁通量至電壓轉換器）@de_lacheisserie_magnetism:_2002 @clarke_squid_2004 ，如下所示：

$
  Delta V=R dot Delta I, \
  2 dot Delta I = 2 dot (Delta Phi)/ L, \
  Delta V = R/L dot Delta Phi.
$
其中 $L$ 為超導環路的自感（self inductance），本節的討論假設迴路中存在完美的磁通量量子化。然而，這僅對具有較大自感的較大迴路才成立。根據上述關係，這也意味著電流和電壓變化較小。實際上，迴路的自感$L$並不這麼大。一般情況可通過引入一個參數

$
  lambda = (i_c L)/Phi_0
$

其中$i_c$為SQUID的臨界電流。通常$lambda$為一個數量級@de_waele_quantum-interference_1969。

=== 磁通量量子化

在超導環中，磁通量是量子化的；其基本磁通量量子（magnetic flux quantum）為：
$ Phi_0 = h / (2 e) approx 2.067 × 10^-15 $ Wb. <eq:phi0>

因此環中磁通量 $Phi$ 只能取整數倍：$Phi = n Phi_0$，其中 $n$是一個整數。這個量子化條件是 SQUID 能夠測量微弱磁場的根本原因。

=== DC SQUID 的工作機制

DC SQUID 的兩個約瑟夫森結並聯在一個超導環上。當一個偏置電流 $I_b$ 施加到 SQUID 上時，它會分成兩部分，分別流經兩個約瑟夫森結。結的總相位差 $Delta phi$ 不僅取決於施加的偏置電流，還取決於穿過超導環的總磁通量 $Phi_T$。總磁通量 $Phi_T$ 是外部施加磁通量 $Phi_a$ 和 SQUID 環路中由超導電流引起的自感磁通量 $L I_s$ 的總和，其中 $L$ 是 SQUID 環路的電感。

根據磁通量量子化條件和約瑟夫森關係式，兩個結的相位差之和與環路中的磁通量有關。具體來說，兩個結的相位差滿足
$
  phi_2 - phi_1 = (2 pi / Phi_0) Phi_T,
$ <eq-squid-phase-diff>
其中 $Phi_0$ 為磁通量量子。若將每個接面的電流寫成 $I_1 = I_c sin phi_1$ 與 $I_2 = I_c sin phi_2$，則總偏置電流為
$
  I_b = I_1 + I_2 = 2 I_c sin phi_m cos(pi Phi_T / Phi_0),
$
其中 $phi_m = (phi_1 + phi_2)/2$。因此，SQUID 的臨界電流會隨外加磁通量調變，
$
  I_{c, text("eff")}(Phi_a) = 2 I_c abs(cos(pi Phi_a / Phi_0)),
$ <eq-squid-critical-current>
顯示出以磁通量量子 $Phi_0$ 為週期的干涉圖樣。當偏置電流超過此臨界值並進入電壓態時，測得的電壓亦會隨磁通量呈週期振盪，這正是 DC SQUID 進行高靈敏度磁場量測的物理基礎。


=== 基礎理論 <subsection-basic-theory>

相關的基礎理論包括 @reference1 所提出的框架，以及 @reference2 的重要貢獻。

=== 現有方法 <subsection-existing-methods>

目前主要的研究方法可以歸納為以下幾類：

1. *傳統方法*：基於經典理論的傳統做法
2. *現代方法*：結合新技術的改進方法
3. *混合方法*：整合多種技術的綜合方法

== 技術發展趨勢 <section-technology-trends>

近年來相關技術的發展呈現以下趨勢：

- 方法的多樣化
- 效能的提升
- 應用範圍的擴大

== 研究空白與挑戰 <section-research-gaps>

通過文獻回顧，我們發現現有研究仍存在以下空白：

1. 理論模型的完善性
2. 實驗驗證的充分性
3. 實務應用的可行性

== 本研究的定位 <section-research-positioning>

基於上述分析，本研究在相關領域中的定位是：提供一個新穎的研究方法，解決現有技術的限制，並為實務應用提供可行的解決方案。
