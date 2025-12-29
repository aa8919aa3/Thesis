// 第四章：實驗結果
// Chapter 4: Results

= 實驗結果 <chapter-results>

本章呈現基於 1T-PtTe₂ 的超導量子干涉儀的核心實驗結果。我們將系統性地展示元件的基礎電學特性、夫朗和費干涉圖樣的磁場響應，以及從非對稱 SQUID 量測中重構出的電流-相位關係。這些結果不僅驗證了 PtTe₂ 中存在非傳統的超導行為，更展示了利用外部磁通量對其進行主動調控的可行性。

== 基礎元件表徵 <section-basic-characterization>

約瑟夫森效應（Josephson Effect）自1962年由布賴恩·約瑟夫森（Brian Josephson）預測以來，已成為超導電子學、量子計算及精密計量學的基石 1。該效應描述了當兩塊超導體被一薄層弱連結（Weak Link，如絕緣體、正常金屬或幾何收縮）隔開時，宏觀量子波函數能夠發生穿隧或耦合的現象。這種耦合導致了超電流（Supercurrent）在無電壓降的情況下流過接面，其大小取決於兩側超導體之間的量子相位差 $phi$。

在理想的理論模型中，約瑟夫森接面的電流-相位關係（Current-Phase Relation, CPR）通常被假定為正弦形式 $I_s = I_c sin(phi)$，其中 $I_c$ 為臨界電流（Critical Current），代表了接面所能承載的最大無耗散電流。然而，在實際的實驗操作與測量中，我們所觀測到的並非單一且固定的 $I_c$，而是一個受制於熱漲落、電路阻抗、掃描速率及接面內在動力學特性的動態變量。特別是在欠阻尼（Underdamped）接面中，電流—電壓（Current-Voltage, I-V）特性曲線呈現顯著的遲滯迴圈（Hysteresis Loop），導致系統從超導態（Superconducting State）進入電壓態（Voltage State）的電流閾值——即「切換電流」（Switching Current），與從電壓態返回超導態的電流閾值——即「重捕電流」（Re-trapping Current），在數值上並不重合。

釐清這些電流參數的操作型定義（Operational Definitions），不僅是基礎物理測量的需求，更是理解非互易傳輸（Non-reciprocal transport）、開發超導整流元件（Superconducting Diodes）以及優化超導量子位元（Qubits）讀取機制的基礎。特別是當系統存在磁場、自旋軌道耦合（Spin-Orbit Coupling, SOC）或磁性雜質時，正向與負向偏壓下的電流閾值可能不再對稱，這使得嚴格區分正負方向的切換與重捕電流變得尤為重要。

本章將從微觀理論模型出發，逐步推導這些電流參數的物理起源，並詳細闡述在實驗上如何通過特定的掃描協定來定義與測量 $I_"sw"^+, I_"sw"^-, I_r^+, I_r^-$。我們將特別關注偏壓電流方向對這些參數的影響，以及它們在絕對值上的對稱或不對稱關係，這些關係直接揭示了系統的時間反演對稱性（Time-Reversal Symmetry, TRS）的破缺情況。

== 四大電流參數的詳盡操作型定義 <subsection-iv-characteristics>

基於上述物理圖像，並結合實驗測量中的掃描程序，我們以下對四個關鍵電流參數進行嚴格的操作型定義。這些定義不僅描述了物理現象，還規範了測量條件。

- 正向切換電流 (Positive Switching Current, $I_"sw"^+$)
在電流控制模式下，當偏壓電流 $I$ 從零開始向正方向（$I > 0$）單調增加（即絕對值增加）時，接面從零電壓態（超導態）突變至有限電壓態（電阻態）瞬間所記錄到的電流值。

- 負向切換電流 (Negative Switching Current, $I_"sw"^-$)

在電流控制模式下，當偏壓電流 $I$ 從零開始向負方向（$I < 0$）單調減少（即絕對值增加）時，接面從超導態突變至有限負電壓態瞬間所記錄到的電流值。為了方便與 $I_"sw"^+$ 比較，文獻常取其絕對值 $|I_"sw"^-|$ 進行討論。

- 正向重捕電流 (Positive Re-trapping Current, $I_r^+$)

當接面處於正向電壓態（$V > 0, I > 0$）時，將偏壓電流從高值逐漸降低，直到接面重新回到超導態（$V=0$）或進入低電壓擴散分支瞬間所對應的電流值。

- 負向重捕電流 (Negative Re-trapping Current, $I_r^-$)

當接面處於負向電壓態（$V < 0, I < 0$）時，將偏壓電流絕對值逐漸降低（即 $I$ 從負值向零增加），直到接面重新回到超導態（$V=0$）瞬間所對應的電流值。




== 基礎溫度下的 I-V 特性 <subsection-iv-characteristics>

為了鑑定元件的基本直流 (DC) 輸運特性，我們在極低溫環境（恆定溫度 $T = 40 "mK"$）下量測了其電流-電壓 ($I$-$V$) 特性曲線。該數據是透過對偏壓電流 ($I_"bias"$) 進行連續掃描並同步紀錄接面兩端電壓降 ($V$) 所獲得。
#figure(
  image("../Images/iv_run20.svg", width: 80%),
  caption: [樣品003-2之負向重捕電流及正負向切換電流 I-V 特性曲線],
) <fig-iv-characteristics>
@fig-iv-characteristics 中清晰地顯示了零電壓的超導區域、急劇的電阻性切換（切換電流 $I_s approx 40 "µA"$）以及顯著的遲滯行為（重捕電流 $I_r approx 4 "µA"$），反映了該接面處於欠阻尼 (Underdamped) 狀態，使用正常電阻區域數據線性擬合得出正常電阻 $R_"n"$ 約為 $1.87 "Ω"$。


