= 理論背景 Theoretical Background <chapter-theoretical-background>

本章節旨在建立理解本研究核心物理現象所需的理論框架。我們將從約瑟夫森效應的基本原理出發，接著介紹作為其關鍵應用的超導量子干涉儀（superconducting quantum interference device, SQUID），並特別強調非對稱 SQUID 如何成為探測非傳統電流-相位關係（current-phase relation, CPR）的有力工具。最後，我們將聚焦於本研究的核心材料——第二類狄拉克半金屬 (type-II Dirac semimetal) 二碲化鉑（$"PtTe"_2$），闡述其獨特的拓撲性質為何預期會產生可被 SQUID 量測的非正弦 CPR。

== 超導體中的宏觀量子現象基礎 Foundations of Macroscopic Quantum Phenomena in Superconductors <section-superconductivity>

超導性 (superconductivity) 為超導量子元件的基石。本節簡要回顧庫柏對凝聚、宏觀波函數以及 Ginzburg–Landau 描述，作為理解約瑟夫森效應與 SQUID 的起點。

=== 庫柏對凝聚與宏觀波函數 The Cooper Pair Condensate and the Macroscopic Wavefunction <subsection-cooper-pairs>

在溫度低於臨界溫度 $T_c$ 時，傳統超導體中的電子會成對形成庫柏對 (Cooper pairs)，並凝聚成一個共享單一量子態的宏觀量子流體。此凝聚態可由一複數序參數 (order parameter)
$ Psi(r) = abs(Psi(r)) e^(i theta(r)) $
描述，其中 $abs(Psi(r))^2$ 與局部庫柏對密度成正比，而相位 $theta(r)$ 則扮演後續約瑟夫森效應與 SQUID 理論中的關鍵角色。

在均勻超導體中，$theta$ 為常數；然而在存在外加電磁場、幾何拘束或弱連結 (weak links) 時，相位將在空間中變化，並與超導電流密度 $j_s$ 透過
$ j_s prop nabla theta - (2 e)/(ħ) A $
（其中 $A$ 為向量位勢）產生關聯。這種相位剛性 (phase stiffness) 與相位梯度所導致的超電流，是理解磁通量子化與 Josephson 接面電流-相位關係的核心。

=== Ginzburg–Landau 描述與相干長度 Ginzburg–Landau Description and Coherence Length <subsection-ginzburg-landau>

Ginzburg–Landau (GL) 理論提供一個有效場論框架，以能量泛函描述超導態：
$
  F[Psi] = integral dif^3 r [
    alpha abs(Psi(r))^2 + (beta/2) abs(Psi(r))^4
    + (1/(2 m^*)) abs(- i ħ nabla - 2 e A) Psi(r))^2
  + (B^2)/(2 mu_0)
  ],
$
其中 $alpha, beta$ 為溫度相關係數，$m^*$ 為庫柏對有效質量，$B = nabla times A$ 為磁場。

由此可定義兩個重要長度尺度：倫敦穿透深度 $lambda_L$ 與相干長度 $xi$。前者描述磁場進入超導體的典型衰減距離，後者則對應序參數在空間中由正常態過渡到超導態的變化尺度。對於後續討論的弱連結與 Josephson 接面而言，相干長度決定了超導序參數在接面附近如何衰減與連續。

當超導體形成封閉迴路時，由 GL 理論可導出磁通量量子化條件
$ integral_C (nabla theta - (2 e)/(ħ) A) dot dif l = 2 pi n, quad n in bb(Z), $
進而得到穿越超導環的總磁通量為
$ Phi = integral_S B dot dif S = n Phi_0, quad Phi_0 = h/(2 e) $
（$Phi_0$ 為磁通量子）。這個結果將在 SQUID 理論中反覆出現。

== 約瑟夫森效應與電流-相位關係 Josephson Effect and Current-Phase Relation <section-josephson-effect>

