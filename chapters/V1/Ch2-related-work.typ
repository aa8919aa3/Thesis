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

超導量子干涉儀（Superconducting Quantum Interference Device, SQUID）是基於約瑟夫森效應的超導元件，具有極高的磁場靈敏度和精確度，其工作原理基於磁通量量子化和量子干涉效應。RF SQUID 只需要一個約瑟夫森接面（超導穿隧接面），這可能使其生產成本較低，但靈敏度較低。SQUID 主要有兩種類型：直流（DC）和射頻（RF）。DC SQUID 的基本結構由兩個約瑟夫森接面組成，這些接面被一個薄材料所隔開形成弱連結。

直流超導量子干涉儀（DC SQUID）於 1964 年由福特研究實驗室（Ford Research Labs）的 Robert Jaklevic、John J. Lambe、James Mercereau 和 Arnold Silver 所發明，此後於 1962 年由 Brian Josephson 提出約瑟夫森效應，並於 1963 年由 John Rowell 和 Philip Anderson 在貝爾實驗室（Bell Labs）製造了第一個約瑟夫森接面@anderson_probable_1963。它在超導迴路中並聯了兩個約瑟夫森接面。它基於直流約瑟夫森效應。在沒有任何外部磁場的情況下，輸入電流（input current）$I_("input")$會平均分佈到兩個分支。若對超導迴路施加一個小的外部磁場，則會開始在迴路中循環一個屏蔽電流（screening current）$I_s$，該電流會產生一個抵銷外加磁通量的磁場，並創造一個與外部磁通量成正比的額外約瑟夫森相位。感應電流（induced current）的方向與$I$在超導迴路的一個分支中相同，而在另一個分支中與 $I$ 相反；總電流變為 $1/2I_("input")+I_s$ 在某一分支，而$1/2I_("input")-I_s$ 在另一分支。一旦任一分支中的電流超過約瑟夫森接面的臨界電流$I_c$，則在接面上會出現電壓。

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

=== DC SQUID 的工作機制：超導電流的量子干涉

DC SQUID 優雅地利用了前述的兩個基本原理——超導迴路中的磁通量量子化與約瑟夫森接面的電流-相位關係——來創造一個磁通量的量子干涉儀。透過在超導環上並聯兩個約瑟夫森接面，該元件能透過兩個超導電流路徑的量子力學干涉，對穿過迴路的磁通量變得敏感。本節將對理想對稱 DC SQUID 的總電流-相位關係進行形式推導，並詳細分析此干涉如何導致元件臨界電流的週期性調變，這正是其作為超靈敏磁力計功能的基礎。

==== 對稱 DC SQUID 的定義與參數

#figure(
  image("../Images/SQUID_schematic.png", width: 70%),
  caption: [DC SQUID示意圖：(a) 兩個約瑟夫森接面（以叉號表示）並聯於一個電感為 L 的超導環上。偏置電流 $I_b$ 分流通過兩個臂，外加磁通量 $Phi_("ext")$ 穿過環路。 (b) 描述 SQUID 動態的等效電路，其中每個接面由 RCSJ 模型表示。圖片來源：IMS, KIT@kit_squid_schematic]
) <fig-squid-schematic>

DC SQUID 的結構如圖 @fig-squid-schematic 所示，由一個幾何自感為 $L$ 的封閉超導迴路組成，該迴路被兩個並聯的約瑟夫森接面 JJ1 和 JJ2 中斷。偏置電流 $I_b$ 從迴路一側注入，從另一側取出，使電流分流並流經包含接面的兩個臂。

*對稱 DC SQUID* 的概念指的是一個理想化模型，其中兩個接面和迴路的物理參數完全匹配。具體來說，假設滿足以下條件：

1. *相同的接面*：兩個約瑟夫森接面具有相同的臨界電流 ($I_(c 1) = I_(c 2 ) = I_c$)、正常態電阻 ($R_(N 1) = R_(N 2) = R_N$) 和電容 ($C_1 = C_2 = C$)。
2. *對稱的電感*：總迴路電感 $L$ 被認為在干涉儀的兩個臂之間平均分配，因此臂 1 的電感為 $L_1 = L/2$，臂 2 的電感為 $L_2 = L/2$。

雖然沒有任何真實元件是完美對稱的，但這個模型提供了量子干涉的基本物理原理，並作為理解不對稱和其他非理想性影響的基準。SQUID 的行為由一組關鍵參數決定，這些參數結合了接面的內在屬性與迴路的幾何形狀。