#figure(
  image("../Images/iv_dvdi_comparison_354_408.svg", width: 80%),
  caption: [樣品003-2之正負向切換電流 I-V 特性曲線],
) <fig-iv-dvdi-comparison>
@fig-iv-dvdi-comparison 是由正負偏壓量測拼接而成的正負向切換電流 I-V 特性曲線。正向切換電流 $I_s^+ approx 27 "µA"$，負向切換電流 $I_s^- approx -33.5 "µA"$， $Delta I_s approx -6.5 "µA"$，$eta approx 10.7%$。雖出現 $I_s^+ != abs(I_s^-)$，但此為SQUID樣品003-2的參考接面及目標接面並聯的結果。可能因熱擾動或接面間的微小相位差異所導致，無法直接斷定為約瑟夫森二極體效應。需由之後的電流電壓磁場掃描測量來驗證。


#figure(
  image("../Images/run_33_expert_vis.svg", width: 100%, fit: "stretch"),
  caption: [
    $"PtTe"_2$ 約瑟夫森接面的直流傳輸特性與多重安德烈夫反射 (MAR)。
    (a) 在基溫 ($T approx 40,"mK"$) 下量測之電流-電壓 ($I$-$V$) 特性曲線。接面展現出清晰的超電流分支 (Supercurrent branch)，其切換電流 (Switching current) $I_c approx 24, mu "A"$。高偏壓處的過剩電流 ($I_"exc"$，灰色虛線所示) 顯示該接面具有中透明度的介面特性。
    (b) 微分電阻 ($d V slash d I$) 隨量測電壓 $V$ 的變化曲線。頻譜中展現一系列對應於次諧波能隙結構 (Sub-harmonic gap structures) 的電阻峰。垂直虛線標示了 MAR 特徵峰的理論預期位置 ($V_n = 2Delta slash "n"e$，其中 $n = 1, 2, 3$)，由此推算出超導能隙 $Delta approx 0.9725 "meV"$。並以 OBTK 模型的最佳擬合曲線，提取出的介面阻抗參數 $Z approx 0.7587$ 與穿透率 $tau approx 0.6347$並以$beta approx 1.1956$表示$e I_"exc" R_n slash Delta$。
  ],
) <fig-MAR>
@fig-MAR 展示的多重安德烈夫反射（Multiple Andreev Reflection, MAR）特性，為樣品接面品質優良的有力證據，然而因超電流（Supercurrent）過大，無法直接量測到線性電阻區域，即大於 $2 Delta$的範圍。圖中標示的過電流(Excess Current) $I_"excess"^+ approx 42.3 "µA"$ 僅能作為大致估計，實際的過電流按趨勢應大於此值。同時，由自熱效應引起的溫升也需加以考慮。
我們在微分電阻 ($d V slash d I$) 頻譜 [圖 1(b)] 中觀察到顯著的次諧波能隙結構，這提供了電荷傳輸是由多重安德烈夫反射 (MAR) 主導的直接證據。電阻谷的位置與理論公式 $V_n = 2 Delta slash n e$ 高度吻合，使我們得以確立超導能隙為 $Delta approx 0.97 "meV"$。為了定量分析介面透明度，我們針對高偏壓數據進行了 Octavio-Tinkham-Blonder-Klapwijk (OBTK) 模型擬合。分析結果顯示介面阻抗參數 $Z approx 0.76$，對應之穿透率 $tau approx 0.63$。此高透明度意味著超電流的限制因素並非來自介面阻障，而是主要源於 $"PtTe"_2$ 通道內部的擴散散射過程。

值得注意的是，量測所得的 $I_c R_n$ 積約為 $0.70 "mV"$，此數值低於短彈道接面 (Short ballistic junction) 的理論極限 ($I_c R_n approx pi Delta slash 2 e approx 1.52 "mV"$)。為了釐清此數值的物理起源，我們檢視了元件的特徵長度尺度。給定接面長度 $L = 260 "nm"$，我們發現實驗數據與擴散極限 (Diffusive limit) 高度吻合。利用長接面理論公式 $e I_c R_n approx 10.82 E_"Th"$ [Dubos et al., PRB 2001]，我們提取出的 Thouless 能為 $E_"Th" approx 65 mu "eV"$。

由此推算的擴散係數 $D = E_"Th" L^2 slash planck approx 0.0067 "m"^2 slash "s"$，在費米速度 $v_F approx 0.65 times 10^6 "m/s"$ 的估算下，對應之平均自由徑 $l_e = 3 D slash v_F approx 31 "nm"$。這表明比值 $L slash l_e approx 8.4$，確認元件運作於明確的擴散區間 ($L >> l_e$)。此外，擴散相干長度估算為 $xi_"diff" = sqrt(planck D slash Delta) approx 67 "nm"$，使得 $L slash xi_"diff" approx 4$。這證實了我們的 $"PtTe"_2$ 接面屬於「長擴散約瑟夫森接面」類別，其超電流大小受限於電子穿越接面所需的擴散時間 (即 Thouless 能)，而非超導能隙。此結果成功解釋了為何在高介面透明度 ($tau approx 0.63$) 下，$I_c R_n$ 數值仍小於短接面理論極限的主因，並展示了 $"PtTe"_2$ 在擴散長度尺度下仍保有良好的相位同調性。

在高於超導能隙 ($e V > 2 Delta$) 的偏壓區間，我們觀察到微分電阻 ($d V slash d I$) 並未如 BCS 理論預期飽和至恆定的正常態電阻 $R_n$，而是呈現隨電壓單調上升的趨勢 [圖 1(b)]。此現象主要歸因於接面處的焦耳熱效應 (Joule Heating) 累積導致的電子溫度 ($T_e$) 升高。在極低溫 ($T approx 20 "mK"$) 環境下，電子-聲子耦合 (electron-phonon coupling) 極弱，導致熱電子難以將能量耗散至晶格。

此外，為了濾除高頻雜訊以優化低溫量測，我們的樣品PCB載台配置了 RC 濾波電路。串聯電阻元件在高注入電流下產生的額外熱量，可能進一步透過基板傳導或準粒子擴散影響接面溫度。這種由熱效應引起的電阻上翹是介觀超導元件測量中常見的非本徵效應 (extrinsic effect)。