當兩個超導體以一層薄勢壘、正常金屬或拓撲材料弱連結時，庫柏對可以透過量子穿隧跨越界面，即形成 Josephson 接面。Josephson 在 1962 年預言，在無外加電壓的情況下，接面可支撐一個與兩側超導序參數相位差 $phi$ 有關的無耗散超電流。

=== DC 約瑟夫森效應與標準 CPR The DC Josephson Effect and the Standard CPR <subsection-dc-josephson>

對於傳統短接面，最簡單的電流-相位關係為
$ I_s (phi) = I_c sin phi, $
其中 $I_c$ 為臨界電流。該關係反映接面中基態 Andreev 位能隨相位差的變化，並在多數金屬超導接面中是一階近似良好的描述。

然而在具強自旋軌道耦合、拓撲能帶結構或非平衡分佈的系統中，$I_s (phi)$ 會顯著偏離純正弦形式，出現高次諧波或 $phi_0$-shift 等現象。本研究所關注的 type-II Dirac 半金屬與 S–DSM–S Josephson 結構，即預期會呈現非正弦 CPR，需透過 SQUID 量測加以解析。

=== AC 約瑟夫森效應與 RCSJ 模型 The AC Josephson Effect and the RCSJ Model <subsection-rcsj-model>

若在 Josephson 接面施加直流電壓 $V$，則相位隨時間線性增加
$ (dif phi)/(dif t) = (2 e)/(ħ) V, $
導致接面支撐頻率為
$ f = (2 e)/(h) V $
的交流超電流，稱為 AC 約瑟夫森效應。

實際接面會同時具有電阻與寄生電容，常用「電阻與電容並聯模型」（resistively and capacitively shunted junction, RCSJ）描述其動力學：
$
  I = I_c sin phi
  + (V)/(R)
  + C (dif V)/(dif t).
$
利用 AC 約瑟夫森關係消去電壓 $V$，可將運動方程寫成相位的二階微分方程
$
  I = I_c sin phi
  + (ħ)/(2 e R) (dif phi)/(dif t)
  + C (ħ)/(2 e) (dif^2 phi)/(dif t^2).
$
在弱噪聲與低頻近似下，臨界電流 $I_c$ 可視為接面 CPR 的最大超電流，並作為後續 SQUID 解析的基本量。

== 對稱直流 SQUID 的理論模型 Symmetric dc SQUID: Theoretical Model <section-symmetric-dc-squid>

直流 SQUID (dc SQUID) 由兩個 Josephson 接面串聯於超導環上構成，並以外加磁通量 $Phi_("ext")$ 作為主要控制參數。對於兩個接面幾近相同的對稱情況，可得到簡潔的電流-磁通干涉圖樣，作為後續非對稱系統的參考。

=== 幾何結構與磁通量子化 Geometry and Flux Quantization <subsection-geometry-flux-quantization>

考慮兩個臨界電流皆為 $I_c$ 的接面，分別具有相位差 $phi_1, phi_2$。磁通量子化條件導致
$ phi_1 - phi_2 + (2 pi Phi)/(Phi_0) = 2 pi n, quad n in bb(Z), $
其中 $Phi$ 為穿越 SQUID 迴路的總磁通量，$Phi_0$ 為磁通量子。

若忽略迴路自感（$L arrow 0$，即 $Phi approx Phi_("ext")$），並定義總相位
$ phi = (phi_1 + phi_2)/2, $
則可得 SQUID 的總超電流
$
  I_s = I_1 + I_2
  = I_c sin phi_1 + I_c sin phi_2
  = 2 I_c cos(pi Phi_("ext") / Phi_0) sin phi.
$
因此在掃描 $Phi_("ext")$ 並尋找每一磁通下的最大可持超電流
$ I_s^max (Phi_("ext")) = 2 I_c abs(cos(pi Phi_("ext") / Phi_0)), $
可得到典型的餘弦型干涉圖樣。此結果常被用來標定 SQUID 的對稱性與有效迴路面積。