==== 總電流-相位關係的形式推導

DC SQUID 的核心特性是其總電流-相位關係，它描述了總超導電流如何依賴於有效相位差和磁通量。推導過程始於對稱 SQUID 迴路應用克希荷夫電流定律和磁通量量子化條件。

假設接面具有標準的正弦 CPR，則流經兩個臂的超導電流 $I_1$ 和 $I_2$ 為：
$ I_1 = I_c sin(phi_1) \ I_2 = I_c sin(phi_2) $
其中 $phi_1$ 和 $phi_2$ 分別是 JJ1 和 JJ2 上的規範不變相位差。流經 SQUID 的總超導電流 $I_s$ 是兩個並聯支路電流的總和：
$ I_s = I_1 + I_2 = I_c (sin phi_1 + sin phi_2) $
相位差 $phi_1$ 和 $phi_2$ 並非獨立，它們由穿過迴路的磁通量 $Phi$ 耦合。如前所述，宏觀波函數的單值性要求，沿任何閉合超導迴路積分的總相位變化必須是 $2 pi$ 的整數倍。當應用於穿過兩個接面的 SQUID 迴路時，此拓撲約束直接導致規範不變相位之間的以下關係：
$ phi_2 - phi_1 = (2 pi Phi) / Phi_0 mod 2 pi $
此方程式是庫柏對的阿哈羅諾夫-玻姆效應的數學表達式；磁通量在超導電流可用的兩個量子力學路徑之間引入了相對相移。

為了簡化總電流的表達式，我們使用三角恆等式 $sin A + sin B = 2 sin((A+B)/2) cos((A-B)/2)$。代入磁通量量子化條件中的 $phi_1$ 和 $phi_2$ 表達式，可得：
$ I_s = 2 I_c sin((phi_1 + phi_2)/2) cos((phi_2 - phi_1)/2) $
將磁通量約束代入餘弦項，得到：
$ I_s = 2 I_c sin((phi_1 + phi_2)/2) cos((pi Phi) / Phi_0) $
此方程式即為*對稱 DC SQUID 的總電流-相位關係*。它顯示 SQUID 的行為類似於一個單一的有效約瑟夫森接面，其 CPR 為 $I_s = I_("max")(Phi) sin(phi_("avg"))$，其中 $phi_("avg") = (phi_1 + phi_2)/2$ 是裝置的平均相位差，其有效臨界電流 $I_("max")(Phi)$ 是磁通量的函數。

==== SQUID 臨界電流的磁通量調變分析

推導出的總 CPR 揭示了 SQUID 的主要操作特性：其最大超導電流受磁通量的調變。整個 SQUID 的臨界電流，我們表示為 $I_("max")(Phi)$，是在給定磁通量 $Phi$ 下，總超導電流 $I_s$ 可達到的最大值。當平均相位項 $sin(phi_("avg"))$ 達到其最大值 $±1$ 時，達到此最大值。因此，從總 CPR 中，我們可以直接寫出 SQUID 臨界電流的表達式：
$ I_("max")(Phi) = 2 I_c abs(cos((pi Phi) / Phi_0)) $
這個基本方程式描述了 SQUID 臨界電流作為穿過迴路的磁通量的函數的週期性調變。此關係的主要特點是：

- *週期性*：臨界電流是磁通量 $Phi$ 的週期函數，週期恰好為一個磁通量量子 $Phi_0$。測得的臨界電流中的每次振盪對應於磁通量變化一個 $Phi_0$。
- *建設性干涉*：當磁通量是磁通量量子的整數倍時，即 $Phi = n Phi_0$（其中 n 為整數），臨界電流達到其絕對最大值 $2 I_c$。在這些磁通量值下，餘弦項為 $±1$。這對應於兩臂之間的相位差為 $phi_2 - phi_1 = 2 pi n$，表示兩個超導電流完全同相並建設性地相加。
- *破壞性干涉*：當磁通量是磁通量量子的半整數倍時，即 $Phi = (n + 1/2) Phi_0$，臨界電流達到其最小值 0。在這些點上，餘弦項為 0。這對應於相位差為 $phi_2 - phi_1 = (2n+1) pi$，表示兩個超導電流完全異相並完全抵消。