== 座標系定義與轉換 (Coordinate System Definition and Transformation) <section-coordinate-system>

為了精確描述外部磁場與樣品超導特性的關係，我們必須建立實驗室座標系 (Lab Frame) 與樣品座標系 (Sample Frame) 之間的轉換關係。這對於分析非對稱 SQUID 的夫朗和費圖樣以及電流-相位關係 (CPR) 至關重要。

=== 實驗室與樣品座標系定義 <subsection-frames-definition>

+ *實驗室座標系 (Lab Frame)*：$(X, Y, Z)$

  $X, Y, Z$ 軸由固定於低溫量測系統的由三維向量磁鐵的磁場指向定義。
  - $X$ 軸沿水平方向指向右。
  - $Y$ 軸沿水平方向且垂直於 $X$ 軸指向外側。
  - $Z$ 軸垂直於 $X$ 軸且指向上方軸則與 $X, Y$ 軸共同形成右手座標系。
  - 磁場大小表示為$B_"lab" = (B_x, B_y, B_z)$

+ *樣品座標系 (Sample Frame)*：$(X', Y', Z')$

  $X', Y', Z'$ 軸由樣品本身的幾何與樣品接面電流方向定義。
  - $X'$ 軸(Longitudinal)：沿樣品長軸方向，即樣品接面內超導電流 $I$ 的流動方向。
  - $Y'$ 軸(Transverse)：沿樣品寬度方向，位於樣品平面內且垂直於電流。
  - $Z'$ 軸(Normal)：垂直於樣品平面的法向量方向。
  - 磁場大小表示為$B_"sample" = (B_(x'), B_(y'), B_(z'))$

=== 幾何配置與旋轉角定義 <subsection-transformation-logic>

在本實驗中，樣品被水平放置於實驗室的 $X-Z$ 平面內，因此樣品平面（$X'-Y'$ 平面）與實驗室 $X-Z$ 平面共面，而樣品法向量 $Z'$ 軸平行於實驗室 $Y$ 軸。

由於樣品在平面內的放置角度並非總是與實驗室主軸對齊，因此引入旋轉角 $alpha$ 以描述平面內的偏轉。

定義旋轉角 $alpha$ 為：在實驗室 $X-Z$ 平面中，從實驗室 $+X$ 軸逆時針旋轉至樣品電流方向（$X'$ 軸）的角度。
=== 基底向量與旋轉矩陣 <subsection-rotation-matrix>

依據上述幾何配置，樣品座標系三個基底向量在實驗室座標系中的表示如下：

$
  hat(z') = (0, 1, 0) \
  hat(x') = (cos(alpha), 0, sin(alpha)) \
  hat(y') = hat(z') times hat(x') = (sin(alpha), 0, -cos(alpha))
$

因此，旋轉矩陣 $R$（由實驗室座標系轉換至樣品座標系）可寫為：

$
  R
  =
  mat(
    cos(alpha), 0, sin(alpha);
    sin(alpha), 0, -cos(alpha);
    0, 1, 0
  )
$
此旋轉矩陣 $R$ 滿足正交條件 $R R^T = I$，且 $det(R) = 1$，確保此為遵循右手定則。
=== 磁場分量轉換 <subsection-field-component-transform>

實驗室座標系中的磁場 $bold(B_"lab") = (B_x, B_y, B_z)$ 轉換至樣品座標系之表示式為：

$
  mat(B_(x'); B_(y'); B_(z'))
  =
  R mat(B_x; B_y; B_z)
  =
  mat(
    cos(alpha), 0, sin(alpha);
    sin(alpha), 0, -cos(alpha);
    0, 1, 0
  )
  mat(B_x; B_y; B_z)
$

展開後得：

$
  B_(x') = B_x cos(alpha) + B_z sin(alpha) \
  B_(y') = B_x sin(alpha) - B_z cos(alpha) \
  B_(z') = B_y
$

其中，$B_(z')$ 代表面外磁場 (Out-of-plane field)，而面內磁場 (In-plane field) 的強度 $B_"In-Plane"$ 與角度 $theta$ 則可由 $B_(x')$ 與 $B_(y')$ 計算得出：

$
  B_"in-plane" = sqrt(B_(x')^2 + B_(y')^2) \
  theta = arctan(B_(y') / B_(x'))
$

#figure(
  image("../Images/coordinate_transform_diagram.png", width: 60%),
  caption: [
    實驗室座標系 $(X, Y, Z)$（藍色）與樣品座標系 $(X', Y', Z')$（紅色）之幾何關係。
    樣品平面（粉色矩形）位於 $X$-$Z$ 平面內，電流方向 $X'$ 與 $X$ 軸夾角為 $alpha$。
  ],
) <fig-coordinate-system>



=== 實例說明：Sample 003-2 <subsection-example-003-2>

以本章主要分析的樣品 *Sample 003-2* 為例，其安裝角度經校準為 $alpha = 121.3^degree$。這意味著樣品的電流方向與實驗室 $X$ 軸與 $Z$ 軸之間存在特定的幾何關係，而非單純的平行或垂直。

當我們在實驗室座標系中施加一個磁場向量 $(B_x, B_y, B_z)$ 時，其實際作用於樣品的效果必須透過上述轉換關係進行解析。例如，若僅施加實驗室 $X$ 方向的磁場，在樣品座標系中將同時產生沿電流方向（$B_(x')$）與垂直電流方向（$B_(y')$）的分量，從而對夫朗和費干涉圖樣與電流相位關係產生複合影響。此一精確的座標轉換對於正確解讀後續章節中的各向異性磁場響應至關重要。

#figure(
  image("../Images/coordinate_system_schematic_003_2.png", width: 60%),
  caption: [
    Sample 003-2 的座標系配置示意圖。樣品位於實驗室 $X-Z$ 平面，逆時針旋轉角度 $alpha = 121.3^degree$。綠色矩形代表樣品，藍色箭頭指示沿長軸的電流方向（$x'$ axis）。
  ],
) <fig-coordinate-system>

=== 夫朗和費圖樣 ($B_"in-plane" = 0$) <subsection-standard-fraunhofer>

為了探測接面內部超導電流的空間分佈特性，我們量測了切換電流 $I_s$ 作為面外磁場 ($B_z'$) 函數的調變行為。@fig-fraunhofer-heatmap 展示了原始的電壓-電流-磁場 (V-I-B) 掃描熱圖，其中深色區域代表零電阻的超導態。接著，我們從中提取出切換電流 $I_s$，如 @fig-fraunhofer-standard 所示。這構成了在沒有面內磁場 ($B_"in-plane" = 0$) 時的類夫朗和費干涉圖樣。

#figure(
  image("../Images/Thesis_Fig_Fraunhofer_Heatmap.png", width: 90%),
  caption: [夫朗和費干涉圖樣的原始量測數據熱圖 ($V$ vs $I, B_z'$)。],
) <fig-fraunhofer-heatmap>
@fig-fraunhofer-heatmap 由003-2樣品的正偏壓（Run #354）與負偏壓（Run #408） 數據合成，展示了清晰的超導區間(白色區域)隨磁場的調變。
#figure(
  image("../Images/Ic_Norm_354_408.png", width: 80%),
  caption: [正規化切換電流 ($I_s$) 隨面外磁場 ($B_z'$) 的變化。],
) <fig-fraunhofer-standard>
從原始數據中提取的切換電流 ($I_s$) 隨面外磁場 ($B_z'$) 的變化，已對 Run #354 最大值進行正規化。灰色垂直虛線標示偏移中心與第一個週期節點，水平箭頭指示週期 $B_"period" approx 2.15 "mT"$。
類夫朗和費干涉圖樣 ($B_"in-plane" = 0$)。臨界電流隨面外磁場 ($B_z'$) 的變化呈現出類 $|sin(π Φ/Φ_0) / (π Φ/Φ_0)|$ 的形式。

實驗結果顯示在面外磁場$B_z'$約為 0.25 mT 時，切換電流達到最大值 $I_"s, max"$，第一個極小值節點出現在面外磁場$B_z'$約為 1.9 mT 處，但有顯著的節點抬升現象，整個干涉圖樣呈現高度的左右對稱性，且正向切換電流 $I_c^+$ 與負向切換電流絕對值 $|I_c^-|$ 的行為幾乎完全重合。

這些特徵表明接面具有均勻的超導電流密度分佈。根據第一個節點的位置，我們可以估算出樣品接面的有效磁學面積：
$
  A_"eff" = Φ_0 / B_"period" ≈ 2.07 × 10^(-15) / (2.15 × 10^(-3)) ≈ 9.63 × 10^(-13) "m"^2 = 0.963 "μm"^2
$
這與由光學顯微鏡測量及AutoCAD軟體計算的樣品接面的幾何面積0.8502675 $"μm"^2$相當。

// #figure(
//   image("../Images/Ic_Flux_Norm_354_408.png", width: 80%),
//   caption: [
//     標準夫朗和費干涉圖樣的正規化版本。左側圖顯示臨界電流隨正規化磁通量 ($Phi/Phi_0$) 的變化，其中 $Phi/Phi_0 = (B_z' - B_"offset") / B_"period"$。$I_c$ 已除以 $I_c^+$ 的最大值進行正規化。正向臨界電流 $I_c^+$ 與負向臨界電流絕對值 $|I_c^-|$ 在零場附近的行為顯示出高度的一致性。黑色虛線代表標準夫朗和費理論曲線 $I_c ~ |"sinc"(pi Phi/Phi_0)|$。
//   ],
// ) <fig-fraunhofer-normalized>

=== 夫朗和費圖樣隨面內磁場角度的演化 <subsection-fraunhofer-angle-evolution>
當施加固定面內磁場 ($B_"In-Plane"$) 時，夫朗和費圖樣隨面內磁場角度發生顯著變化。
#figure(
  image("../Images/fraunhofer_evolution_60mT_filtered_linear.svg", width: 90%),
  caption: [
    樣品003-2在面內磁場$B_"In-Plane"$固定在 $60 "mT"$ 時，夫朗和費圖樣隨角度 $theta$ 的演化。
  ],
) <fig-fraunhofer-evolution>

@fig-fraunhofer-evolution 展示了在不同 $theta$ 值下的干涉圖樣演化，隨著 $theta$ 的增加，原本對稱的干涉圖樣逐漸變得不對稱，對稱軸位置發生偏移，包絡函數形狀也隨之改變。
#figure(
  image("../Images/fraunhofer_heatmap_005-1_60mT_linear.svg", width: 90%),
  caption: [
    樣品005-1在面內磁場$B_"In-Plane"$固定在 $60 "mT"$ 時，夫朗和費圖樣隨角度 $theta$ 的演化熱圖。
  ],
) <fig-fraunhofer-evolution-heatmap>


=== 夫朗和費圖樣隨面內磁場強度的演化 <subsection-fraunhofer-field-evolution>
當施加固定角度的面內磁場 ($B_"In-Plane"$) 時，夫朗和費圖樣隨面內磁場強度發生顯著變化。

#figure(
  image("../Images/fraunhofer_evolution_27_log.svg", width: 90%),
  caption: [
    樣品003-2在面內磁場角度$theta$固定在 $27.4 degree$ 時，夫朗和費圖樣隨磁場強度$B_"In-Plane"$的演化。
  ],
) <fig-fraunhofer-field-evolution-27>

#figure(
  image("../Images/fraunhofer_heatmap_27_log.svg", width: 90%),
  caption: [
    樣品003-2在面內磁場角度$theta$固定在 $27.4 degree$ 時，夫朗和費圖樣隨磁場強度$B_"In-Plane"$的演化熱圖。
  ],
) <fig-fraunhofer-field-evolution-27-heatmap>

#figure(
  image("../Images/fraunhofer_evolution_297_log.svg", width: 90%),
  caption: [
    樣品003-2在面內磁場角度$theta$固定在 $297.4 degree$ 時，夫朗和費圖樣隨磁場強度$B_"In-Plane"$的演化。
  ],
) <fig-fraunhofer-field-evolution-297>

#figure(
  image("../Images/fraunhofer_heatmap_297_log.svg", width: 90%),
  caption: [
    樣品003-2在面內磁場角度$theta$固定在 $297.4 degree$ 時，夫朗和費圖樣隨磁場強度$B_"In-Plane"$的演化熱圖。
  ],
) <fig-fraunhofer-field-evolution-297-heatmap>



// #figure(
//   grid(
//     columns: (1fr,) * 2,
//     image("../Images/003-2_30mT_IVB_raw_data.svg"), image("../Images/003-2_60mT_IVB_raw_data.svg"),
//     image("../Images/003-3_60mT_IVB_raw_data.svg"), image("../Images/005-1_30mT_IVB_raw_data.svg"),
//     image("../Images/005-1_60mT_IVB_raw_data.svg"), image("../Images/005-2_60mT_IVB_raw_data.svg"),
//   ),
//   caption: [面內磁場下夫朗和費圖樣的演化 / Evolution of the Fraunhofer pattern under in-plane magnetic field],
// ) <fig-fraunhofer-evolution2>

#figure(
  grid(
    columns: (1fr,) * 2,
    image("../Images/003-2_Finite_Perpendicular_IVB_raw_data.svg"),
    image("../Images/003-2_Finite_Parallel_IVB_raw_data.svg"),
  ),
  caption: [垂直/平行電流方向磁場下夫朗和費圖樣的演化],
) <fig-fraunhofer-perpendicular-parallel>

#figure(
  grid(
    columns: (1fr,) * 2,
    image("../Images/003-2_Finite_Perpendicular_IVB_raw_heatmap.svg"),
    image("../Images/003-2_Finite_Parallel_IVB_raw_heatmap.svg"),
  ),
  caption: [垂直/平行電流方向磁場下夫朗和費圖樣的演化熱圖],
) <fig-fraunhofer-perpendicular-parallel-heatmap>


主要觀察結果包括：

1. *圖樣不對稱性增加*：隨著 $B_"In-Plane"$ 的增加，原本高度對稱的夫朗和費圖樣逐漸變得不對對稱

2. *極小值位置偏移*：干涉圖樣的極小值不再出現在對稱的磁場位置，而是向正或負磁場方向偏移

3. *包絡函數調變*：整體包絡函數的形狀發生變化，不再嚴格遵循 $sinc$ 函數

4. *振幅調變*：不同極小值的深度出現差異，破壞了原有的週期性

這些變化強烈暗示平面內磁場改變了 PtTe₂ 接面的電流-相位關係，可能產生時間反演對稱性破缺。

== 電流-相位關係分析 <section-cpr-analysis>

=== CPR 模型選擇：諧波展開與透明度模型之比較 <subsection-cpr-model-selection>

最原始的S-I-S約瑟夫森接面的電流相位關係為 $I_s(phi) = I_c sin(phi)$，但在實際的S-N-S系統中可能出現多通道與高階諧波分量，導致 CPR 呈現非純正弦特徵。我們可以用最一般的傅立葉級數展開來描述 CPR，其中包含當時間反演對稱被打破時系統中可能存在的高階諧波和附加相位偏移$(phi_n)$：
$
  I_s (φ) = sum_(n=1)^infinity I_n sin(n phi + phi_n)
$

這是最廣義的 CPR 表達式。任何週期為 2π 的 CPR 都可以展開成這種傅立葉正弦級數。$I_n$ 為第 n 階諧波的振幅。$phi_n$ 為第 n 階諧波的相位偏移。在時間反演對稱下，所有 $phi_n$ 為零；非零的 $phi_n$ 是時間反演對稱破缺的表現。選擇正弦函數是因為約瑟夫森效應的基本關係是正弦型的。高階諧波（n≥2）對應於多重安德烈夫反射過程，即庫珀對（或四重態）的「高階」隧穿。我們選擇將這個 CPR 展開到二階，因為更高階的超電流對總電流的貢獻可以忽略不計。這給出：
$
  I(phi) = I_1 sin(phi + phi_1) + I_2 sin(2phi + phi_2)
$<CPR-general-form>
可以從這個通用 CPR 推導出某些眾所周知的非傳統 CPR 案例。例如令 $phi_1 = phi_2 = 0$，會得到一個僅包含一階和二階諧波項而無任何附加相位的 CPR，對應於典型的 $phi$ 接面。在@CPR-general-form 中令 $I_2 = 0$ 的情況，則會產生具有正弦電流-相位關係的異常約瑟夫森接面或 $phi_0$ 接面，其相位從零偏移了 $phi_1$。

現在，不失一般性，$phi$ 可以被 $(phi - phi_1)$ 替換，CPR 可以重寫為：

$ I(phi) = I_1 sin phi + I_2 sin(2 phi + delta) $ <CPR-with-delta>

其中引入了 $delta = phi_2 - 2 phi_1$，即一階和二階諧波項之間的相對相位。我們將把具有如@CPR-with-delta 所示 CPR 的約瑟夫森接面稱為「二階諧波相位差可調$phi_0$接面」。




在分析電流-相位關係時，我們選擇採用截斷的傅立葉級數模型 (@CPR-with-delta)，而非Kulik-Omelyanchuk模型 ($I(phi) prop sin(phi)/sqrt(1 - tau sin^2(phi/2))$)。此選擇基於以下兩個主要考量：

1. *極高的透明度要求*：如 @fig-cpr-harmonics-tau 所示，若要僅透過透明度模型來解釋我們觀察到的顯著二階諧波分量（$I_2/I_1 approx 0.25$），接面的透明度 $tau$ 必須達到約 0.90。這是一個非常嚴格的物理條件，通常僅在完美的單原子接觸或極高品質的界面中才能實現。

#figure(
  image("../Images/CPR_Harmonics_vs_Tau.png", width: 70%),
  caption: [
    二階與三階諧波分量隨透明度 $tau$ 的變化。為了產生 $I_2/I_1 = 0.25$ 的二階分量，透明度必須高達 $tau approx 0.90$。
  ],
) <fig-cpr-harmonics-tau>

2. *時間反演對稱性的破缺*：標準的Kulik-Omelyanchuk模型通常假設時間反演對稱性，導致 $I_c^+ = |I_c^-|$（如 @fig-cpr-diode-comparison 綠色曲線所示）。然而，我們的實驗數據顯示明顯的時間反演對稱性的破缺 ($I_c^+ != |I_c^-|$)。為了描述這種時間反演對稱性的破缺，必須引入高階諧波的相位偏移 $delta$。然而標準的Kulik-Omelyanchuk模型隱含對高階諧波的相位偏移 $delta$ 的限制，$delta$必須固定於0。反而簡單的諧波展開模型多了這種自由度（如 @fig-cpr-diode-comparison 紫色曲線所示），能夠靈活地描述此系統。

#figure(
  image("../Images/CPR_Diode_Comparison.png", width: 70%),
  caption: [
    透明度模型與諧波模型的比較。
  ],
) <fig-cpr-diode-comparison>
標準Kulik-Omelyanchuk模型 (綠線) 雖然能產生偏斜的波形，但仍保持 $I_c^+ = |I_c^-|$ 的對稱性。含有相位偏移的諧波模型 (紫線) 則能自然描述 $I_c^+ != |I_c^-|$ 的約瑟夫森二極體效應。
基於上述理由，採用包含相位自由度的諧波展開模型，是對本系統非傳統超導電流特性的更合適描述。


#figure(
  image("../Images/KO-1_cpr_fit_127.svg", width: 80%),
  caption: [使用Kulik-Omelyanchuk模型擬合典型 PtTe₂ 約瑟夫森接面的電流相位關係特性曲線],
) <fig-OK-1-cpr-fit>
使用Kulik-Omelyanchuk模型擬合典型 PtTe₂ 約瑟夫森接面的電流相位關係特性曲線。

在無面內磁場時，使用Kulik-Omelyanchuk模型擬合典型 PtTe₂ 約瑟夫森接面的電流相位關係特性曲線。得出介面透明度為 $tau approx 0.6$，屬於中高透明度接面。

#figure(
  image("../Images/delta_cpr_fit_127.svg", width: 80%),
  caption: [使用二階諧波相位差可調模型擬合典型 PtTe₂ 約瑟夫森接面的電流相位關係特性曲線],
) <fig-delta-cpr-fit>
使用二階諧波相位差可調模型擬合典型 PtTe₂ 約瑟夫森接面的電流相位關係特性曲線。