==== 迴路電感與參數 β_L Loop Inductance and the Parameter $beta_L$ <subsubsection-loop-inductance>

若迴路具有有限自感 $L$，則總磁通量為
$ Phi = Phi_("ext") + L I_s. $
為量化電感效應對干涉圖樣的影響，常定義無因次參數
$ beta_L = (2 pi L I_c)/(Phi_0). $
在 $beta_L lt.double 1$ 的極限中，自感只造成微小修正，干涉圖樣仍近似 $I_s^max (Phi_("ext")) approx 2 I_c |cos(pi Phi_("ext") / Phi_0)|$。然而當 $beta_L gt.approx 1$ 時，自感造成的自生磁通 (self-field) 會顯著扭曲干涉圖樣，須在資料分析中妥善處理。

=== 動態行為與熱漣漪 Dynamic Behavior and Thermal Fluctuations <subsection-dynamic-behavior-thermal-fluctuations>

在實際實驗中，SQUID 的臨界電流與電壓-電流特性會受到熱漣漪與環境噪聲影響。以 RCSJ 模型描述每一個接面並考慮隨機熱噪聲電流 $I_"n"$，可得到類似朗之萬方程的描述，其解答描述了相位在傾斜洗衣板位能 (tilted washboard potential) 中的躍遷與滑落行為。在本研究所操作的溫度與頻率範圍內，實驗條件可視為準靜態 (quasi-static)，量測到的臨界電流主要反映 CPR 的靜態性質，而非高頻動力學。

== 非對稱 SQUID：理論與應用 Non-Symmetric SQUIDs: Theory and Applications <section-asymmetric-squid>

實際製作的 SQUID 很難完全對稱。兩個 Josephson 接面在臨界電流 $I_c$、常態電阻 $R$ 或電容 $C$ 上的差異，都會導致 SQUID 干涉圖樣出現不對稱特徵。更重要的是，刻意引入高度非對稱的兩接面 SQUID，反而可以被利用為探測「弱」接面 CPR 的相位偏置 (phase-biased) 探針。

=== 非對稱性的來源與分類 Sources and Types of Asymmetry <subsection-sources-types-asymmetry>

非對稱性可能源自：

- 幾何尺寸不同：接面寬度、氧化層厚度或弱連結長度的差異。
- 材料或界面品質差異：一側接面可能包含較多缺陷、界面散射或正常金屬層。
- 電路設計上的不均勻：併聯電阻、電容或額外濾波元件只施加在單一接面上。

若以臨界電流為例，可定義強、弱兩接面臨界電流分別為 $I_r$ 與 $I_j$，並以比值
$ alpha = I_j / I_r $
量化非對稱程度。當 $alpha approx 1$ 時 SQUID 近似對稱；而當 $alpha lt.double 1$ 時，系統進入「高度非對稱」極限，這正是 Ginzburg 等人提出 CPR 反演方法@ginzburg_determination_2018 適用的情況。

=== 非對稱 SQUID 的理論分析 Theoretical Analysis of Asymmetric SQUIDs <subsection-asymmetric-squid-theory>

對於一般非對稱 SQUID，可令兩個接面臨界電流分別為 $I_("c1")$ 與 $I_("c2")$，相位差為 $phi_1$ 與 $phi_2$。在忽略迴路電感的極限中，磁通量子化條件給出
$ phi_1 - phi_2 + (2 pi Phi_("ext"))/(Phi_0) = 2 pi n. $
總超電流為
$ I_s = I_("c1") sin phi_1 + I_("c2") sin phi_2. $
解出 $phi_1, phi_2$ 與總相位 $phi$ 的關係後，可得一個一般化的干涉圖樣 $I_s^max(Phi_("ext"))$，其形狀與非對稱程度 $alpha = I_("c2")/I_("c1")$ 以及各接面的 CPR 形式直接相關。當其中一個接面為非常規 Josephson 結構（例如含拓撲態或強自旋軌道耦合的弱連結）時，SQUID 干涉圖樣便攜帶了該非常規 CPR 的資訊。