這種行為是宏觀量子干涉的直接而明確的表現。SQUID 作為庫柏對的量子干涉儀，其功能類似於邁克生或馬赫-曾德干涉儀對光子的作用，或雙縫實驗對電子的作用。SQUID 的兩個臂為超導電流從輸入端到輸出端提供了兩條不同的量子力學路徑。磁通量 $Phi$ 作為一個控制旋鈕，連續調節這兩條路徑之間的相對相位差。當路徑同相時 ($Phi=n Phi_0$)，庫柏對穿過每條路徑的機率幅相加，導致總電流較大。當路徑異相時 ($Phi=(n+1/2) Phi_0$)，機率幅相減，導致總電流為零。因此，SQUID 臨界電流的週期性調變是由宏觀超導凝聚體的波狀性質產生的干涉圖樣。通過用電流偏置 SQUID 並測量產生的電壓（取決於偏置電流是否超過與磁通量相關的臨界電流），可以以極高的靈敏度檢測到微小的磁通量變化。

=== 非理想性對 SQUID 性能的影響

前述對理想對稱 DC SQUID 的分析提供了量子干涉的基本物理原理。然而，真實 SQUID 的性能和行為受到非理想因素的顯著影響，最主要的是超導迴路的有限電感和熱漲落的影響。一個全面的理論模型必須考慮這些效應，才能準確描述元件的動態並預測其最終靈敏度。電阻電容並聯（RCSJ）模型為納入這些非理想性提供了一個強大的框架，將 CPR 的靜態圖像轉變為在實際操作環境中 SQUID 相位演化的動態描述。

==== 有限迴路電感的作用：屏蔽參數 $beta_L$

在任何物理 SQUID 中，連接兩個約瑟夫森接面的超導迴路都具有非零的幾何自感 $L$。此電感對元件對外部磁通量 $Phi_("ext")$ 的響應有深遠的影響。當施加外部磁通量時，SQUID 會根據冷次定律和磁通量量子化原理，在迴路中感應出一個持續的循環屏蔽電流 $I_("cir")$ 來抵抗變化。這個循環電流本身會產生一個磁通量 $Phi_L = L I_("cir")$。因此，穿過迴路並控制量子干涉的總磁通量 $Phi$ 不等於外部磁通量，而是外部磁通量和自感應磁通量之和：
$ Phi = Phi_("ext") + L I_("cir") $
循環電流可以用單個接面電流表示為 $I_("cir") = (I_2 - I_1)/2$。對於具有正弦 CPR 的相同接面，這變為：
$ I_("cir") = I_c/2 (sin phi_2 - sin phi_1) = -I_c cos((phi_1 + phi_2)/2) sin((phi_2 - phi_1)/2) $
使用磁通量量子化條件 $phi_2 - phi_1 = 2 pi Phi / Phi_0$，可簡化為：
$ I_("cir") = -I_c cos(phi_("avg")) sin((pi Phi) / Phi_0) $
這揭示了一個自洽的回饋迴路：總磁通量 $Phi$ 決定了相位差，相位差決定了循環電流 $I_("cir")$，而循環電流又貢獻於總磁通量 $Phi$。此內在回饋的強度由無因次*屏蔽參數* $beta_L$ 量化：
$ beta_L equiv (2 L I_c) / Phi_0 $
參數 $beta_L$ 可解釋為屏蔽電流可產生的最大磁通量（當 $I_("cir")$ 達到其最大可能值 $I_c$ 時），並以 $Phi_0/2$ 進行歸一化。它代表了 SQUID 內部回饋機制的增益，該機制試圖穩定總磁通量以抵抗外部擾動。$beta_L$ 的值對 SQUID 的行為至關重要：

- *可忽略的屏蔽 ($beta_L << 1$)*：當電感或臨界電流很小時，自感應磁通量與磁通量量子相比可以忽略不計 ($Phi_L << Phi_0$)。在此極限下，$Phi approx Phi_("ext")$，SQUID 的行為符合理想模型。臨界電流隨外部磁通量的調變深度接近 100%，在半整數磁通量量子處完全抵消。
- *強屏蔽 ($beta_L >> 1$)*：當電感較大時，屏蔽效應占主導地位。循環電流將調整以幾乎完全抵消外部磁通量的任何變化，使總內部磁通量 $Phi$ 釘扎在最接近 $Phi_0$ 的整數倍處。這種強烈的負回饋極大地抑制了 SQUID 總臨界電流的調變。
- *最佳範圍 ($beta_L approx 1$)*：對於大多數應用，特別是作為靈敏磁力計，需要達到最佳平衡。通常選擇 $beta_L approx 1$ 的值。此值足夠大以提供強耦合，但又足夠小以維持顯著的非磁滯調變。