#figure(
  image("../Images/cpr_fit_508.svg", width: 80%),
  caption: [樣品003-2在面內磁場強度為$180 "mT"$，角度為$297.4 degree$的二階諧波相位差可調模型擬合結果],
) <fig-cpr-fit-508>
@fig-cpr-fit-508 顯示在高面內磁場強度時，二階諧波相位差可調模型能夠很好地擬合實驗數據且二階諧波分量顯著。


=== $I_c R_N$ 乘積估算 <subsection-icrn-product>

$I_c R_N$ 乘積是表徵約瑟夫森接面品質的重要參數，它反映了接面的超導能隙與傳輸特性。@tab-icrn-statistics 總結了多個元件的 $I_c R_N$ 乘積統計資料。

#figure(
  include "generated_icrn_table.typ",
  caption: [
    多個 PtTe₂ 約瑟夫森接面的 $I_c R_N$ 乘積統計
  ],
) <tab-icrn-statistics>

// 樣品003-2之 $I_c R_N$ 乘積結果為：
// - 切換電流：$I_c^"(1)" approx 3.935$ µA
// - 正常態電阻：$R_N approx 1.848$ Ω
// - $I_c^"(1)" R_N$ 乘積：$approx 7.272$ µV

// 雖然此數值低於理論極限，但表 @tab-icrn-statistics 顯示其他樣品（如 Sample 004-2）可達 $1.2$ mV，表明 $I_c R_N$ 乘積受製程變異影響較大。整體而言，數值範圍與其他 PtTe₂ 相關研究一致。
// 這個數值與典型的金屬約瑟夫森接面相比較低，但與其他拓撲材料基礎的接面相當，反映了 PtTe₂ 作為弱連結材料的特性以及可能存在的近接效應影響。