=== 高度非對稱 SQUID：相位偏置探測器 Highly Asymmetric SQUIDs: Phase-Biased Detectors <subsection-highly-asymmetric-squids>

當一個接面的臨界電流遠大於另一個時（$I_r gt.double I_j$），非對稱 SQUID 可以被視為一個近似「相位偏置 (phase-biased)」的 CPR 探測器@ginzburg_determination_2018。此時：

- *較強接面 (strong junction)*：臨界電流 $I_r$ 最大，CPR 通常可視為近似正弦 $I_("s,r")(phi_r) = I_r sin phi_r$。
- *較弱接面 (weak junction)*：臨界電流 $I_j lt.double I_r$，CPR 可能是未知且非正弦的函數 $I_j(phi)$，也是本研究欲量測的對象。

忽略迴路電感時，兩個接面相位差與外加磁通量的關係為
$ phi_r = phi + (2 pi Phi_("ext"))/(Phi_0), $
其中 $phi$ 為弱接面相位差。整個 SQUID 的總超電流可以寫成
$
  I_s(phi, Phi_("ext")) = I_r sin phi_r + I_j(phi)
  = I_r sin(phi + (2 pi Phi_("ext"))/(Phi_0))
  + I_j(phi).
$
在 $I_r gt.double I_j$ 的極限下，SQUID 的最大可持超電流
$I_s^max(Phi_("ext"))$
幾乎完全由強接面決定，但其在不同磁通下達到極值時所對應的相位條件，仍然受到弱接面 CPR 的細微影響。Ginzburg 等人正是利用這些極值條件，提出一套可從 $I_s^max(Phi_"ext")$ 及其對磁通導數重建 $I_j(phi)$ 的解析方法。

=== 非對稱性對性能的影響與應用 Influence of Asymmetry and Applications <subsection-asymmetry-performance-applications>

非對稱性會影響 SQUID 的多項性能指標：

- *磁通調變深度*：對稱 SQUID 的 $I_s^max$ 可完全調變到接近零；而高度非對稱 SQUID 的最小臨界電流則被「弱接面」與幾何因素所決定。
- *靈敏度與線性度*：在適當偏壓下，高度非對稱 SQUID 的 $I$–$Phi$ 特性可以在某些磁通區間呈現近似線性，提高作為磁通感測器或 CPR 探測器的可用性。
- *CPR 反演能力*：由於干涉圖樣主要由強接面提供大背景，而弱接面只負責「微調」極值位置與斜率，因此只要強接面 CPR 已知（且近似正弦），就能直接從量測到的 $I_s^max(Phi_"ext")$ 中解析出弱接面 CPR。這正是本研究採用高度非對稱 SQUID 來探測 $"PtTe"_2$ 相關 Josephson 結構 CPR 的理論基礎。

=== 基於高度非對稱兩接面 SQUID 的 CPR 反演方法 CPR Reconstruction with a Highly Asymmetric Two-Junction SQUID <subsection-cpr-reconstruction-asym-squid>

本節依照 Ginzburg *et al.* 2018 的推導@ginzburg_determination_2018，整理出高度非對稱 SQUID 的 CPR 反演公式，並以 Typst 形式給出，作為後續資料分析的理論依據。

考慮一個由「強」與「弱」兩接面組成的 SQUID：

- 強接面：臨界電流 $I_r$，CPR 近似為純正弦
  $I_("s,r")(phi_r) = I_r sin phi_r.$
- 弱接面：一般 CPR $I_j(phi)$，不假設特定形式。
- 磁通量子化（零電感極限）給出：
  $ phi_r = phi + (2 pi Phi)/(Phi_0). $