==== 動態行為與熱漲落：RCSJ 模型

當 SQUID 的偏置電流 $I_b$ 超過其與磁通量相關的臨界電流 $I_("max")(Phi)$ 時，它會轉變為電阻態，並在其端子間出現有限電壓。為了模擬這種動態耗散行為，我們採用了*電阻電容並聯（RCSJ）模型*。在此模型中，每個理想的約瑟夫森元件（由其 CPR 描述）與一個電阻 $R_N$（代表準粒子穿隧）和一個電容 $C$（代表接面的幾何電容）並聯。

通過對 SQUID 電路的兩個迴路應用克希荷夫定律，可以推導出一組關於相位差 $phi_1$ 和 $phi_2$ 的耦合二階非線性微分方程。在任何有限溫度下，分路電阻都會表現出約翰遜-奈奎斯特熱噪聲，這表現為與每個接面並聯的波動噪聲電流源 $I_(N i)(t)$。得到的運動方程是一組耦合的朗之萬方程：
$ (Phi_0)/(2pi) C (d^2 phi_1)/(d t^2) + (Phi_0)/(2pi R_N) (d phi_1)/(d t) + I_c sin phi_1 = I_b/2 - I_("cir") + I_(N 1)(t) $
$ (Phi_0)/(2pi) C (d^2 phi_2)/(d t^2) + (Phi_0)/(2pi R_N) (d phi_2)/(d t) + I_c sin phi_2 = I_b/2 + I_("cir") + I_(N 2)(t) $
這些方程通過循環電流 $I_("cir")$ 耦合，完全描述了在存在熱噪聲的情況下 SQUID 的經典動力學。

SQUID 的動力學可以形象地看作一個虛構粒子在一個二維勢能面上運動，受到偏置電流的傾斜力、電阻的粘滯阻力和熱噪聲電流的隨機踢動。當 $I_b < I_("max")$ 時，粒子被困在一個勢阱中，對應於零電壓超導態。熱漲落可能提供足夠的能量使粒子越過勢壘，這種事件稱為*熱激活相滑移（TAPS）*。每次相滑移發生時，接面上的相位差變化約 $2 pi$，根據第二約瑟夫森關係，這會產生一個短暫的電壓脈衝。在電阻態下（$I_b > I_("max")$），相滑移以高速率發生，這些滑移的時間平均速率產生了測得的直流電壓。因此，CPR 通過塑造勢能景觀，直接決定了相滑移的能壘高度，從而控制了 SQUID 的電流-電壓特性、動態響應和內在噪聲性能。

=== 結論：綜合與未來展望

本分析為理解對稱 DC SQUID 中的電流-相位關係提供了一個全面的理論框架。從宏觀量子力學的基本原理到實際 SQUID 的複雜動力學的過程，揭示了一套緊密相連的物理概念。出現的核心論點是，組成約瑟夫森接面的電流-相位關係至關重要。CPR 不僅僅是一個描述性參數，而且是弱連結中電荷傳輸的微觀物理與整個元件的宏觀、可測量量子行為之間的基本聯繫。

對非理想性的分析證明了實際元件參數的關鍵作用。由屏蔽參數 $beta_L$ 量化的有限迴路電感，作為一種內在回饋機制，可以屏蔽外部場並降低臨界電流的調變深度。通過 RCSJ 模型納入的熱漲落，驅動了系統的動力學，引起熱激活相滑移，從而產生 SQUID 的電壓響應和內在噪聲。

對非正弦 CPR 的探索突顯了該領域的現代視角。標準的正弦關係現在被理解為更通用的多諧波描述的低透明度極限。接面 CPR 中較高諧波的存在，導致 SQUID 中出現複雜的非餘弦磁通量調變模式，將該元件轉變為能夠探測其自身組分諧波含量的光譜工具。

該領域的未來展望與電流-相位關係的持續探索和工程設計密切相關。材料科學的進步，包括基於半導體、石墨烯和拓撲絕緣體的混合接面的發展，有望提供對 CPR 的前所未有的控制。對這些新型系統中 CPR 的精確測量和理論理解，對於釋放其潛力至關重要。對稱 SQUID 曾主要作為傳感器，將繼續發展成為一個不可或缺的平台，既用於研究基本的量子傳輸，也用於構建下一代超導電子學和量子信息處理器。