// 根據 Ambegaokar-Baratoff 關係，理論預期的 $I_c R_N$ 乘積應為：
// $ I_c R_N = (π Δ)/(2e) tanh(Δ/(2k_B T)) $

// 其中 $Δ$ 為超導能隙。在 $T ≪ T_c$ 的極限下，對於 $T_c ≈ 2.7$ K 的 PtTe₂，理論預期約為 0.4 mV。觀測到的較高數值可能反映了接面的多重安德烈夫反射過程或非傳統的配對機制。


// #figure(
//   include "generated_properties_table.typ",
//   caption: [
//     NbTi 與 PtTe₂ 物性參數表。
//   ],
// ) <tab-properties>

==== SQUID 環路電感與自我屏蔽效應評估
為了驗證模型的適用性，我們估算了 SQUID 環路的幾何電感 $L$。對於面積約 $250 "µm"^2$ 的環路，幾何電感估計為 $L approx 3$ pH。考量最大臨界電流 $I_c^"max" approx 100$ µA，計算出的屏蔽參數 $beta_L = 2 pi L I_c / Phi_0 approx 0.001$。由於 $beta_L lt lt 1$，自我屏蔽效應可以忽略，這證實了我們採用顯式 CPR 模型 ($I_s(phi)$) 而忽略迴路電感影響的合理性。