整個 SQUID 的超電流為
$ I_s = I_r sin phi_r + I_j(phi). $ <eq-asym-squid-Is>

在固定外加磁通 $Phi$ 下，臨界電流對應於某個相位 $phi_c(Phi)$，使 $I_s$ 對 $phi$ 取得極大值。極值條件為
$
  0 = (dif I_s)/(dif phi) |_(phi = phi_c)
  = (dif I_j)/(dif phi)
  + I_r cos(phi_c + (2 pi Phi)/(Phi_0)).
$
<eq-asym-squid-extremum>

另一方面，最大超電流本身是磁通的函數：
$
  I_s^max(Phi) = I_s( phi_c(Phi), Phi ).
$
對 $Phi$ 微分可得@ginzburg_determination_2018：
$
  (dif I_("s,max))/(dif Phi) |_(phi = phi_c)
  = [
    (dif I_j)/(dif phi)
    + I_r cos(phi_c + (2 pi Phi)/(Phi_0))
  ] (dif phi_c)/(dif Phi)
  + (2 pi I_r)/(Phi_0) cos(phi_c + (2 pi Phi)/(Phi_0)).$
<eq-asym-squid-dIsdPhi>

利用極值條件 (式 @eq-asym-squid-extremum) 消去 $d I_j / d phi$，可化簡為
$
  (dif I_("s,max))/(dif Phi)
  = (2 pi I_r)/(Phi_0) cos(phi_c + (2 pi Phi)/(Phi_0)),
$
因此
$
  cos(phi_c(Phi) + (2 pi Phi)/(Phi_0))
  = (Phi_0)/(2 pi I_r) (dif I_s^max)/(dif Phi).
$

令右式大小不超過 1 的區域為可反演範圍，即
$
  |(Phi_0)/(2 pi I_r) (dif I_s^max)/(dif Phi)| lt.eq 1.
$
在此範圍內，可以解出
$
  phi_c(Phi)
  = ± arccos(
    (Phi_0)/(2 pi I_r)
    (dif I_s^max)/(dif Phi)
  )
  - (2 pi Phi)/(Phi_0) + 2 pi k, quad k in bb(Z).
$
<eq-asym-squid-phic>

Ginzburg 等人指出，只要選擇合適的號號與整數 $k$，就能得到在 $phi in [0, 2 pi)$ 內連續的 $phi_c(Phi)$ 分支。由於
$
  I_s^max(Phi)
  = I_r sin(phi_c(Phi) + (2 pi Phi)/(Phi_0)) + I_j( phi_c(Phi) ),
$
可重排得到弱接面 CPR 在臨界點的值：
$
  I_j( phi_c(Phi) )
  = I_s^max(Phi)
  - I_r sin(phi_c(Phi) + (2 pi Phi)/(Phi_0)).
$
<eq-asym-squid-Ij>

將式 @eq-asym-squid-phic 代入，再利用
$ sin^2 x + cos^2 x = 1 $
可得一個僅含量測量數的表達式。例如在 Ginzburg *et al.* 使用的無因次化單位下，可寫成
$I_j( phi_c(Phi) )
= I_s^max(Phi)
- op("sgn") cos(phi_c + (2 pi Phi)/(Phi_0))
sqrt{
  I_r^2
  - [
    (Phi_0)/(2 pi)
    (dif I_s^max)/(dif Phi)
  ]^2
},$
其中號號由連續性決定。實務上，本研究採用下列步驟實施 CPR 反演：

1. 量測多個磁通週期中的 $I_s^max(Phi)$，並透過平滑化與多項式或樣條插值構建連續函數。
2. 對 $I_s^max(Phi)$ 以數值方式計算導數 $(dif I_s^max)/(dif Phi)$。
3. 使用式 @eq-asym-squid-phic 計算 $phi_c(Phi)$，並選取在 $phi$–$Phi$ 平面上「連續」的分支。
4. 將 $I_s^max(Phi)$ 與 $phi_c(Phi)$ 代入式 @eq-asym-squid-Ij，得到 $I_j( phi_c(Phi) )$。
5. 以 $(phi_c(Phi), I_j( phi_c(Phi) ))$ 作為參數化表示，重建弱接面 CPR $I_j(phi)$。

值得強調的是，整個推導假設：

- 強接面 CPR 已知且近似純正弦；
- SQUID 迴路電感可忽略（零電感極限）；
- 非對稱程度足夠大（$I_r gt.double I_j$），使弱接面只在 $I_s$ 極值處提供小的修正。

本研究在設計裝置幾何與操作條件時，皆刻意滿足上述假設，以確保 CPR 反演方法與原始理論@ginzburg_determination_2018 完全一致。

=== 有限迴路電感與 CPR 反演 Finite Loop Inductance and CPR Reconstruction <subsection-finite-inductance-cpr>

前述推導建立在零電感極限 ($L arrow 0$) 下，即假設 SQUID 迴路中沒有顯著自生磁通。然而在實際樣品中，迴路電感 $L$ 總是有限；因此總磁通為
$
  Phi = Phi_("ext") + Phi_L
  = Phi_("ext") + L I_s.
$
在高度非對稱 SQUID 中，$I_s approx I_r sin(phi_r)$ 的振幅可能達數十微安，而常見幾何下迴路電感可達數十皮亨至數百皮亨，使得自感磁通
$ Phi_L approx L I_s $
在極端情況下可接近 $Phi_0$ 的非忽略比例。為量化其影響，常定義
$ beta_L = (2 pi L I_r)/(Phi_0). $
當 $beta_L lt.double 1$ 時，自感只造成小幅偏移，可視為對 CPR 反演結果的微小修正；當 $beta_L approx 1$ 或更大時，上述零電感理論將不再適用。

在有限電感情況下，磁通量子化條件需寫成
$ phi_r - phi + (2 pi Phi)/(Phi_0) = 2 pi n, $
$ Phi = Phi_("ext") + L I_s(phi, Phi), $
其中 $I_s$ 又依賴 $phi$ 與 $Phi$。這導致一個自洽非線性方程組，必須數值解出 $phi_r, phi$ 與 $I_s$ 之間的關係，CPR 反演不再能藉由簡單解析公式完成。Ginzburg *et al.* 指出，當 $beta_L$ 不再可忽略時，僅憑 $I_s^max(Phi)$ 及其導數已無法唯一決定 $I_j(phi)$，必須額外引入數值擬合或自洽模擬，甚至量測更完整的 $I$–$Phi$–$V$ 資訊。

本研究中特別控制 SQUID 幾何，以使 $beta_L$ 保持在遠小於 1 的範圍內，並透過獨立估算 $L$ 與 $I_r$（例如由線寬、迴路尺寸與材料參數估算），確認
$ beta_L = (2 pi L I_r)/(Phi_0) lt.double 1. $
因此，在後續資料分析中，我們採用零電感極限的 CPR 反演公式 (式 @eq-asym-squid-phic 與式 @eq-asym-squid-Ij)，並將有限電感效應視為系統性誤差來源，在誤差分析中加以討論，而不在主體理論中顯式展開。

=== 實驗設計與量測技術 Experimental Design and Measurement Techniques <subsection-experimental-design>

在實驗實作上，利用高度非對稱 SQUID 量測 CPR 涉及：

1. 以傳統超導材料（如 Nb 或 Al）製作強接面，確保其 CPR 接近純正弦且臨界電流遠大於弱接面。
2. 將欲探測 CPR 的異常 Josephson 結構（例如含 $"PtTe"_2$ 的 S–DSM–S 接面）置於弱臂，形成弱接面。
3. 精細控制 SQUID 迴路的幾何形狀與面積，以取得合適的 $beta_L$ 與磁通靈敏度。
4. 在稀釋冰箱溫度下，以低噪聲四端量測電路掃描偏壓電流與外加磁場，記錄每一磁通值下的正、反向臨界電流，建立 $I_s^max(Phi)$ 資料集。
5. 透過數值微分與插值，依照上一節描述的 Ginzburg 方法實施 CPR 反演。

本章後續各節將補充非正弦 CPR 的一般理論與 $"PtTe"_2$ 材料特性，說明為何預期在弱接面 CPR 中出現高次諧波甚至 $phi_0$-shift 等拓撲相關特徵。

== 非正弦 CPR 與先進應用 Non-Sinusoidal CPR and Advanced Applications <section-non-sinusoidal-cpr>

在傳統 BCS s-wave 超導體與短 Josephson 接面的極限下，CPR 通常可近似為單一正弦項。然而在具高度透明度、強自旋軌道耦合或拓撲能帶結構的弱連結中，CPR 可能展現遠較豐富的行為，包括高次諧波、非對稱 CPR、$phi_0$ 接面與 Josephson 二極體效應等。這些特性不僅對基礎物理有深遠意義，也為超導邏輯元件與量子位元設計帶來新的可能。

=== 高次諧波與電流-相位關係 Fourier Harmonics in the Current-Phase Relation <subsection-higher-harmonics>

一般而言，CPR 可以展開為傅立葉級數：
$
  I_s(phi) = sum_(n = 1)^infinity
  I_n sin(n phi + delta_n),
$
其中 $I_n$ 為第 $n$ 次諧波振幅，$delta_n$ 為相位位移。在具有時間反轉對稱與中心對稱的傳統系統中，通常可選擇相位原點，使得 $delta_n = 0$，並且以奇數諧波為主。此時 CPR 可簡化為
$ I_s(phi) approx I_1 sin phi + I_2 sin 2 phi + I_3 sin 3 phi + dots $
第二諧波 $I_2$ 的出現通常與高透明度接面、d-wave 或 p-wave 配對、或多通道干涉效應相關。當 $I_2$ 與 $I_1$ 可比時，CPR 可能呈現多穩態或能量位能雙重井結構，對於實現 $\pi$-接面或量子位元具有關鍵影響。

在高度非對稱 SQUID CPR 反演的框架下，若能精確重建 $I_s(phi)$，便可直接讀出各諧波成分 $I_n$ 與其相位位移，進一步檢驗理論模型或數值計算結果。

=== 拓撲量子材料中的 Josephson 效應 Josephson Effect in Topological Quantum Materials <subsection-topological-materials-cpr>

拓撲絕緣體、Weyl/Dirac 半金屬與其他拓撲量子材料中的表面或界面態，預期可支撐具有非平庸拓撲電荷的 Andreev bound states。當這些態與傳統超導電極耦合時，可能導致：

- 4$pi$-周期或近似 4$pi$-周期 CPR（在理想馬約拉那模式下）；
- 具有強烈高次諧波與非對稱性的 CPR；
- 破壞時間反轉或反演對稱後的 $phi_0$-shift；
- Josephson 二極體效應 (Josephson diode effect)，即 $I_c^+ != I_c^-$。

這些現象都可以藉由精確量測 CPR 來辨識，而高度非對稱 SQUID 正提供了一個對 CPR 高靈敏度的量測平台。本研究選擇的 $"PtTe"_2$ 正是一種 type-II Dirac 半金屬，有望在其與常規超導體形成的 S–DSM–S 結構中實現上述非常規 Josephson 效應。

== 二碲化鉑（PtTe2）：材料性質與本研究之關聯 PtTe2: Material Properties and Relevance to This Work <section-ptte2-properties>

二碲化鉑 ($"PtTe"_2$) 為具有層狀結構的過渡金屬二硫屬化物 (transition-metal dichalcogenide, TMD)，近年來被辨識為一種 type-II Dirac 半金屬，其能帶結構中存在傾斜的 Dirac 錐與強自旋軌道耦合。這些特性使得 $"PtTe"_2$ 成為研究拓撲相關輸運與非常規超導近接效應的理想平台。

=== 結構與能帶：type-II Dirac 半金屬 Structural and Electronic Properties: A Type-II Dirac Semimetal <subsection-ptte2-bandstructure>

$"PtTe"_2$ 具有層狀六方晶格結構，每一層由一層 Pt 原子夾在兩層 Te 原子之間所組成。由於強自旋軌道耦合與晶體對稱性，電子能帶在布里淵區的特定高對稱點附近形成傾斜的 Dirac 錐，這種「第二類」Dirac 半金屬的特徵在於其 Dirac 點能量附近的費米面同時包含電子與電洞口袋。

這樣的能帶結構使得 $"PtTe"_2$ 在外加磁場、應變或界面耦合下，可能展現非平庸拓撲反常霍爾效應、負磁阻 (negative magnetoresistance) 與其他與 Berry 曲率相關的量子現象。當 $"PtTe"_2$ 與傳統超導體形成接觸時，這些拓撲特徵可透過 Andreev 反射與 Josephson 效應體現在弱連結的 CPR 結構上。

=== PtTe2 單晶的超導近接效應與 Josephson 結構 Superconducting Proximity Effect and Josephson Structures in PtTe2 Single Crystals <subsection-ptte2-proximity>

將傳統超導金屬（例如 Nb）蒸鍍於 $"PtTe"_2$ 單晶表面，可在界面處誘發超導近接效應，形成 S–DSM–S 或 S–DSM 弱連結結構。根據既有理論與實驗研究，這類結構中可能存在：

- 受強自旋軌道耦合與 Dirac 費米面影響的非常規 Andreev bound states；
- 由多通道干涉與拓撲表面態共同決定的非對稱 CPR；
- 在外加磁場或電流偏壓下，出現 CPR 中的高次諧波或 $phi_0$-shift。

在本研究中，我們將 $"PtTe"_2$ 相關 Josephson 接面設計為高度非對稱 SQUID 的「弱接面」，讓其 CPR 可以透過 Ginzburg 模型的 CPR 反演方法自實驗數據中重建。這樣的設計使我們得以將 $"PtTe"_2$ 中的拓撲與自旋軌道效應，直接轉譯為可觀測的 CPR 特徵。

=== 預期的非正弦 CPR 與可能的拓撲簽名 Expected Non-Sinusoidal CPR and Possible Topological Signatures <subsection-ptte2-cpr-signatures>

綜合前述理論與材料特性，我們對 $"PtTe"_2$ 弱接面 CPR 有以下預期：

1. *存在顯著高次諧波*：高透明度與多通道傳輸可使第二或第三諧波 $I_2, I_3$ 與基本諧波 $I_1$ 可比，導致 CPR 在 $phi$–$I_s$ 平面上偏離簡單正弦。
2. *可能出現 $phi_0$-shift*：若界面附近存在自發破壞時間反轉對稱的機制（例如自旋極化界面態或磁性雜質），CPR 可能呈現
  $ I_s(phi) approx I_1 sin(phi + phi_0) $
  的形式，$phi_0$ 為非零常數。
3. *Josephson 二極體效應*：在某些不具空間反演對稱的幾何與界面條件下，正向與反向臨界電流可能不同 ($I_c^+ != I_c^-$)，導致 CPR 在 $phi$ 上呈現明顯非對稱。

透過高度非對稱 SQUID 的 CPR 反演方法，我們能夠直接重構 $I_s(phi)$，並從中萃取上述非常規特徵。這使得本研究不僅能驗證 Ginzburg 等人提出的 CPR 反演理論在拓撲材料系統中的適用性，也為探索 type-II Dirac 半金屬中的非常規 Josephson 效應提供一條清晰可行的實驗路徑。