// === 非傳統 CPR特徵 <subsection-unconventional-cpr>

// 透過分析非對稱 SQUID 的磁通量調變行為，我們可以重構出 PtTe₂ 接面的電流-相位關係 (CPR)。@fig-cpr-reconstruction 展示了重構出的 CPR 與傳統正弦 CPR 的比較。

// #figure(
//   image("../Images/Thesis_Fig_CPR_Harmonics.png", width: 90%),
//   caption: [
//     重構的 PtTe₂ 接面電流-相位關係 (Sample 005-1, Run 170)。實驗數據與擬合結果顯示了顯著的非純正弦特徵。
//   ],
// ) <fig-cpr-reconstruction>

// #figure(
//   grid(
//     columns: (1fr, 1fr),
//     rows: (auto, auto),
//     gutter: 1em,
//     image("../Images/CPR_Sweep_003-2_Run511.png"), image("../Images/CPR_Sweep_003-3_Run269.png"),
//     image("../Images/CPR_Sweep_005-1_Run170.png"), image("../Images/CPR_Sweep_005-2_Run230.png"),
//   ),
//   caption: [
//     固定面內磁場下的電流-相位關係掃描結果 ($I_c$ vs $Phi$)。
//     (a) Sample 003-2 (Run 511, $B_"in-plane" = 170$ mT)
//     (b) Sample 003-3 (Run 269, $B_"in-plane" = 60$ mT)
//     (c) Sample 005-1 (Run 170, $B_"in-plane" = 30$ mT)
//     (d) Sample 005-2 (Run 230, $B_"in-plane" = 60$ mT)
//     實線為基於諧波模型的擬合結果。
//   ],
// ) <fig-cpr-sweep-all>

// #figure(
//   grid(
//     columns: (1fr,) * 3,
//     image("../Images/003-2_CPR_30mT_summary_report.svg"),
//     image("../Images/003-2_CPR_60mT_summary_report.svg"),
//     image("../Images/003-3_CPR_60mT_summary_report.svg"),

//     image("../Images/005-1_CPR_30mT_summary_report.svg"),
//     image("../Images/005-1_CPR_60mT_summary_report.svg"),
//     image("../Images/005-2_CPR_60mT_summary_report.svg"),
//   ),
//   caption: [面內磁場下CPR的演化 / Evolution of the CPR under in-plane magnetic field],
// ) <fig-CPR-evolution2>


// // 重構的 CPR 可以用以下形式表示：
// // $ I_s(φ) = I_1 sin(φ + φ_1) + I_2 sin(2φ + φ_2) $

// 其中：
// - $I_1$：一階諧波振幅
// - $I_2$：二階諧波振幅
// - $φ_1, φ_2$：相應的相位偏移
// #include "gen_cpr_table.typ"
// @tab-cpr-parameters-gen 總結了在不同磁場條件下提取的 CPR 參數：



// #figure(
//   image("../Images/Thesis_Fig_I2I1_Evolution.png", width: 80%),
//   caption: [
//     二階諧波分量 ($I_2/I_1$) 隨面內磁場的演化。
//   ],
// )
// // <fig-i2i1-evolution>

// 實驗結果顯示：

// 1. *顯著的二階諧波分量*：$I_2/I_1$ 從零磁場的 0.10 增加到 150 mT 時的 0.25，遠大於傳統接面的預期值（$< 0.01$）

// 2. *磁場可調控性*：二階諧波分量隨面內磁場呈現系統性增長，展現出良好的可調控性

// 3. *非零相位偏移*：$φ_1 ≠ 0, φ_2 ≠ 0$，且隨磁場變化，表明存在非互易性

// 4. *CPR 非互易性*：$I_s(φ) ≠ -I_s(-φ)$，這是時間反演對稱性破缺的間接證據。

// 這些非傳統 CPR 特徵可以歸因於 PtTe₂ 的拓撲表面態。在狄拉克半金屬中，螺旋自旋-動量鎖定的表面態能夠促進高階安德烈夫反射過程，從而產生高次諧波超電流分量。面內磁場透過調控自旋軌道耦合強度，進一步增強了這些非傳統效應。我們在擬合過程中提取的參數誤差（如 $delta I_1, delta I_2$）均小於擬合值的 5%，證實了特徵的穩健性。

// === 角度依賴的約瑟夫森二極體效應 <subsection-angle-jde>
// 為了進一步探究二極體效應的幾何依賴性，我們測量了二極體效率 $eta$ 隨面內磁場角度 $theta$ 的變化。

// #figure(
//   grid(
//     columns: (1fr, 1fr),
//     image("../Images/005-1_JDE_Angle.png", width: 95%), image("../Images/005-1_Ic_Angle.png", width: 95%),
//   ),
//   caption: [Sample 005-1 的角度解析二極體效應。(左) 二極體效率 $eta$ 隨面內角度的變化，顯示出明顯的振盪行為。(右) 對應的正負臨界電流隨角度的變化。],
// ) <fig-angle-jde>

// 如 @fig-angle-jde 所示，二極體效率展現出與角度強烈相關的週期性變化，這與理論預期的自旋-軌道耦合各向異性相符。特定角度下的效率最大化暗示了拓撲表面態自旋織構的具體對稱性。

=== CPR 參數隨面內磁場的各向異性演化 <subsection-cpr-evolution-003-2>
為了探究不同晶體方向上的磁場響應差異，我們針對 Sample 003-2 在兩個特定角度 ($theta = 27.4^degree$ 與 $297.4^degree$) 進行了細緻的磁場掃描。

// #figure(
//   grid(
//     columns: (1fr, 1fr),
//     rows: (auto, auto, auto),
//     gutter: 1em,
//     image("../Images/Ic_vs_Field.png"), image("../Images/Ratio_vs_Field.png"),
//     image("../Images/I1_vs_Field.png"), image("../Images/I2_vs_Field.png"),
//     grid.cell(colspan: 2, image("../Images/Delta_vs_Field.png", width: 60%)),
//   ),
//   caption: [
//     Sample 003-2 在特定角度下的參數演化 ($27.4^degree$ vs $297.4^degree$)。
//     (a) 臨界電流 $I_c$ (b) 諧波比例 $I_2/I_1$
//     (c) 一階諧波 $I_1$ (d) 二階諧波 $I_2$
//     (e) 相位偏移 $delta$
//     藍色與紅色曲線分別代表兩個不同的測量角度，顯示出明顯的各向異性響應。
//   ],
// ) <fig-003-2-evolution>

// 從圖中可以觀察到：
// 1. *$I_c$ 抑制的差異*：兩個角度下的 $I_c$ 雖均隨磁場下降，但速率略有不同，反映了有效結面積或場穿透深度的各向異性。
// 2. *二階諧波的增強*：$I_2$ 分量在特定場強下顯著增強，且其峰值位置與角度有關。
// 3. *相位偏移的演化*：$delta$ 隨磁場呈現非單調變化，且在兩個角度下表現出不同的符號或趨勢，進一步證實了自旋軌道耦合對相位動力學的調控作用。

#figure(
  grid(
    columns: (1fr, 1fr),
    image("../Images/CPR_evolution_27_log_offset_corrected.svg", width: 95%),
    image("../Images/CPR_evolution_297_log_offset_corrected.svg", width: 95%),
  ),
  caption: [樣品003-2 在特定角度$theta$下的參數演化 ($27.4^degree$ vs $297.4^degree$)。(左) $theta = 27.4^degree$。(右) $theta = 297.4^degree$。],
) <fig-angle-cpr-evolution>


#figure(
  image("../Images/compare_combined.svg", width: 100%),
  caption: [
    CPR擬合參數隨面內磁場的演化。
  ],
) <fig-cpr-fit-parameters-evolution>

@fig-cpr-fit-parameters-evolution 展示了關鍵數參 ($I_"c, ref", I_"c1", I_"c2", I_"c2"/I_"c1", delta, chi^2$) 隨面內磁場強度的演化。從擬合參數的演化可以觀察到參考接面臨界電流 $I_"c,ref"$、$I_"c1"$、$I_"c2"$ 在不同夾角$theta$下的面內場$B_"In-Plane"$作用下的下降趨勢有別，因此可能需要考慮參考介面的面內磁場作用，所以此參數演化統計的可靠性值得商榷，但依然可以從中提取出一些有用的物理現象。在低面內場時，$I_"c2"/I_"c1"$ 與 $delta$ 的數值較低，擬合誤差也較大，需要提升量測精度，以獲得更準確的結果。然而在高面內場時，$I_"c2"/I_"c1"$ 與 $delta$ 的數值較高，擬合誤差也較小，二階諧波相位可調模型可以很好地描述現象，但固定夾角$theta$時的面內場$B_"In-Plane"$強度與$I_"c2"/I_"c1"$ 和 $delta$ 的關係並非簡單的線性關係，這可能暗示了更複雜的物理現象，並非完全如 @sivakumar_long-range_2024 所述使用Rashba效應與SOC效應造成的自旋-動量耦合現象即可描述，因此樣品目標接面長度更長，面內場$B_"In-Plane"$更強，需要考慮更多因素。

// === 夫朗和費非對稱性與 CPR 非傳統性的關聯 <subsection-fraunhofer-cpr-correlation>

// @fig-correlation-analysis 展示了夫朗和費圖樣的非對稱性參數與 CPR 中二階諧波分量的關聯性。

// #figure(
//   rect(width: 80%, height: 8cm, stroke: 1pt + gray)[
//     #align(center + horizon)[
//       關聯性分析圖\
//       夫朗和費非對稱性 vs CPR 二階分量\
//       不同 $B_"In-Plane"$ 條件下的數據點\
//       線性關聯趨勢\
//       （圖片待補充）
//     ]
//   ],
//   caption: [
//     夫朗和費圖樣非對稱性與 CPR 非傳統性的關聯。隨著面內磁場的增加，兩者呈現明顯的正相關，證實了它們的共同物理起源。
//   ],
// ) <fig-correlation-analysis>

// 關聯性分析揭示了幾個重要發現：

// 1. *強正相關性*：夫朗和費圖樣的非對稱程度與 CPR 中二階諧波分量的大小呈現強正相關 ($R^2 > 0.9$)

// 2. *磁場可調控性*：透過調節面內磁場 $B_"In-Plane"$，可以連續地調控 CPR 的非傳統性

// 3. *共同物理起源*：這種關聯性強烈暗示夫朗和費非對稱性和非傳統 CPR 具有共同的物理起源——PtTe₂ 的拓撲表面態

// 4. *二極體效應的定量表徵*：二極體效率 $η = (I_c^+ - I_c^-)/(I_c^+ + I_c^-)$ 隨 $B_"In-Plane"$ 呈現可預測的變化

// 這些結果為理解 PtTe₂ 中的拓撲超導現象提供了直接的實驗證據，並展示了利用外部磁場調控量子元件特性的巨大潜力。

== 結果總結 <section-results-summary>

本章的實驗結果確立了以下重要發現：

1. *高品質的 PtTe₂ 約瑟夫森接面*：成功製備了具有清晰超導特性和良好電學性能的元件。

2. *非傳統的電流-相位關係*：直接觀測到包含顯著二階諧波分量的非純正弦 CPR。

3. *高面內磁場下的顯著二階諧波分量與相位差*：觀察到高面內磁場下的 CPR 中二階諧波分量與相位差的顯著變化，這表明了磁場對 CPR 的調控作用。


這些結果為理解 PtTe₂ 中的非傳統的電流-相位關係提供了直接的實驗證據，並展示了利用外部磁場調控量子元件特性的巨大潛力。

