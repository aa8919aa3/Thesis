// NSYSU Thesis Template in Typst
// 國立中山大學學位論文 Typst 模板
// Based on the NTNU thesis template and NSYSU LaTeX template

#import "lib.typ": *
#import "info.typ": info
#import "@preview/unify:0.7.1": *
#import "@preview/typsium:0.3.1": ce
#import "@preview/physica:0.9.8": *
#import "@preview/equate:0.3.2": equate

// Define varphi as alias for phi for compatibility and consistency
#let varphi = sym.phi

#set heading(numbering: "1.")
// Reset equation counter at each chapter
#show heading.where(level: 1): it => {
  counter(math.equation).update(0)
  it
}
// Custom chapter-aware numbering function
#set math.equation(numbering: n => {
  let count = counter(heading.where(level: 1)).at(here()).first()
  if count > 0 {
    numbering("(1.1)", count, n)
  } else {
    numbering("(1)", n)
  }
})
#show: equate.with(number-mode: "line", sub-numbering: false)
// 設定 thesis-info 為與 info 相同的內容（為了向後相容）
#let thesis-info = info

// 設定成段之文字首行皆空2字元
#set par(first-line-indent: (amount: 2em, all: true))

// 套用 NSYSU 論文模板
#show: nsysu-thesis.with(
  info: thesis-info,
  bibliography: bibliography("references.bib", title: none),
  // 其他選項
  toc-title: "目錄",
  lof-title: "圖次",
  lot-title: "表目錄",
  // 字體設定 - Times New Roman 與標楷體
  // 提供多個標楷體備用字體名稱以支援不同系統
  cjk-font: ("BiauKai", "標楷體", "DFKai-SB", "KaiTi"),
  en-font: "Times New Roman",
  // 水印設定
  watermark: true,
)

// 前置頁面

// 封面頁（由模板自動生成）

// 論文審定書
// 使用背景圖片方式插入，以保留頁碼並避免空白頁
#{
  show heading: it => {
    pagebreak(weak: true)
  }
  heading(level: 1, numbering: none, outlined: true)[論文審定書]
}
#set page(background: image("frontpages/國立中山大學研究生學位論文審定書.pdf", width: 100%, height: 100%))
// 插入空白內容以佔據一頁
#v(1fr)
#set page(background: none)

// 公開授權書
// 使用背景圖片方式插入，以保留頁碼並避免空白頁
#{
  show heading: it => {
    pagebreak(weak: true)
  }
  heading(level: 1, numbering: none, outlined: true)[公開授權書]
}
#set page(background: image("frontpages/國立中山大學博碩士論文公開授權書.pdf", width: 90%, height: 90%))
// 插入空白內容以佔據一頁
#v(1fr)
#set page(background: none)

// 誌謝
#include "frontpages/acknowledgement.typ"

// 中文摘要
#include "frontpages/chinese-abstract.typ"
// 英文摘要
#include "frontpages/english-abstract.typ"

// 目錄
#pagebreak()

// 為目錄頁面設定水印
#set page(
  background: place(
    center + horizon,
    rotate(0deg, rect(
      fill: none,
      stroke: none,
      image("Images/watermark.jpg", width: 8cm, fit: "contain"),
    )),
  ),
)

#{
  set align(center)
  text(size: 18pt, weight: "bold")[目錄]
}
#v(1em)

#show outline.entry.where(level: 1): it => {
  strong(it)
}

#outline(
  title: none,
  indent: auto,
  depth: 3,
)

// 移除水印設定，回到一般頁面
#set page(background: none)

// 圖次
#pagebreak()
#{
  set align(center)
  text(size: 18pt, weight: "bold")[圖次]
}
#v(1em)

#outline(
  title: none,
  target: figure.where(kind: image),
)

// 表目錄
#pagebreak()
#{
  set align(center)
  text(size: 18pt, weight: "bold")[表目錄]
}
#v(1em)

#outline(
  title: none,
  target: figure.where(kind: table),
)

// 主要內容
// 第一章：緒論
// Chapter 1: Introduction
// 設定成段之文字首行皆空2字元

#pagebreak()
#set page(numbering: "1")
#counter(page).update(1)

#set par(first-line-indent: (amount: 2em, all: true))
= 緒論 Introduction <chapter-introduction>
== 研究背景與動機 Background and Motivation <section-motivation>

在凝聚態物理的前沿研究中，一項關鍵驅動力來自於將具備非平庸電子結構的新興量子材料，與成熟的宏觀量子平台（如超導電路）加以整合，以揭示新穎的量子輸運現象並發展功能更強的量子元件。本文系統性報告以過渡金屬二硫族化合物（transition metal dichalcogenides, TMDs）家族之第二類狄拉克半金屬(type-II Dirac semimetal ) 1T 相二碲化鉑（1T phase platinum ditelluride, 1T-#ce[PtTe2]）為弱連結(weak link)之超導量子干涉儀（superconducting quantum interference device, SQUID）的設計、微奈米製程與極低溫精密電性量測結果。

本研究的核心動機在於補足既有文獻中的關鍵缺口。儘管先前已在多種材料系統構成之約瑟夫森接面（Josephson junction, JJ）中觀測到偏離純正弦形式的電流–相位關係（current–phase relation, CPR），但針對第二類狄拉克半金屬，尤其是 #ce[PtTe2]，目前研究多著重於約瑟夫森二極體效應（Josephson diode effect, JDE），並常藉由正、反向臨界電流不對稱等衍生量來間接推估高階諧波分量與相位差。相較之下，對電流–相位關係中高階諧波成分與相位差的直接量測，以及其與面內磁場之可連續調控行為之間的定量連結，迄今仍缺乏以非對稱直流超導量子干涉儀（asymmetric direct current SQUID, aDC-SQUID）為核心的系統性實驗架構加以建立。基於此，本文建置整合性實驗平台以深入探測 #ce[PtTe2] 約瑟夫森元件中的電流–相位關係，並以外加磁通量作為相位調控旋鈕，實現對此基本量子特性的可控調變。

為達成上述目標，我們建立完整的元件製備流程，並利用低雜訊低溫量測平台，對電流–相位關係及其磁場依賴行為的進行量測。透過系統化的實驗資料與分析，旨在釐清第二類狄拉克半金屬於超導近接條件下的關鍵電性特徵，並進一步評估其作為可調式超導量子元件材料平台之潛力。

== 研究目的 Research Objectives <section-objectives>

為回應上述研究動機，本研究設定以下具體目標：

+ 直接重構並定量化 1T-#ce[PtTe2] 約瑟夫森接面的電流–相位關係，並著重解析其高階諧波成分之分量與相位差。
+ 系統性釐清電流–相位關係的形貌如何受外加磁通量調控，特別探討面內磁場下的連續演化行為。
+ 綜合上述結果，建立更完整的物理圖像，以描述第二類狄拉克半金屬中的超導近接效應及其所導致的宏觀量子輸運現象。
== 研究方法 Research Method <section-research-method>

本研究採用以下研究方法：
- 文獻回顧與關鍵問題辨識
- 理論建模與可量測量之推導
- 實驗設計、元件製備與低溫量測
- 資料處理、結果分析與物理討論

== 論文架構 Thesis Structure <section-thesis-structure>

本論文共分為六章：

- 第一章：研究背景、動機、研究目標與研究方法
- 第二章：相關文獻回顧與理論基礎
- 第三章：實驗方法與量測系統（含元件製備與特性鑑定）
- 第四章：實驗結果呈現與分析
- 第五章：研究結果之物理意涵、限制與挑戰
- 第六章：結論與未來展望


// 第二章：理論背景
= 理論背景 Theoretical Background <chapter-theoretical-background>

本章旨在建立理解本研究核心物理現象所需之理論框架。首先回顧約瑟夫森接面幾何結構與約瑟夫森效應（Josephson effect）的基本原理；其次介紹其關鍵應用—超導量子干涉儀；並進一步說明aDC-SQUID如何作為量測非傳統電流–相位關係的有效工具。最後，本章聚焦於本研究之核心材料：第二類狄拉克半金屬—二碲化鉑，並闡述其材料特性為何可能導致偏離純正弦形式的電流–相位關係（包含可觀的高階諧波與相位差），且此類訊號在實際實驗量測中如何由aDC-SQUID架構直接擷取。本章節之理論基於@clarke_squid_2004@tinkham_introduction_2015@aguado_new_2024。

== 超導體中的宏觀量子現象基礎 Foundations of Macroscopic Quantum Phenomena in Superconductors <section-superconductivity>
超導性（superconductivity）為超導量子元件的基礎。本節將概述超導體的主要性質，並說明約瑟夫森效應如何奠基於超導體中的宏觀量子效應（macroscopic quantum effect）。

=== 古柏對凝聚與宏觀波函數 The Cooper Pair Condensate and the Macroscopic Wavefunction <subsection-cooper-pairs>

當溫度降至臨界溫度（critical temperature, $T_c$）以下時，金屬可由正常態（normal state）轉變為超導態（superconducting state），並呈現零電阻（zero resistance）以及邁斯納效應（Meissner effect）@meissner_neuer_1933 等宏觀量子現象（macroscopic quantum phenomena）。其中，邁斯納效應意指超導體在處於邁斯納態（Meissner state）且外加磁場較弱時，會主動排斥磁通而呈現強抗磁性；惟對第二類超導體（Type II superconductor），在 $H_"c1"<H<H_"c2"$ 的混合態（mixed state）中磁通可藉由量子化渦旋（vortex）進入。
傳統超導（conventional superconductivity）的微觀機制由巴丁-古柏-施里弗理論（Bardeen–Cooper–Schrieffer theory, BCS theory）建立，並於 1957 年獲得系統化闡述；其核心觀點為：費米面（Fermi surface）附近的電子在有效吸引交互作用（effective attractive interaction）下形成配對，進而產生凝聚。@bardeen_microscopic_1957 @bardeen_theory_1957 @schrieffer_theory_1999

在典型金屬中，電子–聲子耦合（electron–phonon coupling）會導致具有延遲效應（retardation）的有效電子間交互作用（effective electron-electron interaction）。該作用主要在費米能 $E_F$ （Fermi energy）附近、能量寬度約為 $planck omega_D$ 的能窗內顯著，其中 $omega_D$ 為德拜頻率（Debye frequency）。在此能窗中，有效作用可呈現吸引性，並在屏蔽（screening）後的庫倫排斥（Coulomb repulsion）背景下引發費米海（Fermi sea）的配對不穩定性（pairing instability）。因此，時間反演共軛（time-reversal conjugate）的兩個電子態會產生配對關聯；在傳統$s$-波自旋單態（$s$-wave spin singlet）情況下，常以 $k #sym.arrow.t$ 與 $k #sym.arrow.b$ 表示。此類配對關聯稱為古柏對（Cooper pair）。需要強調的是，此處所稱的「束縛」更精確地對應於費米海背景下的「古柏不穩定性」（Cooper instability），而非真空中緊束縛的二體束縛態。

在 $T < T_c$ 時，大量古柏對凝聚並建立長程相位同調（long-range phase coherence），同時形成能隙（energy gap）與相位剛性（phase stiffness）。這些特徵能有效抑制造成耗散（dissipation）的低能激發，並支持無耗散超流（dissipationless superflow），其在電荷系統中對應為無耗散超電流（dissipationless supercurrent）。此凝聚態可由複數序參數（order parameter；亦常稱為宏觀波函數（macroscopic wavefunction）$Psi (vb(r))$ 描述：
$
  Psi (vb(r)) = sqrt(n_s (vb(r))) e^(i theta (vb(r))),
$<macroscopic-wavefunction>

其中 $n_s (vb(r))$ 為超流密度（superfluid density），滿足 $abs(Psi (vb(r)))^2 = n_s (vb(r))$ ； $theta (vb(r))$ 為為宏觀量子相位（macroscopic quantum phase）。在理想均勻且無外加電流與磁場時， $theta(vb(r))$ 可近似視為空間常數。相位的可定義性構成約瑟夫森接面之約瑟夫森關係（Josephson relations）與SQUID中接面電流與環路電流干涉的共同出發點。

// 當一種材料冷卻到其特有的臨界溫度 $T_c$ 以下，進入超導狀態時，這代表了在凝聚態物理中觀察到的最引人注目的相變之一。此現象的微觀起源由巴丁-古柏-施里弗 (Bardeen-Cooper-Schrieffer, BCS) 理論在 1957 年闡明，至今仍是我們理解傳統超導性的基石@bardeen_theory_1955 @bardeen_microscopic_1957 @bardeen_theory_1957 @schrieffer_theory_1999。根據 BCS 理論，在溫度低於 $T_c$ 時，電子之間一種有效的、儘管微弱的吸引力可以克服它們之間的庫倫排斥力。這種吸引力是由材料的晶格振動，即聲子 (phonons)，所介導的。一個電子穿過晶格時會使正離子晶格變形，產生一個瞬時的正電荷區域，從而吸引第二個電子。這種聲子介導的交互作用導致兩個動量與自旋相反的電子形成束縛態，這個量子力學實體被稱為古柏對 (Cooper pair)。

// 古柏對的束縛能雖然與典型的電子能量尺度相比很小，但卻至關重要。對於溫度 $T < T_c$ 的情況，此束縛能大於可用於散射的熱能，使得古柏對能夠保持穩定。由於古柏對由兩個費米子 (fermions)（電子）組成，它們擁有整數自旋，因此表現得像複合玻色子 (bosons)。這種玻色子性質是宏觀量子現象出現的關鍵。在一個類似於玻色-愛因斯坦凝聚 (Bose-Einstein condensation) 的現象中，材料中一大部分的古柏對會「凝聚」到單一的集體量子基態。這種凝聚意味著處於此狀態的所有古柏對共享相同的量子力學相位並協同運動，不會與雜質或晶格振動發生散射，這就是零電阻的微觀起源。

// 這種凝聚最有力的結果是，整個古柏對系綜（在一個宏觀樣本中數量可達數萬億）可以用一個單一的、複數值的宏觀波函數 (macroscopic wavefunction) 來描述。這個波函數，通常表示為 $Psi(vb(r))$，其形式類似於單一量子粒子：
// $ Psi(vb(r)) = sqrt(n_s(vb(r))) e^(i phi(vb(r))) $
// 此處，$n_s(vb(r))$ 代表古柏對的局域密度，使得 $abs(Psi(vb(r)))^2 = n_s(vb(r))$，而 $phi(vb(r))$ 是宏觀量子相位，在沒有電流或磁場的情況下，它在單一連續的超導體中是均勻的。這個單一波函數的存在，在宏觀距離上擁有明確定義的相位，是推導出超導體定義特徵以及 SQUID 運作原理的核心統一原則。它標誌著一種物質狀態，其中通常僅限於原子尺度的量子相位相關性，在實驗室尺度的維度上得以展現。

=== 邁斯納效應 The Meissner Effect <subsection-meissner-effect>

超導體最具代表性的電磁性質之一，是在平衡態下會強烈抑制其體內的磁感應強度（magnetic flux density）$vb(B)$；等價地說，在適當條件下外加磁通量（magnetic flux）不會自由穿透超導體本體，此現象稱為邁斯納效應（Meissner effect）。@callaway_remarkable_1990 @bardeen_microscopic_1957 @hirsch_origin_2012
邁斯納效應亦清楚區分超導體與理想化之「完美導體」（perfect conductor；僅假設電阻率 $rho=0$ 而無超導相干（superconducting coherence）的材料）：完美導體在靜態下因 $E=0$ 使 $frac(partial vb(B), partial t) = 0$，因此磁通僅呈「保持既有分佈」的歷史依賴（flux freezing）；反之，超導體在冷卻穿越 $T_c$ 後會在表面附近自發建立持久且無耗散的屏蔽超電流（screening supercurrent），將系統帶到新的熱力學平衡態，使體內 $vb(B)$ 被排斥至極小。

=== 倫敦方程與穿透深度London equations and penetration depth <subsection-london>

更精確地說，外加磁場並非在超導體邊界處突變為零，而是僅能在樣品表層有限厚度內滲入。此滲入的特徵尺度由 *倫敦穿透深度*（London penetration depth）$lambda_L$ 所決定。以下在靜態（time-independent）、*各向同性*（isotropic）且 *局域倫敦近似*（local London approximation）下，整理倫敦方程並導出磁場在超導體內的指數衰減解。@tinkham_introduction_2015

==== 倫敦方程與適用假設 London equations and assumptions <subsection-london-eq>

倫敦理論以超導超電流密度 $vb(J)_s$ 與電磁場的關係作為巨觀描述。於準靜態條件下（忽略位移電流項），安培定律可寫為：
$
  nabla times vb(B) = mu_0 vb(J)_s .
$ <eq:ampere>

倫敦方程通常分為兩式。其一（第一倫敦方程）描述電場驅動超電流的加速：
$
  pdv(vb(J)_s, t) = (n_s text(e^*)^2 / m^*) vb(E) .
$ <eq:london1>

其二（第二倫敦方程）反映超導態的抗磁性（Meissner 效應），在此寫成：
$
  nabla times vb(J)_s = - (1 / (mu_0 lambda_L^2)) vb(B) .
$ <eq:london2>

以上式中，$mu_0$ 為真空磁導率，$n_s$ 為超流密度（superfluid density；庫柏對凝聚密度），$e^* = 2e$ 為庫柏對有效電荷，$m^*$ 為庫柏對有效質量（或等效超電子質量）。在本節推導中亦使用 $nabla dot vb(B)=0$（無磁單極）以及「材料參數在空間上近似常數」等標準假設。

==== 倫敦穿透深度與磁場衰減 London penetration depth and magnetic field decay <subsection-london-decay>

將@eq:london2 兩側取旋度（curl），並代入安培定律@eq:ampere，可得
$
  nabla times (nabla times vb(B))
  = mu_0 nabla times vb(J)_s
  = - vb(B) / lambda_L^2 .
$

再利用向量恆等式
$
  nabla times (nabla times vb(B))
  = nabla (nabla dot vb(B)) - nabla^2 vb(B)
$
與 $nabla dot vb(B)=0$，得到 *倫敦方程的拉普拉斯形式*：
$
  nabla^2 vb(B) = vb(B) / lambda_L^2 .
$ <eq:helmholtz>

對半無限厚塊材（bulk）且表面近似為平面之情況，令超導體佔據 $x>0$，外加磁場在表面處的切向分量為 $vb(B)_0$，則@eq:helmholtz 的典型解為：
$
  vb(B)(x) = vb(B)_0 exp(-x / lambda_L) .
$ <eq:expdecay>

@eq:expdecay 顯示磁通密度 $vb(B)$ 自表面向內呈指數衰減；在距表面數個 $lambda_L$ 以上的體內區域，常可近似視為 $vb(B) approx 0$。@tinkham_introduction_2015

==== 倫敦穿透深度與超流密度 London penetration depth and superfluid density <subsection-london-lambda>

在局域倫敦近似下，倫敦穿透深度可寫為：
$
  lambda_L = sqrt(m^* / (mu_0 n_s text(e^*)^2)) .
$ <eq:lambda_ns>

@eq:lambda_ns 凸顯 $lambda_L$ 反映超導態的相位剛性（phase stiffness）與電磁耦合強度；隨溫度上升而 $n_s (T)$ 降低時，通常會導致 $lambda_L (T)$ 增大（常見近似為 $lambda_L(T) prop 1 / sqrt(n_s (T))$）。

// ==== 薄膜效應、動能電感與器件尺度修正 Thin-film effects, kinetic inductance, and device-scale corrections <subsection-london-thin>

// 對於厚度 $t$ 之超導薄膜，當 $t << lambda_L$ 時，屏蔽電流分佈不再等同於厚塊材情況，常引入 *Pearl 長度*（Pearl length）作為有效穿透尺度：
// $
//   Lambda_P = 2 lambda_L^2 / t .
// $ <eq:pearl>

// 此外，薄膜超導體的 *動能電感*（kinetic inductance）在微納器件中常不可忽略。以「每平方」動能電感（sheet kinetic inductance）為例，在 $t << lambda_L$ 的常用近似下可寫成：
// $
//   L_k^2 approx mu_0 lambda_L^2 / t .
// $ <eq:lk_sheet>

// 上述薄膜效應在下列議題中特別重要：
// + *磁通聚焦*（flux focusing）與 *有效面積*（effective area）校正：器件邊界的屏蔽電流會改變實際穿過環路的總磁通，進而影響 SQUID 的 $Phi_0$ 週期性讀出與面積反推。
// + *SQUID 環路電感與 $beta_L$*：動能電感會增加等效環路電感 $L$，改變屏蔽參數 $beta_L = 2 L I_c / Phi_0$，並可能導致調制深度降低或出現磁滯行為。
// + *Josephson 接面之有效磁厚*（effective magnetic thickness）：對平面型接面常用近似
//   $
//     t_H approx d + 2 lambda_L
//   $
//   其中 $d$ 為障壁（或弱連結區）等效厚度。$t_H$ 會進一步影響磁場下的相位分佈與干涉圖樣（例如 Fraunhofer 與 SQUID 調制），並與器件幾何、電極材料及薄膜厚度共同決定實驗擬合中的有效參數。

// （本節符號：$vb(B)$ 為磁通密度，$vb(J)_s$ 為超電流密度，$bold(E)$ 為電場；$e^*=2e$，$Phi_0=h/(2e)$。）


// ==== 倫敦方程與穿透深度 London equations and penetration depth

// 更精確地說，外加磁場並非在邊界處突變為零，而是只會在樣品表層有限厚度內滲入；其特徵尺度由倫敦穿透深度（London penetration depth）$lambda_L$ 決定。於靜態、各向同性且局域（local）倫敦近似下，可寫為
// $
//   curl(vb(J)_s) = - 1/(mu_0 lambda_L^2) vb(B),
// $
// 並結合安培定律 $curl(vb(B)) = mu_0 vb(J)_s$ 得到
// $
//   nabla^2 vb(B) = vb(B) / lambda_L^2.
// $
// 因此對厚塊材（bulk）在平面表面（取 $x>0$ 為超導體內部）的典型解為
// $
//   vb(B)(x) = vb(B)_0 exp(-x/lambda_L),
// $
// 顯示 $vb(B)$ 於表面向內呈指數衰減；在距表面數個 $lambda_L$ 以上之體內區域，常可近似視為 $vb(B) approx 0$。@tinkham_introduction_2015

// 倫敦穿透深度亦可與超流密度（superfluid density）連結：
// $
//   lambda_L = sqrt(m^* / (mu_0 n_s e^{*2})),
// $
// 其中 $e^* = 2e$ 為庫柏對有效電荷。此式凸顯 $lambda_L$ 反映超導態的相位剛性（phase stiffness）與電磁耦合強度，並在薄膜器件的動能電感、磁通聚焦與 SQUID 有效面積校正中扮演重要角色。

// ==== 第二類超導體、混合態與渦旋 Type-II superconductors, mixed state, and vortices

// 對第二類超導體（Type II superconductor），上述「體內 $vb(B) approx 0$」的近似主要適用於外加磁場小於下臨界磁場（lower critical field）$H_"c1"$ 的 Meissner 態；當外場增至 $H > H_"c1"$ 時，磁通將以量子化渦旋（quantized vortex）形式進入超導體，形成混合態（mixed state），直至上臨界磁場 $H_"c2"$ 以上回到常態。實際樣品亦常因磁通釘扎（flux pinning）而出現磁通俘獲（flux trapping），使量測結果偏離理想可逆的 Meissner 行為；對高靈敏 SQUID 量測而言，俘獲磁通常造成背景偏置與低頻雜訊，實驗上需配合磁屏蔽/退磁與冷卻流程降低其影響。

// ==== 完美抗磁、磁化率與去磁因子 Perfect diamagnetism, susceptibility, and demagnetization

// 從宏觀電磁學角度，在 SI 制中
// $
//   vb(B) = mu_0 ( bold(H) + bold(M) ),
// $
// 其中 $bold(H)$ 為磁場強度（magnetic field strength），$bold(M)$ 為磁化強度（magnetization）。在理想 Meissner 態的體內區域若 $vb(B) approx 0$，則有
// $
//   bold(M) approx - bold(H),
// $
// 對應*內部磁化率*（internal magnetic susceptibility）$chi approx -1$（以 $bold(M)=chi bold(H)$ 定義）。

// 需要注意的是，$bold(H)$ 應理解為「樣品內部場」而非「外加場」。由於幾何形狀造成去磁效應（demagnetization），常以去磁因子（demagnetization factor）$N$（對近似橢球體樣品）描述
// $
//   bold(H)_"int" = bold(H)_a - N bold(M).
// $
// 在理想 Meissner（$vb(B) approx 0$）下由 $bold(M)=-bold(H)_"int"$ 可得
// $
//   bold(H)_"int" = bold(H)_a / (1-N),
//   quad
//   bold(M) = - bold(H)_a / (1-N),
// $
// 因此以外加場 $bold(H)_a$ 定義的「表觀磁化率」為 $chi_"app" = M/H_a = -1/(1-N)$，會顯著依賴樣品形狀。為降低去磁效應帶來的解釋複雜度，討論時常選取去磁因子較小的幾何（例如*長柱沿外場方向*，典型 $N approx 0$；球體 $N=1/3$；薄片垂直外場則 $N approx 1$），並明確區分外加場與內部場。

// ==== 與 SQUID 幾何的關聯 Relation to SQUID geometry (brief)

// 最後需指出：在*多連通*（multiply connected）的超導體（例如環形/washer 與 SQUID 環路）中，即使材料本體處於 Meissner 態，環孔內仍可允許有限磁通穿越；其可由磁通子（fluxoid）量子化與環路相位單值性理解，並直接導出 SQUID 的磁通週期性與干涉訊號。此部分將於後續 SQUID 章節中再作系統推導。

// 總結而言，邁斯納效應反映超導態的相位剛性與電磁耦合所導致的平衡態回應：系統透過建立屏蔽超電流以最小化自由能，使體內（或薄膜等效意義下）磁場分佈滿足倫敦/GL 描述的能量最小化條件，並為後續約瑟夫森相位差的規範不變性與 SQUID 干涉框架奠定基礎。


== 約瑟夫森效應與電流–相位關係 Josephson Effect and Current–Phase Relation <section-josephson-effect>

約瑟夫森接面（Josephson junction, JJ）是由兩個超導體（superconductor, S）以一段「弱連結」（weak link）相隔所形成的量子元件。弱連結可為絕緣層（insulator）、正常金屬（normal metal）、半導體（semiconductor）、或本研究關注之狄拉克半金屬（Dirac semimetal, DSM）所構成的 S–DSM–S 結構。其共同特徵是：弱連結使兩端超導序參數的相位仍能透過耦合維持一定程度的相干，因而允許無耗散超電流跨越弱連結。

=== 規範不變相位差 Gauge-invariant Phase Difference <subsection-gauge-invariant-phase>
首先，假設超電流與形成接面的兩個超導體中的庫柏對密度（Cooper pairs density）相關：$abs(Psi_1)^2=n_"s, 1"^star$與$abs(Psi_2)^2=n_"s, 2"^star$。此外，由於兩個超導體之間的耦合是「弱的」（weak），我們也可以假設：在兩個超導電極之間的超電流密度不會改變$abs(Psi)^2$。另一方面，合理的預期是：超電流密度會依賴波函數的相位（phase）。在體超導體（bulk superconductor）中，超電流密度與規範不變的相位梯度$gamma(vb(r), t)$成正比，如下所示：
$
  J_S (vb(r), t)=frac(q^star n_s^star hbar, m^star) gamma(vb(r), t), quad gamma(vb(r), t) = nabla theta - (2 pi)/(Phi_0) A(vb(r), t).
$ <eq-current-density>
其中 $Phi_0 = h/(2e)$ 為磁通量子（flux quantum），$hbar = h/(2pi)$為約化普朗克常數（reduced Planck constant），$A(vb(r), t)$為向量勢（vector potential），$q^star$與$m^star$分別為超電子（superelectrons）的質量與電荷。

為了簡化討論，我們引入兩個關鍵假設。第一，我們假定電流密度均勻分佈，也就是接面面積足夠小。第二，我們考慮兩個弱連接的超導體，且超導電極內的相位梯度幾乎不變：當電極中的庫柏對密度大於耦合區域中的庫柏對密度時，這個條件成立。由於電極中的超電流密度（由電流守恆）保持常數，唯一相關的相位梯度就是中間層（interlayer region）中的相位梯度，符合@eq-current-density。因此，我們可以聚焦於規範不變的相位差（gauge-invariant phase difference）$phi(vb(r), t)$，其定義為：
$
  phi(vb(r), t) & = integral_1^2 gamma(vb(r), t) = integral_1^2 (nabla theta(vb(r), t) - (2 pi)/(Phi_0) A(vb(r), t)) d l \
                & = theta_2 (vb(r), t) - theta_1 (vb(r), t) - (2 pi)/(Phi_0) integral_1^2 A(vb(r), t) d l
$ <eq-gauge-invariant-phase>
其中 $theta_1, theta_2$ 為兩端超導序參數相位，$bold(A)$ 為向量位勢（vector potential），$Phi_0 = h/(2e)$ 為磁通量子（magnetic flux quantum）。此定義直接連結後續 SQUID 干涉中的「磁通–相位」關係，亦是約瑟夫森關係式成立的核心前提。 @aguado_new_2024

#figure(
  image("Images/Fig1-JJ.svg", width: 100%),
  caption: [約瑟夫森接面幾何示意圖],
  alt: "(a) S-I-S 接面示意圖，(b) S-DSM-S 接面示意圖。",
)<Fig1-JJ>
@Fig1-JJ (a) 立體約瑟夫森接面示意圖，(b) 平面約瑟夫森接面示意圖。


=== 約瑟夫森關係式 Josephson Relations <subsection-josephson-relations>

1962 年 Brian D. Josephson 預測：在弱耦合的兩超導體之間，即使外加電壓為零，仍可存在由相位差驅動的無耗散超電流（超導穿隧或超導近接耦合），並提出兩條基本關係式描述其靜態與動態行為。@clarke_squid_2004 @tinkham_introduction_2015

+ 第一約瑟夫森關係式（first Josephson relation）／直流約瑟夫森效應（DC Josephson effect）
定義流經接面的超電流（supercurrent）為 $I_s$，則其與相位差 $varphi$ 的函數關係稱為電流–相位關係（current–phase relation, CPR）：
$
  I_s = I_s (varphi).
$ <eq-cpr-def>

對理想 *S–I–S* 穿隧接面，在弱穿隧（lowest-order tunneling）近似下，CPR 近似為正弦形式：
$
  I_s (varphi) = I_c sin (varphi),
$ <eq-1st-josephson>
其中 $I_c$ 為臨界電流（critical current），定義為
$
  I_c equiv max_(varphi) abs(I_s (varphi)).
$ <eq-ic-def>
需特別區分：實驗上在欠阻尼（underdamped）且具遲滯（hysteresis）的 I–V 量測中常量到「切換電流」（switching current）$I_"sw"$，其受熱活化/量子穿隧與雜訊影響，通常滿足 $I_"sw" #sym.lt.approx I_c$；本節理論中的 $I_s, I_c$ 為接面本徵（或準平衡）量，後續若涉及量測讀值將另行註明。

對 *S–I–S* 穿隧接面，$I_c$ 與正常態電阻（normal state resistance）$R_N$ 的關係可由 Ambegaokar–Baratoff 結果給出（此式亦常用於估算接面品質）@ambegaokar_tunneling_1963：
$
  I_c R_N approx (pi Delta(T)) / (2e) tanh(Delta(T) / (2 k_B T)).
$ <eq-ambegaokar-baratoff>

+ 第二約瑟夫森關係式（second Josephson relation）／交流約瑟夫森效應（AC Josephson effect）：
當接面兩端存在電壓 $V(t)$ 時，相位差隨時間演化滿足
$
  frac(partial varphi, partial t) = frac(2e, ħ) V(t) = frac(2pi, Phi_0) V(t).
$ <eq-2nd-josephson>
此式亦可寫成電壓–相位的形式（電路量子化常用）
$
  V(t) = frac(Phi_0, 2pi) frac(partial varphi, partial t).
$ <eq-v-phase>

若外加直流電壓 $V_("dc")$ 為常數，則
$
  varphi(t) = varphi_0 + frac(2e V_("dc"), ħ) t,
$
代回@eq-1st-josephson 可得超電流以約瑟夫森頻率（Josephson frequency）振盪：
$
  f_J = frac(1, 2pi) frac(d varphi, d t) = frac(2e, h) V_("dc") = K_J V_("dc"),
$ <eq-josephson-frequency>
其中 $K_J$ 為約瑟夫森常數（Josephson constant）：
$
  K_J equiv frac(2e, h).
$ <eq-kj-def>
在 2019 年 SI 制重新定義後，$e$ 與 $h$ 取為精確常數@mohr_codata_2025，因此 $K_J$ 與 $Phi_0$ 亦為精確常數；數值上
$
  Phi_0 = frac(h, 2e) approx 2.067833848 times 10^(-15) " Wb",
$
$
  K_J = frac(2e, h) approx 483.5978484 times 10^9 " Hz/V".
$ <eq-flux-quantum>
因此 $V=1 " µV"$ 對應 $f_J approx 483.6 " MHz"$，此「電壓–頻率」精確對應關係構成約瑟夫森電壓標準（Josephson voltage standard）的物理基礎。

=== 非正弦 CPR 的一般表示與對稱性約束 General CPR and Symmetry Constraints <subsection-general-cpr>

對任意 2π 週期且足夠平滑的 CPR，可展開為傅立葉級數：
$
  I_s (varphi)
  = sum_(n=1)^infinity I_n sin(n varphi) + sum_(n=1)^infinity J_n cos(n varphi).
$ <eq-cpr-fourier>

*對稱性要點（常用於判讀「cos 項/相位位移」的物理意涵）：*
- 若系統處於平衡態且滿足時間反演對稱（time-reversal symmetry, TRS），並且不存在外加磁通偏置或顯式耗散破缺，則一般有
  $
    I_s (varphi) = - I_s (-varphi),
  $
  因而 $J_n = 0$，CPR 為奇函數（僅含 $sin$ 諧波）。
- 若因材料/界面/外場導致時間反演或反演對稱破缺，CPR 可能出現等效「相位位移」（phase shift）或所謂 $varphi_0$-junction：
  $
    I_s (varphi) = I_c sin(varphi - varphi_0).
  $ <eq-phi0-junction>
  其與 @eq-cpr-fourier 的 $cos$ 項等價，因
  $
    I_c sin(varphi - varphi_0) = I_c cos(varphi_0) sin(varphi) - I_c sin(varphi_0) cos(varphi).
  $
  更一般地，也可寫為
  $
    I_s (varphi) = sum_(n=1)^infinity I_n sin(n varphi + delta_n),
  $
  其中 $delta_n$ 對應各諧波的相位偏移。

在本研究脈絡中，特別關注「可觀的二次諧波」與「相位偏移」：
$
  I_s (varphi) approx I_1 sin(varphi) + I_2 sin(2 varphi + delta_2),
$ <eq-2nd-harmonic-model>
此形式可自然導致干涉圖樣偏移、非對稱調制或等效 $varphi_0$ 行為，並可由aDC-SQUID 架構擷取（後續章節詳述）。

=== 典型接面類型的 CPR 特徵 Examples of CPR in Different Junctions <subsection-cpr-examples>

+ 高透明度接面（high-transparency junctions；常見於 S–N–S、S–Sm–S、石墨烯等）
當弱連結透明度高時，電荷傳輸由安德烈夫反射（Andreev reflection）與安德烈夫束縛態（Andreev bound states, ABS）主導，CPR 往往顯著偏離正弦，呈「偏斜」（skewed）甚至近似鋸齒狀（saw-tooth）。在短結、彈道（ballistic）且單通道透明度為 $tau$ 的極限，常見的理論形式可寫成（零溫近似下）
$
  I_s (varphi) prop frac(tau sin(varphi), sqrt(1 - tau sin^2(varphi/2))),
$
顯示高透明度會強化高次諧波成分。

#figure(
  image("Images/Fig15-SNS-CPR.svg", width: 100%),
  caption: [短彈道極限下S-N-S接面之CPR與其快速傅立葉轉換結果],
)<Fig15-SNS-CPR>
@Fig15-SNS-CPR 為短彈道極限下S-N-S接面之CPR與其快速傅立葉轉換（fast Fourier transform, FFT）結果。顯示不同透明度下的 CPR 特徵與高階諧波成分。

+ 鐵磁弱連結（S–F–S）與 $pi$ 接面（π-junction）
在鐵磁體中交換場（exchange field）會使配對振幅在弱連結內振盪衰減，可能使有效耦合能量變號，導致能量最低點由 $varphi=0$ 轉為 $varphi=pi$，常以「$pi$ 接面」表述：
$
  I_s (varphi) = I_c sin(varphi + pi) = - I_c sin(varphi).
$ <eq-pi-junction>
此現象可視為 $I_c$ 有效變號或能量勢阱平移，並在 SQUID 干涉中造成半週期位移等可觀測特徵。

+ 更進一步的延伸：非 2π 週期與拓樸相關訊號
在具拓樸超導或受保護的奇偶（parity）動力學情境下，理論上可能出現 4π 週期成分；然而該效應對弛豫機制相當敏感，通常需額外實驗判據。本論文後續主要聚焦於 2π 週期下的高階諧波與相位偏移之定量擷取。

=== 約瑟夫森電感與約瑟夫森能量 Josephson Inductance and Josephson Energy <subsection-josephson-inductance-energy>

由@eq-v-phase 可將接面視為「非線性無耗散元件」。一般情形下定義約瑟夫森微分電感（Josephson inductance）為
$
  L_J(varphi) equiv pdv(Phi, I_s)
  = frac(Phi_0, 2pi) frac(1, pdv(I_s, varphi))
$ <eq-lj-general>
其中
$
  Phi equiv frac(Phi_0, 2pi) varphi
$
為電路模型中常用的「相位對應之磁通變數」（flux variable；請勿與幾何磁通 $integral vb(B) dot dd(vb(S))$ 混淆）。對正弦 CPR（@eq-1st-josephson），有
$
  pdv(I_s, varphi) = I_c cos(varphi),
  quad
  L_J(varphi) = frac(Phi_0, 2pi I_c cos(varphi)).
$ <eq-lj-sinusoidal>
因此 $varphi -> pi/2$ 時 $cos(varphi)->0$，微分電感趨於發散，反映接面在該工作點對相位擾動極為敏感；此性質廣泛用於超導電路（例如參數放大、量子比特耦合）與 SQUID 可調電感設計。
接面的儲能可由功率 $P=V I$ 積分得到。由 $V = (Phi_0/2pi) (dv(varphi, t))$，
$
  dd(E) = V I_s dd(t)
  = frac(Phi_0, 2pi) I_s (varphi) dd(varphi),
$
因此定義約瑟夫森位能（Josephson potential energy）為
$
  E(varphi) = frac(Phi_0, 2pi) integral I_s (varphi) dd(varphi) + "const".
$ <eq-energy-general>

對正弦 CPR，取常數使 $E(0)=0$，可得
$
  E(varphi) = E_J (1 - cos(varphi)),
  quad
  E_J equiv frac(Phi_0 I_c, 2pi) = frac(ħ I_c, 2e).
$ <eq-ej>
$E_J$ 稱為約瑟夫森能量（Josephson energy）。需強調：約瑟夫森電感（junction inductance）不等同於動能電感（kinetic inductance）。動能電感主要源自超導薄膜/導線中庫柏對慣性所造成的電流–相位梯度關係；而約瑟夫森電感源自接面耦合能量 $E(varphi)$ 對相位的曲率（即 $pdv(E, varphi, 2)$）。兩者在實際 SQUID 與超導電路中常同時存在，但物理起源與尺度可不同
=== 小結 Summary <subsection-josephson-summary>

綜合以上，約瑟夫森關係式提供「相位差–超電流」與「相位差–電壓」的基本連結；而 CPR 的非正弦性（高階諧波）與相位偏移（$cos$ 項或等效 $varphi_0$）則是材料、界面透明度、近接效應、對稱性破缺與束縛態譜結構的直接指紋。後續章節將以aDC-SQUID 作為相位偏置與干涉讀出工具，將上述 CPR 的細節（特別是二次諧波與相位偏移）轉換為可直接擬合與定量化的實驗觀測量。

// === 邁斯納效應 The Meissner Effect <subsection-meissner-effect>

// 超導體最主要的特性之一，是它能主動將磁通量從其內部排出，此現象稱為邁斯納效應（Meissner effect）@callaway_remarkable_1990 @bardeen_microscopic_1957 @hirsch_origin_2012。這也使超導體與假設的「完美導體」（perfect conductor；僅具零電阻的材料）區分開來：當材料在外部磁場下被冷卻至臨界溫度 $T_c$ 以下，超導體並非僅把原先存在的磁通「凍結」在內部，而是會在樣品表面附近形成持久且無耗散的屏蔽超電流（screening supercurrents），以排斥外加磁場。

// 更精確地說，外加磁場並非在邊界處突變為零，而是只會在一個有限厚度的表層內滲入；其特徵尺度由倫敦穿透深度（London penetration depth）$lambda_L$ 決定，使磁感應強度 $vb(B)$ 自表面向內呈指數衰減。對於厚塊材且外場低於相應的臨界範圍時，超導體體內（距表面多個 $lambda_L$ ​以上）可近似視為 $vb(B) tilde.equiv 0$。若考慮第二類超導體（type-II superconductor），上述近似尤其對外加磁場小於下臨界磁場（lower critical field）$vb(H_"c1")$ 時最為合適；一旦外場超過 $vb(H_"c1")$，磁通將以量子化渦旋進入而不再是完全排斥。

// 從宏觀電磁學的角度來看，理想邁斯納狀態下超導體表現為完美抗磁體（perfect diamagnet）。在 SI 制中
// $
//   vb(B) = mu_0(vb(H) + vb(M)),
// $

// 因此在樣品體內若 $vb(B) tilde.equiv 0$，可得 $vb(M) tilde.equiv -vb(H)$，對應磁化率（magnetic susceptibility）$chi tilde.equiv -1$。需要注意的是， $vb(H)$ 應理解為樣品內部的磁場強度；由於樣品形狀會透過去磁因子（demagnetization factor）$N$ 使「外加場」與「內部場」有所差異，上述關係在實作上通常採用長柱/環形等可使去磁效應較小的幾何（或等效地視為 $N tilde.equiv 1$） 來理解。總結而言，邁斯納效應反映超導態具有相位剛性（phase stiffness）並對外加磁場做出平衡態的回應：系統透過建立屏蔽超電流以最小化自由能，維持其宏觀相干基態。

// 超導體最主要的特性之一，是它能主動將磁通量從其內部排出，此現象稱為邁斯納效應 (Meissner effect)@callaway_remarkable_1990 @bardeen_microscopic_1957 @hirsch_origin_2012。這將超導體與假設的「完美導體」（僅具零電阻的材料）區分開來。當一個材料在外部磁場存在下被冷卻至其臨界溫度 $T_c$ 以下時，它不僅僅是像完美導體那樣捕獲已存在的磁通線，而是會在表面產生持久的、無耗散的電流，稱為屏蔽電流 (screening currents)。

// 這些屏蔽電流的流動方向和大小恰到好處，能夠產生一個內部磁場，完全抵銷外部施加的磁場。結果是，超導體內部各處的總磁場 $vec(B)$ 變為零。這種行為表明，超導性是一種真正的熱力學基態，而不僅僅是無限導電的狀態。從宏觀電磁學的角度來看，超導體表現為完美的抗磁體 (diamagnet)。磁化強度 $vec(M)$ 與外加磁場強度 $vec(H)$ 的關係為 $vec(B) = mu_0(vec(H) + vec(M))$。由於超導體內部 $vec(B) = 0$，因此 $vec(M) = -vec(H)$，這意味著磁化率 (magnetic susceptibility) $chi = -1$。邁斯納效應是宏觀量子態對抗外部磁場擾動的剛性的直接結果；系統消耗能量產生屏蔽電流，以維持其相位相關基態的完整性。

// == 約瑟夫森效應與電流-相位關係 Josephson Effect and Current-Phase Relation <section-josephson-effect-dup>

// 約瑟夫森接面 (Josephson Junction, JJ) 是由一個「弱連結 (weak link)」隔開的兩個超導體所構成的量子元件。此弱連結可以是絕緣層 (superconductor–insulator–superconductor, S-I-S)、正常金屬 (superconductor-normal-metal-superconductor, S-N-S)，或如本研究中的狄拉克半金屬 (superconductor-Dirac semimetal-superconductor, S-DSM-S)。1962年，Brian Josephson預測，古柏對（Cooper pairs）可以應因近接效應 (proximity effect)透過量子穿隧(quantum tunneling)的方式，在弱連結區域建立起相干的超導電流的超導電流的宏觀量子現象。此效應由 Brian Josephson 於 1962 年預測@JOSEPHSON1962251 ，由兩個基本關係式描述@barone1982physics @feynman_feynman_2011：

// 第一約瑟夫森關係式（first Josephson relation）闡述了流經接面的無耗散超導電流 $I_s$ 與兩端超導體波函數的相位差 $phi$ 之間的關係，這便是電流-相位關係 (Current-Phase Relation, CPR)。它指出，在無任何電壓的情況下，超導電流$I_s$仍可流過接面，其驅動力完全來自於兩個超導電極中序參數 (order parameters) 的宏觀量子相位差$phi$，對於傳統的SIS穿隧接面，此關係呈現為一簡單的正弦形式，即直流約瑟夫森效應（The DC Josephson effect）：
// $ I_s(phi) = I_c sin(phi) $ <eq-1st-josephson-dup>
// 其中$phi = phi_2 - phi_1$為金兹堡-朗道序參數（Ginzburg–Landau order parameter）在接面處的相位差，即約瑟夫森相位（Josephson phase）， $I_s$ 是接面的切換電流（有時也稱跳躍電流）為外加偏壓超過某一門檻時，元件由超導態跳變至電阻態時的電流值，而 $I_c$ 是接面在完全維持超導態（無電阻）時所能承受的最大電流，即臨界電流 (critical current)，其取決於超導體的性質，亦會受到溫度以及外加磁場等環境因素的影響。

// 標準正弦電流-相位關係 $I_s = I_c sin(phi)$ 是理想 S-I-S 穿隧接面的典型形式，並作為理解基本 SQUID 操作的基礎模型。此形式源於單一古柏對穿隧障壁的最低階量子力學過程。然而，隨著材料科學和奈米製造技術的進步，已開發出多種多樣的約瑟夫森接面，每種都展現出獨特的 CPR 特性。

// 一個通用的 CPR 可以表示為傅立葉級數 (Fourier series)：
// $ I_s(phi) = sum_(n=1)^infinity A_n sin(n phi) + B_n cos(n phi) $
// 高次諧波 ($n > 1$) 或餘弦項的存在，意味著偏離了簡單的 S-I-S 模型，並指向更複雜的基礎物理。不同接面類型展現出不同的 CPR 特性：

// *高透明度接面 (High-Transparency Junctions, S-N-S)*：在弱連結是正常金屬 (N)、半導體 (Sm) 或石墨烯等材料的接面中，古柏對傳輸的障壁遠低於 S-I-S 接面。在這些系統中，一種稱為安德烈夫反射 (Andreev reflection) 的過程主導電荷傳輸。多個古柏對的相干傳輸同時變得可能，從而在 CPR 中產生高次諧波。這導致 CPR 呈非正弦且常被描述為「偏斜」(skewed) 或「鋸齒狀」(saw-toothed)。

// *鐵磁性接面 (Ferromagnetic Junctions, S-F-S)*：當弱連結是鐵磁性材料時，鐵磁體內的交換場 (exchange field) 會與古柏對中電子的自旋相互作用。根據 F 層的厚度和交換場的強度，波函數的相位在穿過接面時可能會移動 $pi$。這會產生一個「$pi$-接面」，其 CPR 形式為 $I_s = I_c sin(phi + pi) = -I_c sin(phi)$。

// 第二約瑟夫森關係式（second Josephson relation）或超導相演變方程式（superconducting phase evolution equation）@barone1982physics，描述了在接面兩端存在電壓$V$時，相位差的演化，即交流約瑟夫森效應（The AC Josephson effect）：

// $ (partial phi)/(partial t) = (2e V(t))/ħ "," $ <eq-2nd-josephson-dup>

// 其中$e$是基本電荷$1.602176634 times 10^(−19) C$（庫倫），$ħ$是約化普朗克常數（reduced Planck constant） $1.054571817... times 10^(−34) J dot s$（焦耳$dot$秒）@jeckelmann_elementary_2019 @mohr_codata_2025。

// 對一個恆定電壓 V 積分此方程式可得 $phi(t) = phi_0 + (2e V) / ħ t$。將這個隨時間變化的相位代入第一約瑟夫森關係，會發現超導電流以一個高頻振盪，稱為約瑟夫森頻率 (Josephson frequency)，$f_J = (2e)/planck V$。對於 1 微伏 (microvolt) 的外加電壓，此頻率約為 483.6 MHz。其電壓和頻率之間的關係僅依賴於基本常數，為國際電壓標準的來源。


// 約瑟夫森常數（Josephson constant）的定義為$K_J=frac(2e, h)$，其倒數則為磁通量子（magnetic flux quantum）$Phi_0=frac(h, 2e)=2pi frac(ħ, 2e)$。則超導相變化方程式@eq-2nd-josephson 可以重新表達為：

// $ (partial phi)/(partial t)=2pi [K_J V(t)]=(2pi)/(Phi_0) V(t)"," $ <eq-sc-phase-evolution>
// 此時定義$Phi=Phi_0 phi/(2pi)$，則接面兩端的電壓為：

// $ V = (Phi_0)/(2pi) (partial phi)/(partial t) = (d Phi)/(d t) "," $

// 換句話說，即在接面處施加固定電壓$V_("DC")$時，相位將隨時間線性變化，而電流則為幅度為$I_c$、頻率$f$為$K_J V_("DC")$的正弦交流電。
// 此現象與法拉第感應定律的形式非常相似。但此電壓並非來自磁能，因為超導體中沒有磁場；相反地，此電壓來自載體的動能（即庫珀對）。此現象也稱為動態電感（Kinetic inductance）。
// 當電流與約瑟夫森相位隨時間變化時，接面兩端的電壓降也會隨之變化；如下方導出所示，約瑟夫森關係確定此行為可由一個名為約瑟夫森電感（Josephson inductance）之動態電感來描述。@devoret_superconducting_2004
// 將約瑟夫森關係式@eq-1st-josephson，@eq-sc-phase-evolution 改寫為：

// $
//   (partial I) / (partial phi) = & I_c cos phi , \
//   (partial phi) / (partial t) = & (2 pi) / (Phi_0) V.
// $

// 接著，應用連鎖律（chain rule）計算電流的時間導數：

// $
//   (partial I) / (partial t)
//   = & (partial I) / (partial phi) (partial phi) / (partial t)
//       = & I_c cos phi dot (2 pi) / Phi_0 V,
// $

// 將上述結果整理為電感器的電流-電壓特性形式：
// $ V = Phi_0/(2pi I_c cos phi) (partial I) / (partial t)= L(phi) (partial I) / (partial t). $
// 這便得到動態電感的表達式，其為約瑟夫森相位的函數：
// $ L(phi) = Phi_0/(2pi I_c cos phi) = L_J/(cos phi). $
// 其中$L_J=L(0)=Phi_0/(2pi I_c)$為約瑟夫森接面的一個特性參數，稱為約瑟夫森電感。
// 基於約瑟夫森接面與非線性電感的相似性，當超流經約瑟夫森接面時，其儲存的能量可以計算@tinkham_introduction_2015。
// 超導相位演進方程式類似於法拉第定律：

// $ V = (dif Phi)/(dif t). $
// 假設在時間 $t_1$ 時，約瑟夫森相位為 $phi_1$ ；在較晚的時間 $t_2$ ，約瑟夫森相位演變為 $phi_2$ 。接面的能量增加等於對面點所做的功：

// $
//   Delta E = limits(integral)_(t_1)^(t_2) V I dif t = limits(integral)_(t_1)^(t_2) V I dif Phi = limits(integral)_(phi_1)^(phi_2) I_c sin phi dif (Phi_0 phi/(2pi)) = -(Phi_0 I_c)/(2pi) Delta cos phi.
// $

// 這表明約瑟夫森接面中能量的變化僅取決於接面的初始狀態和最終狀態，而與路徑無關。因此，約瑟夫森接面中儲存的能量是一種狀態函數，其定義如下：

// $ E(phi) = -(Phi_0 I_c)/(2pi) cos phi ＝ -E_J cos phi. $

// $E_J = abs(E(0)) = (Phi_0 I_c)/(2pi)$是約瑟夫森接面的特徵參數，稱為約瑟夫森能量（Josephson energy）。且如$E_J = L_J I_c^2$所示，它與約瑟夫森電感有關。此外，也常用另一個等價的定義$E(phi) = E_J (1 - cos phi)$。
// 與非線性磁場線圈電感在電流通過時在其磁場中積累潛在能量不同，在約瑟夫森接面的情況下，超導電流並不產生磁場其儲存的能量來自於載荷載體的動能。

=== 電阻電容並聯連接模型 Resistively and Capacitively Shunted Junction Model <subsection-RCSJ-model>
阻電容並聯連接模型（Resistively and Capacitively Shunted Junction, RCSJ model）或簡稱為並聯連接模型@mccumber_effect_1968 @chakravarty_quantum_1988，是描述約瑟夫森接面的經典模型之一。該模型將約瑟夫森接面視為一個具有電阻（$R$）、電容（$C$）和約瑟夫森電感（$L_J$）的並聯電路，除了基本約瑟夫森關係@eq-1st-josephson，@eq-2nd-josephson 外，還包含了實際約瑟夫連接的交流阻抗效應。這個模型能夠捕捉到接面在不同操作條件下的動態行為，特別是在存在外部電壓和噪聲時的響應。

依據戴維寧定理（Thévenin's theorem）@johnson_origins_2003， 接面的交流阻抗可由一個電容與一個並聯電阻來表示，這兩者均與理想約瑟夫森接面並聯@barone_physics_1996。電流驅動的完整表達式 $I_("ext")$變為：

$ I_("ext") = I_s + I_R + I_C = I_c sin(phi) + V/R + C_J (dif V)/(dif t). $

其中$I_C$項為接面等效電容（effective capacitance）$C_J$帶有的位移電流（displacement current），$I_R$項為接面等效電阻（effective resistance）$R$帶有的正常電流（normal current）。


根據克希荷夫電路定律（Kirchhoff Circuit Laws），流過接面的總電流 $ I $ 可寫為：
$ I = I_s + I_R + I_C $. <eq-rcsj-kcl>

其中 $ I_s = I_c sin(phi) $ 為超導電流，$ I_R = V / R $ 為流過電阻的電流，$ I_C = C (dif V) / (dif t) $ 為流過電容的電流。將 $ V = (ħ) / (2 e) (dif phi) / (dif t) $ 代入，得到 RCSJ 模型核心方程：

$ I = I_c sin(phi) + (ħ) / (2 e R) (dif phi) / (dif t) + (ħ C) / (2 e) (dif^2 phi) / (dif t^2) $. <eq-rcsj-core>

此方程為非線性微分方程，描述約瑟夫森接面在施加電流下的動態行為。RCSJ 模型能良好解釋約瑟夫森接面的 I–V 特性，包括遲滯與電壓跳變（voltage jumps）。

*物理意義：*
- *$I_c sin(phi)$項：*代表超導電流，是約瑟夫森效應的量子本質；使得接面在零電壓下亦能傳輸電流，直至電流達臨界值$I_c$。
- *$(ħ) / (2 e R) (dif phi) / (dif t)$項：* 代表正常電流，描述接面在電壓態下的耗散；電阻$R$反映準粒子激發與能量耗散。
- *$(ħ C) / (2 e) (dif^2 phi) / (dif t^2)$項：* 代表電容電流，描述接面的電容效應；電容$C$決定接面對電壓變化的響應速度，並在某些情況下導致 I–V 特性的遲滯。

RCSJ 模型是理解 DC-SQUID 工作原理的基礎，因 SQUID 的響應直接取決於內部約瑟夫森接面的動態行為。透過分析此模型，可預測 SQUID 的電壓響應、臨界電流調製與雜訊特性。


=== 約瑟夫森穿透深度 Josephson Penetration Depth <subsection-josephson-penetration-depth>

約瑟夫森穿透深度(Josephson penetration depth)描述了外加磁場穿透長約瑟夫森接面之典型長度。它通常以$lambda_J$ 表示，並由下列公式給出：

$ lambda_J = sqrt(Phi_0/(2pi mu_0 d' j_c)), $

其中$Phi_0$為磁通量量子，$j_c$為臨界超導電流密度（critical supercurrent density, $A/m^2$ ），而$d'$則代表超導電極的電感@weihnacht_influence_1969：

$ d' = d_I + lambda_1 tanh(d_1/(2 lambda_1)) + lambda_2 tanh(d_2/(2 lambda_2)) $

其中$d_I$為約瑟夫森勢壘（Josephson barrier）的厚度（通常為絕緣體），$d_1$ 和$d_2$ 分別為超導電極的厚度，而$lambda_1$和 $lambda_2$則為其倫敦穿透深度（London penetration depths）。若臨界電流密度非常低，約瑟夫森穿透深度通常在數微米至數毫米之間@buckel_supraleitung:_2004。

== 超導量子干涉儀作為CPR探測工具 SQUID as a Probe for CPR <section-squid-as-probe>

超導量子干涉儀（Superconducting Quantum Interference Device, SQUID），是應用約瑟夫森效應最成功的元件之一，其對磁通量具有極高的靈敏度，其運作不僅僅是受到量子效應的影響，而是在宏觀、可測量的尺度上由這些效應所根本定義。它作為磁通量偵測器，具有無與倫比的靈敏度，能夠測量到僅有幾個飛特斯拉 (femtotesla) 的微弱磁場，這在從生物磁學 (biomagnetism) 和地球物理探測 (geophysical surveying) 到基礎物理和量子計算等領域開闢了新的前沿。

本章節將從SQUID的基本原理開始，探討其在CPR（臨界電流-相位關係）測量中的應用。


// === 超導環中的磁通量量子化 Fluxoid Quantization in a Superconducting Ring <subsection-flux-quantization>

// 當超導體被製成閉合迴路或環形時，量子相位 $phi(vb(r))$ 的宏觀性質引出了另一個深刻的結果。宏觀波函數 $Psi(vb(r))$ 在空間中任何一點都必須是單值的 (single-valued) 這一基本要求意味著，如果沿著超導體內的任何閉合路徑 C 繞行並回到起點，波函數的相位只能改變 $2pi$ 的整數倍。在數學上，此條件表示為：
// $ integral.cont_C nabla phi dot d vec(l) = 2 pi n $
// 其中 n 為任意整數。這是由波函數結構所施加的拓撲約束。

// 這個相位約束可以透過古柏對（電荷 $q = 2e$）的正則動量 (canonical momentum) 的表達式與電磁場聯繫起來，該表達式包含來自磁向量位 (magnetic vector potential) $vec(A)$ 的貢獻。超導電流的速度與相位的梯度及向量位有關。將此關係沿閉合迴路 C 積分，可導出一個稱為磁通量 (magnetic fluxoid) 的量的量子化：
// $ integral.cont_C (Lambda vec(J)_s + vec(A)) dot d vec(l) = n h/(2e) = n Phi_0 $
// 其中，$vec(J)_s$ 是超導電流密度 (supercurrent density)，$Lambda$ 是一個與材料性質相關的常數，而 $Phi_0 = h/(2e) approx 2.07 times 10^(-15) "Wb"$ 是磁通量量子 (magnetic flux quantum)。磁通量量子分母中出現電荷 2e，是古柏對理論最早且最直接的證明之一。

// 對於一個厚的超導環（其厚度遠大於磁穿透深度 (magnetic penetration depth)），積分路徑 C 可以選擇在超導材料深處，那裡的屏蔽電流已衰減為零，即 $vec(J)_s = 0$。在這個重要的極限下，磁通量量子化條件簡化為穿過迴路的磁通量 $Phi$ 本身的量子化。對向量位項應用斯托克斯定理 (Stokes' theorem) ($integral.cont_C vec(A) dot d vec(l) = integral_S (nabla times vec(A)) dot d vec(S) = integral_S vec(B) dot d vec(S) = Phi$)，條件變為：
// $ Phi = n Phi_0," " n = ± 1, ± 2, ... $
// 此結果指出，困在超導環內的磁通量不能取任意值，而是被限制為基本通量量子的整數倍。這個宏觀量子約束與約瑟夫森效應一起，是所有 SQUID 運作所依據的核心物理原理。

=== 直流超導量子干涉儀 DC-SQUID <subsection-DC-SQUID>

SQUID 主要可分為直流超導量子干涉儀（direct-current SQUID, DC-SQUID）與射頻超導量子干涉儀（radio-frequency SQUID, RF-SQUID）兩類。RF-SQUID 通常僅需一個約瑟夫森接面並以諧振電路感應讀出；DC-SQUID 則由兩個約瑟夫森接面並聯中斷一個超導環路所構成，並以外加偏壓電流（bias current）$I_b$ 驅動，是本研究用於 CPR 探測的主要架構。

#figure(
  image("Images/Fig2-aSQUID.png", width: 80%),
  caption: [
    DC-SQUID 示意圖
  ],
) <fig2-squid-schematic>
@fig2-squid-schematic 兩個約瑟夫森接面（$"JJ"_"Ref"$、$"JJ"_"Tgt"$）並聯中斷超導環路（自感 $L$）。
偏壓電流 $I_b$ 由兩臂分流；外加磁通 $Phi_"ext"$ 穿過環路。
DC-SQUID 的運作同時建立在（i）超導環路的磁通量量子化（flux quantization）與（ii）約瑟夫森效應之上。
==== 物理圖像與電流分配 Physics Picture and Current Distribution <subsubsection-dc-picture>

在 DC-SQUID 中，偏壓電流 $I_b$ 進入後分流為兩支路電流 $I_1$ 與 $I_2$。若外加磁通為零且器件對稱，則常見情形為 $I_1 approx I_2 approx I_b/2$。當施加外加磁通（external flux） $Phi_"ext"$ 時，環路將建立循環電流（circulating current；亦常稱 screening current）$I_"cir"$，
使環路總磁通（total flux） $Phi$ 與外加磁通之間形成自洽關係，並造成兩接面規範不變相位差之差值改變，最終使臨界電流呈現以 $Phi_0$ 為週期的干涉調變。

為避免符號混淆，本節定義：
- $I_b$：偏壓電流（bias current）
- $I_1, I_2$：兩支路（兩接面）電流
- $I_"cir" = (I_1 - I_2)/2$：循環電流（circulating current）
- $varphi_1, varphi_2$：兩接面的規範不變相位差
- $Phi_"ext"$：外加磁通；$Phi$：環路總磁通
- $Phi_0 = h/(2e)$：磁通量子

==== 相位–磁通約束 Phase-Flux Constraint <subsubsection-dc-constraint>

由磁通量量子化與波函數單值性可得（取適當閉合路徑並將兩接面上的相位降納入）：

$
  2 pi Phi/(Phi_0) = integral.cont_C Delta theta dd(l) = 2 pi n + phi_2 - phi_1, quad n in ZZ .
$<eq:squid-constraint>

等價地，可寫為

$
  varphi_2 - varphi_1 = 2 pi Phi / Phi_0 + 2pi n, quad n in ZZ .
$<eq:phase-diff-flux>

註：不同文獻可能因路徑方向或接面編號而使右式整體差一個負號。

=== 零電感近似下的對稱 DC-SQUID 理論模型 Theoretical Model of a Symmetric DC-SQUID in the Zero-Inductance Limit <subsection-symmetric-DC-SQUID>

考慮理想對稱 DC-SQUID，流經 SQUID 的總超電流為：
$
  I_s = I_s_1 + I_s_2 = I_c_1 sin(phi_1) + I_c_2 sin(phi_2) .
$
假設$I_c_1 = I_c_2 = I_c$，且兩接面 CPR 取最常見的正弦形式，則總超電流可表達為

$
  I_s = 2 I_c cos((phi_1 - phi_2)/2) sin((phi_1 + phi_2)/2) = 2 I_c cos(pi Phi/(Phi_0)) sin(phi.alt),
$<eq:jj-cpr-sine>

其中定義 $phi.alt = (phi_1 + phi_2) / 2$。若超導環路電感可忽略，則總磁通等於外加磁通$Phi approx Phi_"ext"$，則最大超電流（臨界電流）為

$
  I_s^max = I_c^"SQUID" (Phi_"ext") = 2 I_c abs(cos(pi (Phi_"ext")/(Phi_0))) .
$
<eq:ic-squid-ideal>
@eq:ic-squid-ideal 的關鍵特徵為：
- 週期性：以 $Phi_0$ 為週期；
- 建設性干涉：$Phi_"ext" = n Phi_0$ 時，$I_c^"SQUID" = 2 I_c$；
- 破壞性干涉：$Phi_"ext" = (n+1/2) Phi_0$ 時，理想上 $I_c^"SQUID" -> 0$。

然而，若超導環路電感$L$不可忽略，則有
$
  Phi/(Phi_0) = (Phi_"ext")/(Phi_0) + beta_L cos(phi.alt) sin(pi Phi/(Phi_0)),
$
其中 $beta_L = 2 L I_c / Phi_0$為屏蔽參數（screening parameter）。此參數極其重要，因為 SQUID 的特性強烈依賴$beta_L$的大小。

// == 非理想性對 SQUID 行為的影響 <section-non-idealities-impact>

// 真實器件中，臨界電流不對稱、有限環路電感與熱漲落會降低調變深度並造成曲線畸變；當電感回饋足夠強時，甚至可出現多值解與磁滯。

// === 有限環路電感：屏蔽參數 $beta_L$ <subsection-finite-loop-inductance>

// 環路電感不為零時，總磁通滿足自洽關係

// $
//   Phi = Phi_"ext" + L I_"cir".
// $
// <eq:self-flux>

// 對稱且正弦 CPR 下，

// $
//   I_"cir" = (I_1 - I_2)/2 = I_c cos(phi) sin(delta).
// $
// <eq:icir-sym>

// 定義屏蔽參數（screening parameter）

// $
//   beta_L = 2 L I_c / Phi_0 .
// $
// <eq:betaL>

// 結合 $delta = pi Phi/Phi_0$ 與@eq:self-flux，可得常用的自洽形式

// $
//   Phi/(Phi_0) = (Phi_"ext")/(Phi_0) + beta_L cos(phi.alt) sin(pi Phi/(Phi_0)).
// $
// <eq:flux-self-consistent>

// 當 $beta_L lt.double 1$ 時，$Phi approx Phi_"ext"$，回到理想@eq:ic-squid-ideal；當 $beta_L approx 1$ 時，回饋變強，$I_c(Phi_"ext")$ 調變深度降低且可能出現多值分支；若再加上動力學與雜訊，掃描 $Phi_"ext"$ 可能出現磁滯與跳變。@clarke_squid_2004

// > 註（符號慣例）：亦有文獻使用 $lambda = L I_c / Phi_0$，
// 則 $beta_L = 2 lambda$。為避免與倫敦穿透深度 $lambda_L$ 混淆，
// 本研究全文採用 $beta_L$ 記號。

// === 電壓態操作、去遲滯與 $beta_c$ <subsection-voltage-state>

// 當偏壓電流 $I_b$ 超過磁通相依的臨界電流 $I_c^"SQUID" (Phi_"ext")$ 時，接面轉入電壓態並產生耗散。為描述其動力學，常採用電阻–電容並聯接面模型（Resistively and Capacitively Shunted Junction, RCSJ），其中遲滯程度由史都華–麥庫姆伯參數（Stewart–McCumber parameter）

// $
//   beta_c = 2pi I_c R_N^2 C / Phi_0
// $
// <eq:betaC>
// 所控制。一般而言，$beta_c > 1$（欠阻尼，underdamped）更容易出現 I–V 遲滯；實務上常在接面外加並聯電阻以降低有效阻尼、抑制遲滯並利於穩定量測（特別是以 $V(Phi)$ 進行磁通讀出或閉迴路鎖定）。@clarke_squid_2004

== 非對稱 DC-SQUID 與 CPR 探測 Asymmetric DC-SQUID and CPR Detection <section-asymmetric-squid>

除上述效應外，不對稱性（接面參數不一致或兩臂電感分配不均）會使 $I_c (Phi)$ 谷底抬高並改變曲線形狀；然而在「高度不對稱極限」下，DC-SQUID 反而可作為 CPR 的相位偏置探測器（phase-biased detector），用以反推出弱接面 CPR。@Babich2023_LimitationsCPR_NanoLett

=== 不對稱性的來源與參數化 Sources and Parameterization of Asymmetry <subsection-asymmetry-sources>

令兩接面臨界電流、正常態電阻與電容分別為 $I_c_1, I_c_2$、$R_N_1, R_N_2$、$C_1, C_2$，兩臂電感為 $L_1, L_2$（$L_1+L_2=L$）。可定義平均量

$
  macron(I)_c = (I_c_1+I_c_2)/2,quad
  macron(C) = (C_1+C_2)/2,quad
  R = (2 R_N_1 R_N_2) / (R_N_1+R_N_2).
$
<eq:avg-params>

並引入無因次不對稱參數 $alpha_I, alpha_R, alpha_C, alpha_L$：
$
  I_c_1=macron(I)_c(1-alpha_I), quad I_c_2=macron(I)_c(1+alpha_I),
$ <eq:alphaI>
$
  R_N_1=R/(1-alpha_R), quad R_N_2=R/(1+alpha_R),
$ <eq:alphaR>
$
  C_1=macron(C)(1-alpha_C), quad C_2=macron(C)(1+alpha_C),
$ <eq:alphaC>
$
  L_1=L(1-alpha_L)/2, quad L_2=L(1+alpha_L)/2 .
$ <eq:alphaL>

此參數化便於分離「臨界電流不對稱」對 $I_c (Phi)$ 包絡的影響，以及「阻尼/電容不對稱」對動力學與 switching 統計的影響。

=== 高度不對稱 DC-SQUID：相位偏置探測器 Highly Asymmetric DC-SQUID: Phase-Biased Detector <subsection-highly-asymmetric-squid>

在高度不對稱極限 $I_c^"Ref" >> I_c^"Tgt"$ 下，可將兩接面分別視為參考接面（reference junction）與目標接面（target junction）。在小電感近似（$beta_L << 1$）下，相位約束近似為
$
  varphi_"Ref" - varphi_"Tgt" approx 2pi Phi_"ext"/Phi_0 .
$ <eq:phase-constraint-asym>

對每個 $Phi_"ext"$，臨界電流可寫成最大化問題
$
  I_c^"SQUID" (Phi_"ext")
  = max_(varphi_"Ref")
  [ I_(c, "Ref") f_"Ref"(varphi_"Ref")
    + I_(c, "Tgt") f_"Tgt"(varphi_"Ref" - 2pi Phi_"ext"/Phi_0) ] ,
$ <eq:max-problem>

其中 $f_"Ref"$、$f_"Tgt"$ 分別為兩接面的 CPR 形狀（正弦 CPR 時 $f=sin$）。若參考接面近似正弦且主導最大化條件，則臨界點附近常有
$ varphi_"Ref" approx pi/2 $，
使目標接面相位被外加磁通近似線性掃描：
$
  varphi_"Tgt" approx pi/2 - 2pi Phi_"ext"/Phi_0 .
$ <eq:phase-scan>

因此量測到的 $I_c^"SQUID" (Phi_"ext")$ 之磁通依賴形狀，可直接攜帶目標接面 CPR 的資訊；在高精度萃取時，通常建議以 @eq:max-problem 建立更完整的 forward model，將有限環路電感、參考接面非正弦 CPR 與有效面積（effective area）校正等效應一併納入，並以全域擬合方式反推目標接面 CPR。@Babich2023_LimitationsCPR_NanoLett

然而，本研究為凸顯「高度不對稱 DC-SQUID 作為相位偏置探測器」之核心物理直覺，以下僅考慮理想化極限：
(i) 參考接面 CPR 為正弦形式；(ii) 環路電感可忽略（$beta_L lt.double 1$），使 $Phi approx Phi_"ext"$。在此極限下，量測到的 $I_c^"SQUID"(Phi_"ext")$ 可近似視為目標接面 CPR 的函數疊加於一個由參考接面提供的常數偏置：
$
  I_c^"SQUID"(Phi_"ext")
  approx I_c^"Ref" + I_c^"Tgt" f_"Tgt" (pi/2 - 2pi Phi_"ext"/Phi_0),
$ <eq:ic-squid-asym>


// === 直流超導量子干涉儀 DC-SQUID <subsection-DC-SQUID>
// SQUID 主要有兩種類型：直流（direct current, DC）和射頻（radio frequency, RF）。RF-SQUID 只需要一個約瑟夫森接面（超導穿隧接面），這可能使其生產成本較低，但靈敏度較低。DC-SQUID的基本結構是在一個超導環路中並聯兩個約瑟夫森接面，如 @fig2-squid-schematic 所示。

// #figure(
//   image("Images/Fig2-aSQUID.png", width: 100%),
//   caption: [DC-SQUID示意圖。],
// ) <fig2-squid-schematic>
// @fig2-squid-schematic 兩個約瑟夫森接面（以叉號表示）並聯於一個超導環上。偏壓電流（bias current） $I_"bias"$ 分流通過兩個臂即，外加磁通量 $Phi_"ext"$ 穿過環路。

// 直流超導量子干涉儀（DC SQUID）於 1964 年由福特研究實驗室（Ford Research Labs）的 Robert Jaklevic、John J. Lambe、James Mercereau 和 Arnold Silver 所發明，此後於 1962 年由 Brian Josephson 提出約瑟夫森效應，並於 1963 年由 John Rowell 和 Philip Anderson 在貝爾實驗室（Bell Labs）製造了第一個約瑟夫森接面@anderson_probable_1963。SQUID的運作基於兩個宏觀量子現象：超導環路中的磁通量量子化，以及流經兩個接面的超導電流的量子干涉。

// 而超導迴路中若並聯兩個約瑟夫森接面，基於直流約瑟夫森效應，在沒有任何外部磁場的情況下，偏壓電流$I_"bias"$會平均分佈到兩個分支。若對超導迴路施加一個小的外部磁場，則會開始在迴路中循環一個屏蔽電流（screening current）$I_"scr"$，該電流會產生一個抵銷外加磁通量的磁場，並創造一個與外部磁通量成正比的額外約瑟夫森相位。屏蔽電流的方向與$I_"bias"$在超導迴路的一個分支中相同，而在另一個分支中與 $I_"bias"$ 相反；總電流變為 $1/2 I_"bias" + I_"scr"$ 在某一分支，而$1/2 I_"bias" - I_"scr"$ 在另一分支。一旦任一分支中的電流超過約瑟夫森接面的臨界電流$I_c$，則在接面上會出現電壓。

// 現在假設外部磁通量進一步增加，直到超過$Phi_0$，即磁通量量子的一半。由於超導迴路所包圍的磁通量必須是磁通量量子的整數倍，因此 SQUID 不再顯著屏蔽磁通量，而是能量上更傾向於將其增加到$Phi_1$。此時電流反向流動，抵禦了所容許的磁通量$Phi_2$ 與略超過 $Phi_3$ 的外部磁場之間的差異。隨著外部磁場的增加，電流逐漸減小，當磁通量剛好為 $Phi_4$ 時電流為零，並且當外部磁場進一步增加時，電流再次反向。因此，電流的方向會週期性地改變，每當磁通量增加半整數倍數的 $Phi_5$ 時就會改變一次，在最大電流時每增加半整數加整數倍數的 $Phi_6$ 時會改變一次，而在整數倍數時電流為零。

// 若偏壓電流大於$I_c$，則 SQUID 始終運作於電阻模式。此時，電壓即為外加磁場的函數，且週期等於$Phi_0$。由於直流 SQUID 的電流-電壓特性具有遲滯現象，故在接面間連接一個並聯電阻$R$以消除遲滯（在內稟電阻（intrinsic resistance）足夠的情況下）。屏蔽電流為應用磁通量除以環路的自感。因此$Delta Phi$可估算為$Delta V$磁通量至電壓轉換器）@de_lacheisserie_magnetism:_2002 @clarke_squid_2004 ，如下所示：

// $
//   Delta V=R dot Delta I, \
//   2 dot Delta I = 2 dot (Delta Phi)/ L, \
//   Delta V = R/L dot Delta Phi.
// $
// 其中 $L$ 為超導環路的自感（self inductance），本節的討論假設迴路中存在完美的磁通量量子化。然而，這僅對具有較大自感的較大迴路才成立。根據上述關係，這也意味著電流和電壓變化較小。實際上，迴路的自感$L$並不這麼大。一般情況可通過引入一個參數

// $ lambda = (i_c L)/Phi_0 $

// 其中$i_c$為SQUID的臨界電流。通常$lambda$為一個數量級@de_waele_quantum-interference_1969。

// === 對稱直流 SQUID 的理論模型 Theoretical Model of Symmetric DC SQUIDs <subsection-symmetric-DC-SQUID>

// 直流 SQUID，如@fig2-squid-schematic 示意圖所示，由一個幾何自感為 L 的閉合超導迴路組成，該迴路被兩個並聯的約瑟夫森接面$"JJ"_"Ref"$和$"JJ"_"Tgt"$中斷。偏壓電流 $I_"bias"$ 從迴路一側注入，從另一側導出，導致電流分流並流經包含接面的兩個臂。

// 對於一個理想的對稱SQUID（即兩個接面完全相同），具體來說，假設滿足以下條件：
// 1. *相同的接面*：兩個約瑟夫森接面具有相同的臨界電流 ($I_(c 1) = I_(c 2 ) = I_c$)、正常態電阻 ($R_(N 1) = R_(N 2) = R_N$) 和電容 ($C_1 = C_2 = C$)。
// 2. *對稱的電感*：總迴路電感 $L$ 被認為在干涉儀的兩個臂之間平均分配，因此臂 1 的電感為 $L_1 = L/2$，臂 2 的電感為 $L_2 = L/2$。

// === 總電流-相位關係的推導 Derivation of the Total Current-Phase Relation <subsection-total-cpr-derivation>
// 直流 SQUID 的核心特性是其總電流-相位關係，它描述了總超導電流如何同時依賴於一個有效相位差和磁通量。推導過程始於對對稱 SQUID 迴路應用克希荷夫電流定律 (Kirchhoff's current law) 和磁通量量子化條件。

// 假設接面具有標準的正弦 CPR，則通過兩個臂的超導電流 $I_1$ 和 $I_2$ 為：
// $ I_1 = I_c_1 sin(phi_1) $
// $ I_2 = I_c_2 sin(phi_2) $
// 其中 $phi_1$ 和 $phi_2$ 分別是 JJ1 和 JJ2 兩端的規範不變相位差。流經 SQUID 的總超導電流 $I_s$ 是兩個並聯支路電流的總和：
// $ I_s = I_s_1 + I_s_2 = I_c_1 sin(phi_1) + I_c_2 sin(phi_2) $

// 相位差 $phi_1$ 和 $phi_2$ 並非獨立，它們透過穿過迴路的磁通量 $Phi$ 耦合。宏觀波函數的單值性要求，沿任何閉合超導迴路積分的總相位變化必須是 $2pi$ 的整數倍。當應用於通過兩個接面的 SQUID 迴路時，這個拓撲約束直接導致規範不變相位之間的以下關係：
// $ phi_2 - phi_1 = (2pi Phi) / Phi_0 + 2 n pi $

// 若為簡化起見，假設 $I_(c 1) = I_(c 2 ) = I_c$，則
// $
//   I_s = & 2I_c cos(frac((phi_1 - phi_2), 2)) sin(frac(phi_1 + phi_2, 2)) \
//       = & 2I_c cos((pi Phi)/Phi_0) sin(phi.alt)
// $
// 其中定義 $phi.alt$ 為 $(phi_1 + phi_2)/2$。若超導環路電感可忽略，總磁通等於外加磁通$Phi=Phi_"ext"$，則最大超電流（臨界電流）為
// $
//   I_max = 2I_c cos((pi Phi)/Phi_0)
// $

// 這個方程式是對稱直流 SQUID的總電流-相位關係。
// 然而，若超導環路電感$L$不可忽略，則有
// $
//   Phi/Phi_0 = Phi_"ext"/Phi_0 + Beta cos(phi.alt)sin((pi Phi)/Phi_0)
// $
// 其中
// $
//   Beta_L = 2L I_c/Phi_0
// $

// 為屏蔽參數（screening parameter）。此參數極其重要，因為 SQUID 的特性強烈依賴於$Beta_L$的大小。

// === SQUID 臨界電流的磁通調變 Flux Modulation of SQUID Critical Current <subsection-squid-critical-current-modulation>

// 整個 SQUID 的臨界電流，我們表示為 $I_max(Phi)$，是在給定磁通量 $Phi$ 下，總超導電流 $I_s$ 能達到的最大值。從總 CPR 中，我們可以直接寫出 SQUID 臨界電流的表達式：
// $ I_max(Phi) = 2I_c abs(cos((pi Phi)/Phi_0)) $
// 其中 $Phi_0 = h/(2e)$ 是磁通量量子。此調變是古柏對波函數通過兩條路徑發生建設性與破壞性干涉的直接結果。
// 這個基本方程式描述了 SQUID 臨界電流作為穿過迴路的磁通量的函數的週期性調變。此關係的關鍵特徵是：

// - *週期性*：臨界電流是磁通量 $Phi$ 的週期函數，週期恰好為一個磁通量量子 $Phi_0$。測得的臨界電流每次振盪對應於磁通量變化一個 $Phi_0$。
// - *建設性干涉*：當磁通量是磁通量量子的整數倍，即 $Phi = n Phi_0$（n 為整數）時，臨界電流達到其絕對最大值 $2I_c$。在這些磁通值下，餘弦項為 $±1$。
// - *破壞性干涉*：當磁通量是磁通量量子的半整數倍，即 $Phi = (n + 1/2)Phi_0$ 時，臨界電流達到其最小值 0。在這些點上，餘弦項為 0。

// 這種行為是宏觀量子干涉的直接而明確的體現。SQUID 作為古柏對的量子干涉儀，其功能類似於邁克生 (Michelson) 或馬赫-曾德 (Mach-Zehnder) 干涉儀對光子的作用。

// == 非理想性對 SQUID 性能的影響 Impact of Non-Idealities on SQUID Performance <section-non-idealities-impact>

// 真實世界中 SQUID 的性能和行為受到非理想因素的顯著影響，其中最主要的是超導迴路的有限電感和熱漲落 (thermal fluctuations) 的效應。

// === 有限迴路電感：屏蔽參數 $beta_L$ Finite Loop Inductance: The Screening Parameter $beta_L$ <subsection-finite-loop-inductance>

// 在任何物理 SQUID 中，連接兩個約瑟夫森接面的超導迴路都具有非零的幾何自感 L。此電感對裝置對外部磁通量 $Phi_("ext")$ 的響應有深遠的影響。當施加外部磁通時，SQUID 會根據冷次定律 (Lenz's law) 和磁通量量子化原理，在迴路中感應出一個持久的、循環的屏蔽電流 $I_("cir")$，以抵抗變化。

// 循環電流可以用個別接面電流表示為 $I_("cir") = (I_2 - I_1)/2$。對於具有正弦 CPR 的相同接面，這變為：
// $ I_("cir") = -I_c cos(phi_1 + (pi Phi)/Phi_0) sin((pi Phi)/Phi_0) $

// 這揭示了一個自洽的回饋迴路：總磁通量 $Phi$ 決定了相位差，相位差決定了循環電流 $I_("cir")$，而循環電流又反過來貢獻於總磁通量 $Phi$。這種內在回饋的強度由無因次的*屏蔽參數* $beta_L$ 量化：
// $ beta_L equiv (2 L I_c) / Phi_0 $

// 參數 $beta_L$ 的值對 SQUID 的行為至關重要：

// - *可忽略的屏蔽 ($beta_L << 1$)*：當電感或臨界電流很小時，自感應磁通量與磁通量量子相比可以忽略不計。在此極限下，$Phi approx Phi_("ext")$，SQUID 的行為符合理想模型。
// - *強屏蔽 ($beta_L >> 1$)*：當電感很大時，屏蔽效應佔主導地位。循環電流會調整以幾乎完全抵消外部磁通的任何變化，使總內部磁通 $Phi$ 固定在最接近 $Phi_0$ 整數倍的位置。
// - *最佳區域 ($beta_L approx 1$)*：對於大多數應用，特別是作為靈敏磁力計，需要達到最佳平衡。

// === 動態行為與熱漲落 Dynamic Behavior and Thermal Fluctuations <subsection-dynamic-behavior-thermal-fluctuations>
// 當 SQUID 被偏壓電流 $I_"bias"b$ 驅動，且該電流超過其依賴於磁通的臨界電流 $I_max(Phi)$ 時，它會轉變為電阻態，並在其端點出現有限電壓。為了模擬這種動態、耗散的行為，我們採用*電阻與電容並聯接面 (RCSJ) 模型*。

// 在此模型中，每個理想的約瑟夫森元件（由其 CPR 描述）與一個電阻 $R_N$（代表準粒子穿隧）和一個電容 C（代表接面的幾何電容）並聯。通過 SQUID 每個臂的總電流是超導電流、正常（歐姆）電流和位移電流的總和。

// 最終的運動方程式是一組耦合的郎之萬方程式 (Langevin equations)：
// $
//   (Phi_0)/(2pi) C (d^2 phi_1)/(d t^2) + (Phi_0)/(2pi R_N) (d phi_1)/(d t) + I_c sin phi_1 = I_b/2 - I_("cir") + I_(N 1)(t)
// $
// $
//   (Phi_0)/(2pi) C (d^2 phi_2)/(d t^2) + (Phi_0)/(2pi R_N) (d phi_2)/(d t) + I_c sin phi_2 = I_b/2 + I_("cir") + I_(N 2)(t)
// $

// 這些方程式通過循環電流 $I_("cir")$ 耦合，完全描述了在存在熱雜訊的情況下 SQUID 的古典動力學。

// 然而，真實世界的SQUID往往存在非對稱性（例如 $I_(c 1) != I_(c 2)$ 或環路電感分配不均）。這種非對稱性雖然在傳統應用中常被視為缺陷，卻能將SQUID轉變為一個強大的分析工具。特別是對於一個高度非對稱的SQUID（例如 $I_(c 1) >> I_(c 2)$），其總臨界電流的磁通調變曲線的形狀，會直接反映較弱接面（weak junction）的電流-相位關係。透過精密量測SQUID的臨界電流 $I_("max")$ 隨外部磁通量 $Phi_("ext")$ 的完整調變曲線，我們可以直接重構出弱連結的CPR，$I_("s,weak")(phi)$ @Babich2023_LimitationsCPR_NanoLett。這正是本研究採用非對稱SQUID來探測#ce[PtTe2]接面非傳統CPR的核心方法學基礎。

// == 非對稱 SQUID：理論與應用 Asymmetric SQUIDs: Theory and Applications <section-asymmetric-squid>
// 雖然完全對稱的 SQUID 行為提供了量子干涉的基礎理解，但非對稱性的引入卻開啟了更豐富且更複雜的物理現象景觀。無論非對稱性是來自於不可避免的製程缺陷還是有意設計的工程考量，它都能將 SQUID 從簡單的干涉儀轉變為可調式、非互易的量子元件。

// === 非對稱性的來源與分類 Sources and Classification of Asymmetry <subsection-asymmetry-sources>

// SQUID 的非對稱性主要體現在兩個方面：

// *接面非對稱性 (Junction Asymmetry)*：接面非對稱性是指兩個接面的電學參數不同，包括：
// + 臨界電流的差異：$I_("c1") != I_("c2")$，這是最常見的非對稱性形式。
// + 正常態電阻的差異：$R_("N1") != R_("N2")$，影響接面的動態行為。
// + 接面電容的差異：$C_1 != C_2$，決定接面的響應速度。

// *迴路非對稱性 (Loop Asymmetry)*：迴路非對稱性是指兩個接面在超導迴路中的位置不同，導致：
// + 迴路電感分配不均：$L_1 != L_2$，其中 $L_1 + L_2 = L_"total"$。
// + 磁通耦合的差異：兩個接面對外部磁場的響應不同。

// === 非對稱 SQUID 的理論分析 Theoretical Analysis of Asymmetric SQUID <subsection-asymmetric-squid-theoretical-analysis>
// 對於一個非對稱 SQUID，其總電流-相位關係可以表示為：
// $ I_s = I_("c1") sin(phi_1) + I_("c2") sin(phi_2) $

// 考慮接面參數的非對稱性，我們可以引入非對稱參數 $alpha$：
// $ alpha = (I_("c1") - I_("c2")) / (I_("c1") + I_("c2")) $

// 當 $alpha = 0$ 時，系統退化為對稱 SQUID；當 $alpha != 0$ 時，系統表現出非對稱行為。

// 對於中等非對稱性 ($|alpha| < 1$)，總臨界電流可以近似表示為：
// $ I_"max"(Phi) = (I_("c1") + I_("c2")) sqrt(cos^2((pi Phi) / Phi_0) + alpha^2 sin^2((pi Phi) / Phi_0)) $


// === 高度非對稱 SQUID：相位偏置探測器 Highly Asymmetric SQUID: Phase-Biased Detector <subsection-highly-asymmetric-squid>

// 當一個接面的臨界電流遠大於另一個時（$I_c^"Ref" >> I_c^"Tgt"$），非對稱 DC-SQUID 會進入「*相位偏置探測器*（phase-biased detector）」的工作模式：強接面提供近似固定的相位參考，使弱接面（待測接面）的相位幾乎由外加磁通線性掃描，因而能由量測到的 $I_s (Phi)$ 反推較弱接面的電流-相位關係（Current-Phase Relation, CPR）。

// ==== 物理圖像與基本假設 Physics Picture and Basic Assumptions <subsubsection-physics-picture>

// 在高度非對稱極限中，我們將兩接面分別稱為：

// - *參考接面（Reference Junction）*：臨界電流大、CPR 接近正弦或已知，近似呈現相位鎖定。
// - *目標接面（Target Junction / Junction-under-test）*：臨界電流小，其 CPR 即為欲分析之對象。

// 本節先採用最常見、也最利於建立直覺的近似：

// 1. *忽略迴路電感*（small-inductance limit）：迴路屏蔽效應可忽略，磁通-相位約束為
//   $phi_1 - phi_2 = 2pi Phi/Phi_0$。
// 2. *參考接面 CPR 近似正弦*：$I_s^"Ref" (phi_1) = I_c^"Ref" sin(phi_1)$。
// 3. *高度非對稱*：$I_c^"Ref" >> I_c^"Tgt"$，且參考接面在臨界附近的斜率足以主導最大化條件，使其相位被「鎖住」。

// ==== 總超電流與磁通-相位約束 Total Superconducting Current and Flux-Phase Constraint <subsubsection-constraint>

// 令參考接面相位為 $phi_1$、目標接面相位為 $phi_2$，則總超電流可寫為

// $ I_s (phi_1,phi_2) = I_c^"Ref" (phi_1) + I_c^"Tgt" (phi_2) $

// 其中 $I_c^"Tgt" (phi_2)$ 是目標接面的 CPR（未知）。在忽略迴路電感的近似下，有

// $ phi_1 - phi_2 = 2pi Phi/Phi_0 => phi_2 = phi_1 - 2pi Phi/Phi_0 $

// 因此，對每個外加磁通 $Phi$，SQUID 的臨界電流（或在準靜態量測下的切換電流近似）可視為一個「最大化問題」：

// $ I_s (Phi) = max_(phi_1) [ I_c^"Ref" (phi_1) + I_c^"Tgt" (phi_1 - 2pi Phi/Phi_0) ] $

// ==== 高度非對稱極限下的「相位鎖定」與線性掃描 Phase Locking and Linear Scanning in Highly Asymmetric Limit <subsubsection-phase-lock>

// 若 $I_c^"Ref" >> I_c^"Tgt"$，則最大化主要由參考接面決定。對正弦 CPR 的參考接面而言，最大值發生在

// $ phi_1 approx pi/2 (mod 2pi) $

// 此時目標接面的相位近似為

// $ phi_2 approx pi/2 - 2pi Phi/Phi_0 $

// 因此測得的臨界電流可近似寫成「大偏置直流 + 目標 CPR」：

// $ I_s (Phi) approx I_c^"Ref" (pi/2) + I_c^"Tgt" (pi/2 - 2pi Phi/Phi_0) $

// 這個近似揭示了相位偏置探測器的核心：外加磁通 $Phi$ 等效地線性掃描目標接面相位 $phi_2$，使得 $I_s (Phi)$ 的磁通依賴形狀直接攜帶 $I_c^"Tgt" (phi)$ 的資訊。

// ==== 量測切換電流與目標接面 CPR 的對應關係 Direct Readout of Target Junction CPR <subsubsection-direct-readout>

// 在上式近似成立時，可建立一個簡潔的對應：

// 1. 定義相位映射
//   $ phi equiv phi_2 approx pi/2 - 2pi Phi/Phi_0 $
// 2. 用量測得到的臨界電流扣除參考接面的 DC 偏置
//   $ I_c^"Tgt"(phi) approx I_s (Phi) - I_c^"Ref" (pi/2) $

// 實作時常見做法是：先以 $max I_s (Phi)$ 估計 $I_c^"Ref" (pi/2)$（或以獨立量測校準參考接面），再將 $I_s (Phi)$ 平移並重新標定橫軸為相位 $phi$，即可得到目標接面的 CPR 之第一版重建。

// ==== 適用條件與常見偏差來源 Validity Conditions and Common Sources of Deviation <subsubsection-validity>

// 雖然「直讀」非常直觀，但在高精度 CPR 量測中，以下因素會使 $phi_1 approx pi/2$ 的鎖定條件失效，導致兩接面 CPR 混疊：

// - *導數鎖定條件不足*：最大化條件與 $partial I/partial phi$ 有關；若參考接面在臨界附近的斜率不夠主導，則 $phi_1$ 會偏離 $pi/2$，使得 $I_c^"Tgt"$ 的映射失真。
// - *非零迴路電感與額外電感*：一旦迴路屏蔽不可忽略，約束關係需加入 $L$ 與循環電流，$phi_1-phi_2$ 不再等於 $2pi Phi/Phi_0$。
// - *參考接面 CPR 非正弦*：例如 nanobridge 或長接面可能呈現 sawtooth/高諧波，會改變鎖定相位位置與映射規則。

// 因此，嚴謹的 CPR 萃取通常會以「forward model」方式：保留 $I_c^"Tgt" (phi)$ 的參數化（如傅立葉展開）並在每個 $Phi$ 上做最大化以產生 $I_c^"pred" (Phi)$，再對量測曲線做全域擬合，能同時納入電感與參考接面非理想性。




// === 高度非對稱 SQUID：相位偏置探測器 Highly Asymmetric SQUIDs: Phase-Biased Detectors
// 當一個接面的臨界電流遠大於另一個時（$I_("c1") >> I_("c2")$），SQUID 可以被視為一個相位偏置 (phase-biased) 的探測器。在此組態中：

// 1. *參考接面 (Reference Junction)*：近似地提供一個固定的相位參考，$phi_1 approx "常數"$。
// 2. *目標接面 (Target Junction)*：其相位差 $phi_2$ 主要由外部磁通量 $Phi_"ext"$ 控制。

// 透過精密量測非對稱 SQUID 的總臨界電流 $I_"c,total"$ 隨外部磁通量 $Phi_"ext"$ 的完整調變曲線，我們可以直接重構出目標接面的電流-相位關係 (Current-Phase Relation, CPR)@Babich2023_LimitationsCPR_NanoLett：
// $ I_("s,target")(phi) = I_("c,total")(Phi_"ext") - I_("c1") sin(phi_1) $

// === 非對稱性對性能的影響與應用 (Impact of Asymmetry on Performance and Applications)

// *磁通量調變深度（flux modulation depth, FMD）*：對於對稱 SQUID，磁通量調變的深度為 100%，即在半整數磁通量量子處臨界電流可以完全抵消。而對於非對稱 SQUID，調變深度由非對稱參數決定：
// $ "FMD" = (I_"max" - I_"min") / I_"max" = (2|I_("c1")||I_("c2")|) / (I_("c1")^2 + I_("c2")^2) $

// *磁通量靈敏度*：非對稱性會改變 SQUID 的磁通量-電壓轉換係數@Crete2021_SelfField_Micromachines：
// $ (d V) / (d Phi) = R_N (d I_c) / (d Phi) $
// 其中 $R_N$ 是等效正常態電阻。對於非對稱 SQUID，此轉換係數在不同磁通量點會有所變化。

// *CPR 探測能力*：非對稱 SQUID 提供了一個探測約瑟夫森接面內在物理的強大工具。透過分析其磁通量調變圖樣的畸變，我們可以進行傅立葉分析：
// $ I_c(Phi_"ext") = sum_(n=0)^infinity a_n cos((2pi n Phi_"ext") / Phi_0) + b_n sin((2pi n Phi_"ext") / Phi_0) $

// 不同的傅立葉分量對應於 CPR 的不同諧波，從而可以識別非正弦 CPR 的特徵@Babich2023_LimitationsCPR_NanoLett。

// === CPR 重建方法 (CPR Reconstruction Method) <subsection-cpr-reconstruction-asym-squid>

// 我們考慮一個非對稱的雙接面超導量子干涉元件 (asymmetric DC-SQUID)，其包含一個具有較大臨界電流 $I_r$ 的參考接面 (reference junction)，以及一個具有較小臨界電流 $I_j$ 的待測接面 (studied junction)，滿足條件 $I_r >> I_j$。假設參考接面的電流-相位關係 (CPR) 為標準的正弦函數 $I_r sin(phi_r)$，而待測接面的 CPR 則為待確定的未知函數 $I_j(phi)$。

// 流經干涉元件的總超導電流 $I_s$ 為兩臂電流之和：
// $ I_s = I_r sin(phi_r) + I_j(phi), $ <eq-total_current>
// 其中 $phi_r$ 與 $phi$ 分別為參考接面與待測接面兩端的規範不變相位差 (gauge-invariant phase difference)。若忽略 SQUID 環路的幾何電感效應 ($L -> 0$)，由磁通量子化 (flux quantization) 所施加的相位限制條件為：
// $ phi_r = phi + (2pi Phi)/Phi_0, $ <eq-phase_constraint>
// 此處 $Phi$ 為外加磁通量，$Phi_0 = h/(2e)$ 為磁通量子。

// SQUID 的臨界電流 $I_(s, "max")$ 取決於總電流 $I_s$ 對相位 $phi$ 的極大值。根據極值條件 $d I_s \/ d phi = 0$，我們可得到臨界相位 $phi_c$ 的關係式：
// $ (d I_s)/(d phi)|_(phi=phi_c) = (d I_j)/(d phi) + I_r cos(phi_c + (2pi Phi)/Phi_0) = 0. $ <eqDerivativeCondition>
// 此條件定義了發生最大超流時的相位 $phi_c$。

// 將量測到的最大超流 $I_(s, "max")$ 對磁通 $Phi$ 進行微分，我們得到：
// $
//   (d I_(s, "max"))/(d Phi) = underbrace((d I_j)/(d phi) + I_r cos(phi_c + (2pi Phi)/Phi_0), =0 "，根據式" #box[@eqDerivativeCondition]) (d phi_c)/(d Phi) + (2pi I_r)/Phi_0 cos(phi_c + (2pi Phi)/Phi_0).
// $ <eq-flux_derivative>
// 由於極大化條件，上式中括號內的第一項為零。這項簡化使我們能夠反轉關係式，將微觀的臨界相位 $phi_c$ 明確表示為實驗可觀測量 $d I_(s, "max") \/ d Phi$ 的函數：
// $
//   phi_c = plus.minus arccos((Phi_0)/(2pi I_r) (d I_(s, "max"))/(d Phi)) - (2pi Phi)/Phi_0 + 2pi k, quad k in ZZ.
// $ <eq-phi_c_inversion>
// 其中 $k$ 為整數。

// 最後，將求得的 $phi_c$ 代回@eq-total_current 並利用三角恆等式，我們即可重建待測接面未知的電流-相位關係 $I_j(phi)$：
// $
//   I_j(phi_c) = I_(s, "max") - I_r sin(phi_c + (2pi Phi)/Phi_0) = I_(s, "max") - sqrt(I_r^2 - ((Phi_0)/(2pi) (d I_(s, "max"))/(d Phi))^2).
// $ <eq-final_cpr>
// 此解析表示式允許我們直接從量測到的 SQUID 臨界電流隨磁場變化關係中，反演出待測接面的 CPR 波形 @ginzburg_determination_2018 @Babich2023_LimitationsCPR_NanoLett。

// ==== 有限電感效應之修正 (Correction for Finite Inductance) <subsection-correction-finite-inductance>

// 在實際的實驗體系中，SQUID 環路不可避免地具有有限的幾何電感 $L$。這導致穿過 SQUID 環路的總磁通量 $Phi$ 與外部施加的磁通量 $Phi_("ext")$ 並不相等，必須考慮由環路電流所產生的屏蔽磁通 (shielding flux) 。修正後的磁通關係式為：
// $ Phi = Phi_("ext") - Phi_L, $ <eq-flux_correction>
// 其中 $Phi_L$ 為電感所貢獻的磁通分量。

// 根據 Ginzburg 等人的分析，在高度非對稱 ($I_r >> I_j$) 的極限下，流經電感的電流主要由參考接面的臨界電流決定，因此電感磁通 $Phi_L$ 可近似為一個與外加磁場無關的常數 ：
// $ Phi_L approx 1/2 L (I_r - I_j) = 1/2 L Delta I_c. $ <eq-inductance_flux>
// 這意味著有限電感的主要效應是在磁通軸上引入一個固定的偏移量 (shift)。

// 因此，考慮電感修正後的待測接面相位 $phi_c$ 應修正為 @ginzburg_determination_2018：
// $
//   phi_c = plus.minus arccos((Phi_0)/(2pi I_r) (d I_(s, "max"))/(d Phi)) - (2pi Phi_("ext"))/Phi_0 - (2pi Phi_L)/Phi_0.
// $ <eq-corrected_phase>
// 在實驗數據分析中，若觀察到 $I_(s, "max")$ 對 $Phi_("ext")$ 的干涉圖形發生水平偏移，即可利用此效應反推 SQUID 的寄生電感值，並對 CPR 重建結果進行校正。


// === 實驗設計與量測技術 (Experimental Design and Measurement Techniques)

// *元件設計考量*：設計非對稱 SQUID 時需要考慮@Butz2010_AsymDCSQUIDs_Diploma：
// 1. 非對稱比的選擇：平衡調變深度與 CPR 探測精度
// 2. 迴路幾何：最小化寄生電感和串擾
// 3. 材料選擇：確保接面特性的穩定性

// *低溫量測協議*：精確的 CPR 量測需要：
// 1. 溫度穩定性：維持 $T << T_c$ 以確保超導性
// 2. 磁場屏蔽：消除外部磁場干擾
// 3. 電流偏置精度：高解析度的電流控制
// 4. 電壓量測靈敏度：檢測微小的電壓變化

// == 非正弦 CPR 與先進應用 Non-Sinusoidal CPRs and Advanced Applications <section-non-sinusoidal-cpr>

// 將非正弦 CPR 納入 SQUID 的理論中，揭示了更豐富、更複雜的現象學。磁通調變模式的形狀成為接面 CPR 諧波含量的直接探測器。

// === 高次諧波對磁通調變的影響 Effect of Higher Harmonics on Flux Modulation <subsection-higher-harmonics-effect>

// 考慮一個 SQUID，其中接面具有包含前兩個諧波的 CPR：
// $ I_s (phi) = I_(c 1) sin(phi) + I_(c 2) sin(2phi) $

// SQUID 的總超導電流變為：
// $
//   I_s^"total" (Phi) =
//   2 & I_(c 1) sin(phi_1 + (pi Phi)/Phi_0) cos((pi Phi)/Phi_0) #<equate:revoke> \
//   + & 2I_(c 2) sin(2(phi_1 +(pi Phi)/Phi_0)) cos((2pi Phi)/Phi_0)
// $

// 這揭示了一個關鍵結果：CPR 的第二諧波以 $Phi_0/2$ 的磁通週期進行干涉。一般來說，接面 CPR 的第 n 次諧波 $sin(n phi)$ 將在 SQUID 的總電流中產生一個干涉項，該干涉項以 $Phi_0/n$ 的週期進行調變。

// === 拓撲量子材料的應用 Applications in Topological Quantum Materials <subsection-topological-materials>

// 在 #ce[PtTe2] 等新興量子材料的研究中，非對稱 SQUID 技術不僅能夠揭示材料的內在拓撲性質，更為開發新型超導量子元件提供了重要的設計指導。

// #ce[PtTe2] 作為第二類狄拉克半金屬 (Type-II Dirac Semimetal)，其約瑟夫森接面預期表現出@Cuozzo2024_MW_Tunable_Diode_PRResearch：
// 1. 非正弦 CPR：由於狄拉克費米子的特殊輸運性質
// 2. 高次諧波分量：特別是二階諧波 ($sin(2phi)$) 項
// 3. 可調控性：透過外部磁場調控 CPR 的形式

// 非對稱 SQUID 也是探測約瑟夫森二極體效應 (Josephson Diode Effect, JDE) 的有效工具@Cuozzo2024_MW_Tunable_Diode_PRResearch。透過量測正、負方向的切換電流差異：
// $ eta = (I_"sw"^+ - I_"sw"^-) / (I_"sw"^+ + I_"sw"^-) $
// 可以量化 JDE 的強度，並與重構的 CPR 進行比對分析。


== 二碲化鉑：拓樸半金屬中的非傳統超導近接效應 #ce[PtTe2]: Unconventional Proximity Effect in Topological Semimetal <section-ptte2-properties>

二碲化鉑（Platinum ditelluride, #ce[PtTe2]）是一種過渡金屬二硫屬化物（Transition Metal Dichalcogenide, TMD），屬於通式為 MX₂ 的材料家族，近年來因其豐富的物理內涵而備受關注。在結構上，二碲化鉑結晶為1T相 (CdI₂-type)，呈現出一種由鉑（Platinum, #math.attach(math.upright("Pt"), bl: "78")）原子層夾在兩層碲（Tellurium, #math.attach(math.upright("Te"), bl: "52")）原子層之間的八面體配位層狀結構。這種層狀特性使其可以透過機械剝離法，輕易地獲得從塊材到幾個原子層甚至單原子層厚度的二維薄片（Flake），為構建凡德瓦爾異質結構 (van der Waals heterostructures) 和平面型奈米元件提供了極大的可能性。
在電子特性方面，二碲化鉑最引人注目的特徵是它已被理論預測並由角解析光電子能譜 (ARPES) 等實驗技術證實為一種第二類狄拉克半金屬 (Type-II Dirac Semimetal)。與傳統的第一類狄拉克半金屬（如石墨烯 Graphene）中點狀的費米面不同，第二類狄拉克半金屬擁有極度傾斜的狄拉克錐，使得電子和電洞口袋在狄拉克點處相切接觸。這些受晶體對稱性保護的狄拉克點，賦予了二碲化鉑獨特的低能電子態和輸運性質。特別是其拓樸保護的表面態，具有螺旋自旋-動量鎖定（helical spin-momentum locking）的特性，這意味著電子的動量與其自旋方向是鎖定的，賦予了二碲化鉑獨特的低能電子態和輸運性質，使其成為研究拓撲物理與超導性之間交互作用的理想材料平台。

// #figure(
//   image("Images/Fig2-Characterization of PtTe2.png", width: 100%, fit: "stretch"),
//   caption: [II型狄拉克半金屬的二碲化鉑表徵。Ref.@yan_lorentz-violating_2017],
// )<fig-Characterization-of-PtTe2>
// a, b：I型與II型狄拉克費米子的示意圖。
// c, d：二碲化鉑晶體結構的側視圖與頂視圖。綠色球體代表 Pt 原子，紅色球體代表 Te 原子，黑色虛線標示單位晶胞。
// e：(001) 平面的體相與投影表面(Brillouin Zone）。紅點（標記 D）顯示三維狄拉克點的位置。
// f：室溫下測得的拉曼光譜（Raman spectroscopy）。
// g：室溫下二碲化鉑的 X 射線繞射（X-ray diffractometer, XRD）圖譜，插圖為邊長數毫米的單晶樣品照片。
// h：電子束能量 70 eV 下的低能量電子衍射（Low-energy electron diffraction, LEED）圖樣。




值得注意的是，塊材二碲化鉑本身並沒有超導性，然而，在本研究所探討的約瑟夫森接面元件中，二碲化鉑作為「弱連結 (weak link)」區域，其局部超導性主要是透過與具有更高超導轉變溫度的電極（如鈮鈦合金 Niobium–titanium, Nb-Ti）接觸，經由超導近接效應 (superconducting proximity effect) 所誘導產生。這就構成了一個超導體-狄拉克半金屬-超導體 (superconductor-Dirac semimetal-superconductor, S-DSM-S) 的混合結構。

在這個S-DSM-S混合結構中，超導電流的傳輸是由由二碲化鉑內部獨特的狄拉克費米子所中介的。理論預測，這種由拓樸表面態主導的傳輸機制，會促進多重安德烈夫反射(multiple Andreev reflections, MAR)過程，從而導致一個偏離標準正弦函數的非傳統電流-相位關係@Cuozzo2024_MW_Tunable_Diode_PRResearch。此外，外加磁場可以與表面態的自旋相互作用，進而調控CPR的形式，甚至產生約瑟夫森二極體效應（Josephson Diode Effect, JDE），即正反方向的臨界電流不相等（$I_c^+ != I_c^-$），深入研究二碲化鉑約瑟夫森接面的電學特性，對於理解拓撲半金屬中的近接超導物理，以及探索其在未來量子技術中的應用潛力，具有至關重要的意義。

因此，本研究的理論假說是：透過將#ce[PtTe2]作為弱連結整合進一個非對稱SQUID中，我們不僅能夠直接觀測到其預期中的非正弦CPR，還能利用外部磁場作為調控手段，系統性地研究其拓樸性質如何體現在宏觀的量子輸運現象上。

// #figure(
//   image("Images/Fig3-S-DSM-S.png", width: 90%, fit: "stretch"),
//   caption: [S-DSM-S約瑟夫森接面示意圖(Type-I)。Ref.@li_4-periodic_2018],
// )
// <fig-S-DSM-S>
// 其中安德烈夫束縛態將超電流從一端超導電極 (S) 傳送到另一端超導電極。在DSM夾層中，沿其中一個狄拉克錐(Dirac cone)錐向右移動的電子（藍色 e）在右側介面可被安德烈夫反射成同一狄拉克錐中向左移動的電洞（橙色 h）。該電洞又可在左側介面被反射回電子。
// #figure(
//   image("Images/Fig4-S-DSM-S Andreev reflections.png", width: 90%, fit: "stretch"),
//   caption: [狄拉克錐由I型傾斜轉變到II型。Ref.@PhysRevB.101.214508],
// )
// <fig-S-DSM-S-Dirac-cone>
// 向右（向左）移動之電子分別以藍色（紅色）標記。插圖顯示兩個狄拉克錐沿 $k_y$ 軸朝相反方向傾斜之示意。能量軸位於平面外。與費米能相交之狄拉克錐截面，分別以實線（電子）與虛線（空穴）所示之橢圓標示。狄拉克節點位於 $k_y$ 軸上的 $±k_D$。下方面板則示意在所示 $ζ$ 值下狄拉克錐的傾斜情形。


=== 能階不匹配 Energy Level Mismatch:  <subsection-ptte2-energy-mismatch>

雖然 $1T-"PtTe"_2$ 已由 ARPES 與第一性原理計算確認具有受晶體對稱性保護的 II 型狄拉克錐與相關表面態，但在「化學計量、未特別調控化學勢」的典型塊材條件下，其狄拉克節點能量 $E_D$ 往往位於費米能階 $E_F$ 的深束縛能處（文獻整理常見尺度為 $|E_D - E_F| approx 0.8 "eV"$），使得狄拉克節點附近的線性色散並不直接主宰 $E approx E_F$ 的低能激發與直流輸運。@yan_lorentz-violating_2017 @xu_nite2_typeii_dirac_2018

因此，在本研究關心的「近接超導輸運／約瑟夫森超電流」能量尺度（以 $E_F$ 附近的準粒子為核心）下，實際參與傳輸的主要是多條穿越 $E_F$ 的三維體相能帶所形成之電子/電洞費米口袋；也就是說，#ce[PtTe2] 的導電更接近「多能帶半金屬」情境，而非「由拓樸表面態主導」的單一通道輸運。此觀點也與磁輸運與量子震盪分析相一致：在 #ce[PtTe2] 的 SdH 等訊號中，對應能帶的 Berry phase 常呈現平庸特徵，並顯示多能帶導電的行為。@fei_irptte2_band_perfection_2018 @pavlosiuk_ptte2_galvanomagnetic_2018

*對本研究之意涵*：在未能提供「化學勢已被閘極/摻雜/界面電荷轉移有效拉近 $E_D$」的直接證據前，本論文在解讀 #ce[PtTe2] 弱連結所呈現的非正弦 CPR 與可能的約瑟夫森二極體效應（JDE）時，將以「體相多能帶（含自旋軌道耦合、Zeeman 與軌域效應、介面透明度不均、非對稱 SQUID 幾何與自場等）」作為更保守且可檢驗的主導機制框架；拓樸表面態的主導貢獻則視為需額外驗證（例如：閘極可調之臨界電流/正常態電導、厚度依賴、或能譜/表面敏感量測）才能成立的進一步假說。@yan_lorentz-violating_2017

// 第三章：實驗方法
= 實驗方法Experimental Methods <CH3-experimental-methods>

本章詳細闡述本研究所使用的完整實驗流程與設備，涵蓋了從二維材料的取得、奈米元件的製備，到極低溫電學量測系統的架設與操作。

== 元件製備 Device Fabrication <CH3-1-device-fabrication>

本節詳述使用機械剝離法得到二碲化鉑薄片，並透過多道微影與沉積步驟完成SQUID元件的完整流程。

=== 助熔劑生長法 Self‐Flux Method <CH3-1-1-self-flux-method>

本實驗所使用之二碲化鉑為國立成功大學凝態物理實驗室呂欽山教授所提供@hsueh_investigating_2024，其使用助熔劑法生長而成。助熔劑法是一種功能強大且廣泛使用的技術，將欲生長晶體的成分（溶質）溶解於合適的溶劑（助熔劑）中，再藉由緩慢冷卻溶液來引發單晶結晶。

#figure(
  image("Images/Fig6-PtTe2-crystal.png", width: 73%),
  caption: [二碲化鉑晶體塊材],
) <Fig6-PtTe2-crystal>
@Fig6-PtTe2-crystal 呂欽山教授所提供的二碲化鉑晶體塊材，拍攝與保存於手套箱內。

== 機械剝離法 Mechanical Exfoliation Method <CH3-2-1-mechanical-exfoliation-method>
本章將詳細說明本實驗使用機械剝離法 (Mechanical Exfoliation Method) 得到原子級厚度的二維材料層狀薄片的完整流程與方法，包括基板預處理、膠帶黏貼剝離。

=== 基板準備 Substrate Preparation <CH3-2-1-1-substrate-preparation>
本實驗使用的基板為低電阻重參雜 P 型單面矽/熱氧化二氧化矽基板 (NOVA electronics \#HS39626-OX：4", P-type, #text("<100>"),
Resistivity:
$ qtyrange("1.0", "5.0", "ohm centimeter ", per: "/", delimiter: tilde.op) $
// $1.0 tilde.op 5.0 times 10^-3 Omega dot #unitcm)$,
2850 A°±5% Dry Thermal Oxide)。

1. 將 7×7mm 大小的破片放入 140 °C 的二甲基亞碸 (DMSO, Dimethyl sulfoxide) 溶劑中靜置 1 小時，以去除基板上保護用的光阻（MICROPOSIT™ S1813 G2 hotoresists）薄膜。
2. 將破片放入 40 °C 的丙酮（Acetone）溶劑中去除 DMSO，約 1 分鐘後再放入異丙醇 (IPA) 溶劑中進行潤洗後取出，接著使用氮氣槍吹乾基板表面。
3. 使用Henniker plasma HPT-100電漿處理系統，以氧電漿（$O_2$ Plasma）進行基板表面清潔，使用前用100% 運轉功率、50 標準立方公分每分（Standard Cubic Centimeter per Minute, SCCM），進行5分鐘的腔體清潔，過程中需觀察腔體內電漿顏色，以確保管路中沒有氧氣以外的其他氣體。腔體清潔結束後使用100%運轉功率、40 SCCM，進行10分鐘的基板表面清潔。完成後儘速將基板放置於手套箱內開始進行剝離以避免水氣附著。

=== 二維材料剝離與光阻塗佈 2D Materials Exfoliation and Photoresist Coating
為避免二碲化鉑氧化層生成，剝離步驟皆在手套箱內完成，且剝離完成後儘速進行光阻塗佈，因此將兩操作視為一個連續的製程節點以下進行詳細步驟說明：
本實驗使用的膠帶為 Nitto SPV-224PR-MJ，以下簡稱藍膠。

1. 確認手套箱內水氧值皆小於 0.5ppm，將零號藍膠 (Tape 0) 膠面朝上固定於平面，用鑷子將夾取二碲化鉑塊材（Bulk）放置於 Tape 0 上。
2. 一號藍膠 (Tape 1) 膠面朝下覆蓋於 Tape 0 後使用棉棒輕推表面確保確實兩膠面接觸，撕開兩片膠帶實現層與層的分離。
3. 重複步驟 2，直到塊材佈滿大於 7×7mm 大小的面積範圍後將 Tape 0 用另一片藍膠覆蓋後收納備用。
4. 將 Tape 1 膠面朝上固定於平面，二號藍膠 (Tape 2) 膠面朝下覆蓋於 Tape 1 後使用棉棒輕推表面確保確實兩膠面接觸，撕開兩片膠帶實現層與層的分離後將 Tape 1 用另一片藍膠覆蓋後收納備用。
5. 重複步驟 4，直到塊材分布密度合適，以二碲化鉑為例通常為 Tape 4 或 5。
6. 使用電磁加熱烤盤以 120 °C 加熱基板 10 分鐘後靜置 1 分鐘。
7. 將基板放置於平面，藍膠膠面朝下並傾斜一小角度使其一側接觸基板後使用棉棒輕推表面，確保膠面與基板表面確實接觸且無氣泡後靜置 5 分鐘。
8. 撕開膠帶實現層與層的分離後將基板置於可重複使用真空密封食品壓縮袋，使用手持式真空保鮮機抽真空後拿出手套箱。
9. 儘速將基板移動至旋轉塗佈機 (spin coater) 使用聚甲基丙烯酸甲酯（Poly(methyl methacrylate), PMMA A6）正光阻（positive photoresist）以 500 rpm 旋轉 5 秒, 以高加速度升速至最終轉速 4000 rpm，此旋塗步驟總時長為 55 秒。
10. 使用 180 °C 預烤 (prebake) 基板 180 秒即完成機械剝離與光阻塗佈流程。

=== 電子束微影 E-Beam Lithography, EBL
本研究中所有奈米級圖案的定義，例如對準標記與元件電極，均是透過電子束微影技術完成。整個流程在一台 Raith PIONEER Two 掃描式電鏡/電子束微影系統上執行。以下將詳述其製備、曝光與顯影的具體步驟。

==== 抗蝕劑準備 Resist Preparation
在進行圖案定義之前，首先須在樣品表面旋塗一層電子束抗蝕劑。本實驗選用PMMA A6作為正光阻。旋塗程序分為兩階段：首先以 500 rpm 的低速旋轉 5 秒，以確保抗蝕劑均勻散佈，隨後以 4000 rpm 的高速旋轉 55 秒，以達到最終所需的厚度。旋塗完成後，樣品被放置於 180°C 的熱板上烘烤 180 秒，目的是為了完全去除抗蝕劑中的溶劑並使其固化。

==== 圖案曝光 Pattern Exposure
抗蝕劑準備完成後，樣品被送入 EBL 系統的真空腔體中進行圖案曝光。所有的曝光步驟均在 20 kV 的加速電壓下進行。此流程同樣分為兩步：

+ 對準標記 (alignment markers)：
  第一步是在樣品上定義大面積的對準標記，這些標記將作為後續高精度圖案疊對的基準。為實現快速曝光，此步驟選用了 120 µm 的大光圈 (aperture) 以獲得約 12 nA 的較大電子束流，並採用 370 μC/cm² 的面積劑量 (area dose) 進行寫入。

+ 接觸電極 (contact electrodes)：
  在系統通過對準標記精確鎖定 #ce[PtTe2] 薄片的位置後，進行第二步高解析度的接觸電極圖案曝光。為確保圖案的精細度與邊緣的陡峭度，此步驟換用 30 µm 的小光圈，將束流精細地控制在約 0.3 nA，並以 375 μC/cm² 的劑量進行寫入。


==== 顯影 Development
曝光完成後，將樣品從系統中取出進行化學顯影，以溶解經電子束照射後分子鏈斷裂的 PMMA 區域。樣品被沉浸於甲基異丁基酮 (MIBK) 與異丙醇 (IPA) 體積比為 1:3 的混合溶液中。整個顯影過程在 23°C 的恆溫環境下精確控制 50 秒。隨後，為終止顯影反應，樣品被迅速轉移至純 IPA 溶液中浸泡 20 秒，以沖洗並去除殘留的顯影劑。完成此步驟後，樣品表面即形成了所需圖案的抗蝕劑模板，可供後續的金屬沉積與舉離 (lift-off) 製程使用。


== 金屬沉積與舉離 Metal Deposition and Lift-off
本實驗涉及兩種金屬沉積：
1. *對準標記 (Cr/Au)*：使用一般金屬作為後續製程的定位基準。
2. *超導電極 (NbTi)*： 用於與#ce[PtTe2]薄片形成接觸。

=== 一般金屬熱蒸鍍沉積與舉離 Thermal Evaporation Deposition and Lift-off of Normal Metals

為了能夠在後續的電子束微影步驟中，將奈米級的電極圖案精確地對準 (align) 到目標 #ce[PtTe2] 薄片上，我們首先在 #ce[SiO2]/#ce[Si] 基板上製作了一組金屬材質的全域對準標記 (global alignment markers)。

標記的圖案首先透過 EBL 技術被定義在抗蝕劑層上。在完成顯影後，樣品被送入一台 *Korvus HEX 桌上型物理氣相沉積 (PVD) 系統*中進行金屬沉積。該系統的核心是一個四腔電子束蒸發器，其原理是利用高能電子束在真空環境下直接轟擊並加熱裝有源材料的坩堝，使材料蒸發形成物理氣相沉積。

為確保標記的穩定性與高對比度，我們採用了雙層金屬結構。在腔體被抽至高真空環境後，依序蒸鍍：

1. *附著層 (adhesion layer)*：一層約 10 nm 厚的*鉻 (Cr)*，用以增強標記與基板的附著力。
2. *對比層 (contrast layer)*：一層約 50 nm 厚的*金 (Au)*，其較高的原子序數能夠在掃描式電子顯微鏡 (scanning electron microscope, SEM) 下提供清晰的二次電子或背向散射電子圖像，從而利於 EBL 系統進行自動識別和對位。

金屬沉積完成後，透過在丙酮中進行舉離，移除抗蝕劑，最終在基板表面留下永久性的 Cr/Au 金屬對準標記。這些標記為所有後續的材料轉移和微影製程提供了一個固定的、高精度的參考坐標系。

=== 超導金屬的濺鍍沉積與舉離 Sputter Deposition of Superconducting Metals and Lift-off

最終用以連接#ce[PtTe2]元件的超導電極，是透過一套包含原位 (in-situ) 介面清潔與磁控濺鍍 (magnetron sputtering) 的整合性製程完成。所有步驟均在 Aja Orion 8 物理氣相沉積 (PVD) 系統中執行，以確保最佳的介面品質。

=== 介面清潔：原位離子銑削 Interface Cleaning: In-situ Ion Milling

在沉積超導金屬之前，為了確保金屬與#ce[PtTe2]材料之間形成一個潔淨、低電阻的歐姆接觸 (Ohmic contact) 介面，我們對樣品進行了一道原位的離子束蝕刻處理。該過程在氬氣（Ar）流量控制在0.4 mTorr的腔體壓力環境下進行，離子源以 600 V 的加速電壓產生離子束，對樣品表面進行持續 30 秒的輕微離子銑削（Ion Milling）。此步驟旨在有效去除先前 EBL 製程中可能殘留的任何抗蝕劑殘渣或樣品表面的自然污染物。

=== 超導金屬的濺鍍沉積 Sputter Deposition of Superconducting Metals

介面清潔完成後，樣品維持在高真空環境中，不破壞真空，立即進行超導薄膜的沉積。我們選擇*鈮鈦 (NbTi)* 合金作為超導接觸電極材料。濺鍍製程在 3 mTorr 的氬氣工作壓力下進行。一個 300 W 的直流 (DC) 電源被施加於 NbTi 靶材上，使其原子被濺射並沉積到樣品表面，最終形成一層厚度為 70-120 nm 的均勻薄膜。

=== 接觸電極的舉離 Lift-off for Contacts Electrodes

完成濺鍍後，樣品從真空系統中取出，並執行最後的舉離步驟以定義出最終的電極圖案。樣品浸泡於丙酮中，以溶解下層的 PMMA ，並移除覆蓋其上的多餘 NbTi 薄膜。此步驟完成後，僅留下在 EBL 步驟中定義的、且與#ce[PtTe2]直接接觸的超導電極結構。

=== 顯微鏡檢測 Microscopy
在製程的各個階段，我們使用多種顯微鏡進行檢測與定位：
==== 光學顯微鏡 Optical Microscope
本實驗主要使用的光學顯微鏡（optical microscope, OM）為KEYENCE VHX-7000N，其主要用途為：
+ *尋找與定位二維材料層狀薄片*：完成機械剝離流程後，透過OM初步判斷是否有 二碲化鉑 薄片，並使用 VHX-7000N 的連續拍攝功能拍攝基板的四個角落及薄片照片，並得到座標。
  #figure(
    image("Images/Fig9-OM-map.png", width: 100%),
    caption: [二碲化鉑薄片的光學顯微鏡照片],
  ) <Fig9-OM-map>
  @Fig9-OM-map 使用 VHX-7000N 的連續拍攝功能拍攝基板的四個角落及薄片在基板上的位置分佈及目標薄片的高放大倍率照片。
+ *確認曝光後顯影結果*：
  完成顯影流程後，透過 OM 判斷曝光結果，確認線寬與曝光劑量是否正確，並使用「量測與標尺」功能拍攝照片並標注量測結果。
  #figure(
    image("Images/Fig10-OM-EBL.png", width: 100%),
    caption: [EBL曝光後顯影的光學顯微鏡照片],
  ) <Fig10-OM-EBL>
  @Fig10-OM-EBL EBL曝光後顯影的整體結構結果與SQUID環路的高放大倍率照片。
+ *確認對準標記蒸鍍後舉離結果*：完成舉離流程後，透過 OM 判斷對準標記蒸鍍結果，確認對準標記是否確實舉離無相連部分，並用適當倍率拍攝對準標記與目標薄片同框的照片以供後續數位化流程使用。
  #figure(
    image("Images/Fig7-alignment-markers.png", width: 100%),
    caption: [對準標記],
  ) <Fig7-alignment-markers>
  @Fig7-alignment-markers 完成 Cr/Au 蒸鍍與舉離後，在基板上留下的對準標記（已再次塗佈PMMA）。
+ *確認接觸電極蒸鍍後舉離結果*：完成舉離流程後，透過 OM 判斷接觸電極蒸鍍結果，確認小線寬部分是否確實舉離無相連部分，並使用「量測與標尺」功能拍攝照片並標注量測結果。
  #figure(
    image("Images/Fig8-contacts-electrodes.png", width: 100%),
    caption: [接觸電極],
  ) <Fig8-contacts-electrodes>
  @Fig8-contacts-electrodes 完成 NbTi 濺鍍與舉離後，在基板上留下的接觸電極與SQUID環路。
+ *確認打線結果*：完成打線流程後，透過 OM 判斷打線結果，確認基板上供接線轉接用之銲墊 (bonding pad) 和印刷電路板（printed circuit board, PCB）上金銲線連接指 (bonding finger) 與鋁銲線頭是否確實相連，並檢查鋁銲線無相互接觸以避免短路或形成預期外的電路通路。使用「圖片連接」功能用適當倍率拍攝所有金連接指與基板的照片，以供後續量測時作為線路參考。
  #figure(
    image("Images/Fig11-OM-wirebonding.png", width: 100%),
    caption: [打線結果的光學顯微鏡照片],
  ) <Fig11-OM-wirebonding>
  @Fig11-OM-wirebonding 整體打線結果與銲墊的高放大倍率照片。根據此圖可判斷打線結果良好，無短路或斷路現象，以及記錄樣品接觸電極與PCB銲線連接指的編號對應關係。
==== 原子力顯微鏡 Atomic Force Microscope
本實驗使用之AFM型號為 Park systems NX10 其在此研究中扮演了兩個關鍵角色：
+ 鑑定機械剝離 (mechanically exfoliated) 的 #ce[PtTe2] 薄片的厚度與層數。
+ 確認蒸鍍金屬電極的厚度、表面粗糙度與邊緣形貌。

所有 AFM 量測均在非接觸模式 (non-contact mode, NCM)下進行，以最小化探針與樣品表面之間的交互作用，從而保護脆弱的二維材料薄片與金屬結構不被物理損傷。

首先，對於 #ce[PtTe2] 薄片，我們透過量測其表面與周圍 #ce[SiO2] 基板之間的步階高度 (step height)搭配步階高度分佈來確定其物理厚度。基於已知的 #ce[PtTe2] 材料層間距，我們可以從量測到的厚度推算出薄片的原子層數。這一步驟對於篩選出符合實驗需求的特定層數（例如單層或少層）的樣品至關重要。

其次，在完成電極濺鍍製程後，我們利用 AFM 對接觸金屬 NbTi 的形貌進行檢測。分析的重點包括金屬膜的表面粗糙度 (surface roughness)、顆粒大小 (grain size) 以及電極圖案的邊緣清晰度。同時，透過量測金屬與基板的步階高度，我們可以驗證其實際沉積厚度是否與蒸鍍儀器設定的目標值一致。此項表徵是確保元件具備良好歐姆接觸與電氣性能的關鍵品質控制環節。
#figure(
  image("Images/Fig12-AFM.png", width: 100%),
  caption: [接觸電極與目標薄片的原子力顯微鏡照片],
) <Fig12-AFM>
@Fig12-AFM 透過 AFM 量測接觸電極與目標薄片的厚度，並分析其表面形貌與邊緣清晰度。利用步階高度與步階高度分佈分析顯示接觸電極厚度約為$qty("100", "nm")$，符合濺鍍目標值；目標薄片厚度約為$qty("21.17", "nm")$，約為40層。

== 元件特性分析系統 Device Characterization Setup

本研究旨在探討特定樣品在低溫環境及外加磁場下的電輸運性質 (electrical transport properties)。為此，我們搭建了一套基於四端點量測法 (four-point probe method) 又名開爾文測量法（Kelvin sensing）的直流電學量測系統。本章節將詳述其量測原理、實驗架構與操作步驟。

== 量測裝置 Measurement Setup
本章節將介紹量測裝置的構造與操作步驟。

=== 稀釋制冷機 Dilution Refrigerator

為實現對樣品在毫開爾文（milli-Kelvin, mK）溫度區間的量子現象觀測，本研究採用了一套 Bluefors 公司製造的 LD-400 型濕式稀釋制冷系統（Wet Dilution Refrigerator System）。該系統能夠提供約40 mK的穩定基礎溫度（base temperature）。提供如此低的實驗環境至關重要，其主要目的有二：第一，確保樣品溫度遠低於其超導轉變溫度（以#ce[NbTi]為例約6至8K），使樣品能完全進入並穩定維持在超導態；第二，有效抑制因熱能 ($k_B T$)引起的熱擾動，從而降低量子退相干（quantum decoherence） 效應，使得如電流-相位關係等微弱的宏觀量子現象得以被精確地量測。為進一步提升實驗效率，本系統配備了底部裝載快速樣品更換（fast sample exchange, FSE）機構。該機構允許在主制冷系統各級冷盤（如 4K plate 與 still plate）皆保持在低溫狀態的情況下，獨立地將樣品載台取出更換。相較於需要數日才能完成一次完整熱循環（升溫至室溫再降溫）的傳統方式，FSE 系統將更換樣品所需的週期縮短至14小時 。此功能極大地提高了樣品測試的效率，對於需要進行多輪製程參數迭代與多個元件篩選及特性比對的研究工作至關重要。

=== 超導磁鐵系統 Superconducting Magnet System

為研究樣品在不同磁場強度與方向下的物理特性，本實驗系統集成了一套 Bluefors 製造的三維向量磁鐵 (3D vector magnet)。該磁鐵系統的核心由三組相互正交的超導線圈構成，能夠在主軸 (Z-axis) 方向上產生最高達 9 特斯拉 (Tesla) 的磁場，並在與之垂直的兩個次軸 (X-axis and Y-axis) 方向上分別產生最高 1 T 的磁場，此即為一組 9-1-1 T 組態。這種三軸向量能力使得我們可以在三維空間中產生任意方向的磁場向量，從而對樣品的各向異性 (anisotropy) 或需要精確磁場對位的現象進行深入探討。

整個磁鐵系統的驅動與控制由一套 American Magnetics, Inc. (AMI) 的整合式電源供應系統負責。該系統包含三組獨立的磁鐵電源，其輸出電流由一台 AMI Model 430 電源程式控制器進行精密調控。此控制器不僅確保了各軸磁場的穩定性，更允許我們透過電腦程式自動化地控制磁場向量的大小、方向以及場掃描速率 (ramp rate)，以執行複雜的磁場掃描序列。

=== 低溫線路與客製化 PCB 樣品座 Cryogenic Wiring and Custom PCB Sample Holder

為了在將直流與射頻信號從室溫儀器傳導至mK溫區的量子元件時，最大程度地抑制傳導熱負載 (conducted heat load) 與電磁雜訊，本實驗搭建了一套多級濾波與熱錨方案。此方案的核心在於混合使用了商業化的低溫濾波器模組與客製化的終端樣品電路板。

==== 直流/低頻線路濾波 DC/Low-Frequency Line Filtering
所有通往樣品的直流與低頻控制線路，都經過一套 QDevil 公司生產的 QFilter 模組進行濾波。此模組被牢固地安裝於稀釋制冷機的混合腔冷盤 (mixing chamber plate) 上，以確保信號線及濾波器元件本身都能與 mK 溫區達到充分的熱平衡。

==== 客製化樣品座與高密度線路 Custom Sample Holder and High-Density Wiring
經過主濾波級後，信號透過一套高密度、模組化的線路連接至安裝有兩個PCB的客製化樣品座。PCB上為對48個獨立的信號通道中的44個通道設置了簡單的電阻電容（resistor–capacitor, RC） 濾波器。該線路方案利用了多芯數的 Micro-D 連接器對多達 48 個獨立的信號通道進行整合與管理。在制冷機內部，這些信號透過多組磷青銅雙絞線 (twisted pair) 進行傳輸。最終，在室溫端的接口面板，線路被轉換為四個 Fischer 24-pin 連接器，以便與外部的量測儀器相連。整個信號路徑的設計旨在確保信號完整性、最小化串擾 (crosstalk)，並提供穩固可靠的連接。

==== 高頻線路濾波 High-Frequency Line Filtering
對於 RF 控制線路，則採用了不同的濾波策略。在同軸線路中，我們安裝了 Low-loss Infrared (IR) Filter，其主要功能是阻擋來自較高溫級的紅外光子直接輻射到樣品，以降低對量子態的干擾。該濾波器在有效阻擋紅外輻射的同時，對 DC 至 6 GHz 的工作信號僅有小於 1 dB 的插入損耗。

=== 電流-電壓量測系統 Current-Voltage Measurement System

為了全面性地鑑定元件的電學特性，本研究建立的電流-電壓（current-voltage, I-V）量測系統涵蓋了兩個關鍵階段：
+ 在室溫下對大量元件進行快速的初步篩選。
+ 在極低溫環境中對通過初篩的元件進行高精度的特性量測。

==== 室溫初步特性鑑定 Room-Temperature Pre-Characterization

在此測試組態中，偏壓電流由一台 Keithley 2400 電源量測單元（source measure unit, SMU）提供，該儀器被設定於電壓源模式，其輸出經過一個$qty("100", "kilo ohm")$的串聯電阻轉換為電流源。此電流隨後被路由至待測元件，而元件上的響應電壓則由一台 Basel Precision Instruments Model SP1004 低噪聲差動放大器（differential amplifier）進行放大，並由 Keithley DMM6500 數位萬用表（digital multimeter,DMM）讀取。為了能對晶片上的大量元件進行高效的測試，整個信號的路由與切換由兩台 QDevil 生產的 24 通道 QBox 接線盒進行管理。
此室溫量測主要用於快速篩選出樣品與接觸電極之間和銲墊與連接指之間皆無短路或斷路的元件。此測試結果將作為重新打線與後續低溫量測的初步篩選依據。記錄之I-V特性與低溫量測結果好壞之關係亦將作為爾後新樣品的室溫特性鑑定篩選依據。

==== 極低溫 I-V 特性精細量測 Cryogenic I-V Characterization

低溫下的高精度 I-V 量測，其核心由一套由台夫特理工大學 (Delft University of Technology) 設計與製造、專為低溫量子測量開發的、電池供電的 IVVI-DAC2-rack系統執行。採用電池供電是為了實現與外部儀器電源的電氣隔離 (galvanic isolation)，從根本上消除接地迴路 (ground loops) 和來自電力線的雜訊。

===== 信號路由與儀器配置 Signal Routing and Instrument Configuration
從低溫恆溫器引出的主線纜，其信號首先被轉換至四個 24-pin 的 Fischer 接口面板。實驗時，根據待測元件的位置，我們從中選取兩路 Fischer 插頭，將其連接至兩台 24 通道的 *Matrix-rack* 模組化跳線盤。這個 Matrix-rack 作為連接低溫世界與室溫儀器的中樞，其內部的 MCX 連接器跳線面板允許我們對每一條獨立的信號線進行靈活、精確的配置。對於一組特定的四端點量測，指定的線路通過 MCX-to-LEMO 轉接線，被分別連接至 IVVI-rack 中的功能模組：

- 電流源 (current source):

  負責施加偏壓的線路 ($I^+,I^− "（Ground）"$) 被連接至一個 S4m 電流源模組。該模組的輸出電流量程可手動設置，而其精確的電流大小則由 IVVI-rack 內建的 DAC 進行掃描控制。我們採用此模組的對稱 (symmetric) 輸出模式進行量測。在此模式下，模組同時提供正、負兩路相對於地電位對稱的電壓輸出，其主要優點是能夠最小化樣品上可能出現的共模電壓 (common-mode voltage)，並有效倍增電壓源的輸出擺幅 (output swing)。
- 電壓量測 (voltage measurement):

  負責感測電壓的線路 ($V^+,V^−$) 被連接至一個 M2b 電壓量測模組。此模組是專為實現極低的 $1 / f$ 噪聲而優化的接面場效電晶體（junction gate field-effect transistor,JFET）差動放大器，其輸入電壓噪聲密度在 10 Hz 以上時低至 $qty("2", "") "nV"/sqrt("Hz")$。

經過 M2b 模組放大後，類比電壓信號從機架的隔離環境中被輸出，並最終由一台 Keithley DMM6500 數位萬用表進行高精度數位化及數據記錄。

=== 射頻信號產生器 RF Signal Generator

為了對元件進行射頻下的特性分析，例如夏皮羅階梯（Shapiro steps）量測，本實驗系統整合了一台 Rohde & Schwarz (R&S) SGS100A 射頻信號產生器。該儀器能夠產生頻率範圍從 1 MHz 至 20 GHz 的高穩定度、低相位雜訊的正弦波信號。

信號的輸出功率可在大範圍內進行精密調控。在送入低溫恆溫器之前，RF 信號會經過一系列的同軸衰減器（coaxial attenuators）進行大幅衰減，以確保最終施加於樣品上的功率處於適當的微弱範圍，避免過大的 RF 功率對樣品造成過熱或破壞其超導態。整個 RF 信號路徑的校準與衰減值的計算是確保量測結果準確性的關鍵步驟。

=== 數據擷取框架：QCoDeS Data Acquisition Framework: QCoDeS

本研究的所有實驗控制、儀器協調與數據擷取流程，均基於 QCoDeS (Quantum Code and Data acquisition System) 軟體框架實現。QCoDeS 是一個基於 Python 的開源框架，由哥本哈根/代爾夫特量子計算聯盟等機構開發，旨在為量子計算與凝聚態物理實驗提供一個標準化、模組化的軟體基礎設施。我們選用此框架的核心原因在於其強大的儀器抽象能力與結構化的數據管理模型，這使得複雜的實驗流程得以簡化，並確保了數據的高度可追溯性。

在我們的具體實現中，所有實驗儀器（如 IVVI-rack 模組、信號產生器、數位電錶等）均被分別封裝為 QCoDeS 的 `Instrument` 物件，其可控屬性則對應為 `Parameter`。整個實驗裝置由一個 `Station` 物件進行統一管理，其詳細配置透過 YAML 檔案進行定義與載入，確保了實驗設置的靈活性與可重現性。所有的量測序列，無論是簡單的線性掃描還是複雜的多維掃描，都透過 QCoDeS 的 `Measurement` 上下文管理器執行。在每次量測運行 (`run`) 開始時，系統會自動擷取所有儀器參數的快照 (snapshot)，並與實驗數據一同儲存。

所有實驗數據都被結構化地儲存於一個以 SQLite 為後端的本地數據庫中。每一個 `DataSet` 實例都包含完整的元數據、儀器快照以及量測結果，並被賦予一個全域唯一識別碼 (globally unique identifier,GUID)，極大地增強了數據的可追溯性、完整性與共享便利性。

// == 實驗實現 Experimental Realization
// === 坐標系與磁場定義 Coordinate System and Magnetic Field Definitions
// 在本研究中，我們先定義樣品座標系如下：樣品平面為 $x$–$y$ 平面，
// $x$ 軸沿約瑟夫森接面中的電流傳輸方向（從一側超導電極指向另一側），
// $y$ 軸沿接面寬度方向，$z$ 軸則垂直於樣品平面，由基板指向探針。

// 實驗所使用的三軸向量磁鐵可以在三個互相正交的方向產生磁場分量
// $B_x$, $B_y$, $B_z$，其定義如下：

// - $B_x$：平行於電流方向、位於樣品平面內的磁場分量（沿 $x$ 軸）。
// - $B_y$：垂直於電流方向、位於樣品平面內的磁場分量（沿 $y$ 軸）。
// - $B_z$：垂直於樣品平面的磁場分量（沿 $z$ 軸）。

// 除非另有特別說明，本文中提到的面內（in-plane）磁場係指由
// $(B_x, B_y)$ 組合而成的平面內磁場，而面外（out-of-plane）磁場則專指$B_z$。

// === I-V 特性 I-V Characteristics

// 元件的基礎直流傳輸特性，是透過在恆定溫度且固定外加磁場下，量測其電壓-電流特性曲線來進行鑑定。一條具代表性的 I-V 曲線，是透過緩慢掃描偏壓電流$I_"bias"$並同時記錄元件兩端的電壓降$V$而獲得的。

// 約瑟夫森效應（Josephson Effect）自1962年由布賴恩·約瑟夫森（Brian Josephson）預測以來，已成為超導電子學、量子計算及精密計量學的基石 1。該效應描述了當兩塊超導體被一薄層弱連結（Weak Link，如絕緣體、正常金屬或幾何收縮）隔開時，宏觀量子波函數能夠發生穿隧或耦合的現象。這種耦合導致了超電流（Supercurrent）在無電壓降的情況下流過接面，其大小取決於兩側超導體之間的量子相位差 $phi$。

// 在理想的理論模型中，約瑟夫森接面的電流-相位關係（Current-Phase Relation, CPR）通常被假定為正弦形式 $I_s = I_c sin(phi)$，其中 $I_c$ 為臨界電流（Critical Current），代表了接面所能承載的最大無耗散電流。然而，在實際的實驗操作與測量中，我們所觀測到的並非單一且固定的 $I_c$，而是一個受制於熱漲落、電路阻抗、掃描速率及接面內在動力學特性的動態變量。特別是在欠阻尼（Underdamped）接面中，電流—電壓（Current-Voltage, I-V）特性曲線呈現顯著的遲滯迴圈（Hysteresis Loop），導致系統從超導態（Superconducting State）進入電壓態（Voltage State）的電流閾值——即「切換電流」（switching current），與從電壓態返回超導態的電流閾值——即「重捕電流」（re-trapping current），在數值上並不重合。

// 釐清這些電流參數的操作型定義（Operational Definitions），不僅是基礎物理測量的需求，更是理解非互易傳輸（Non-reciprocal transport）、開發超導整流元件（Superconducting Diodes）以及優化超導量子位元（Qubits）讀取機制的基礎。特別是當系統存在磁場、自旋軌道耦合（Spin-Orbit Coupling, SOC）或磁性雜質時，正向與負向偏壓下的電流閾值可能不再對稱，這使得嚴格區分正負方向的切換與重捕電流變得尤為重要。

// 本章將從微觀理論模型出發，逐步推導這些電流參數的物理起源，並詳細闡述在實驗上如何通過特定的掃描協定來定義與測量 $I_"sw"^+, I_"sw"^-, I_r^+, I_r^-$。我們將特別關注偏壓電流方向對這些參數的影響，以及它們在絕對值上的對稱或不對稱關係，這些關係直接揭示了系統的時間反演對稱性（Time-Reversal Symmetry, TRS）的破缺情況。



// === 夫朗和斐干涉圖樣 Fraunhofer Interference Patterns

// 為了進一步探測接面內部超導電流的空間分佈特性，我們量測其臨界電流 $I_c$ 對外加磁場的依賴關係。實驗中，我們利用三軸向量磁鐵施加一個沿樣品法向（$z$ 軸）的磁場 $B_z$，並在每一個固定的磁場值下，量測其 I–V 特性曲線。藉由將接面從超導態驅動至電阻態所對應的切換電流 $I_"sw"$，我們將其視為該磁場下的臨界電流，即 $I_c(B_z) = I_"sw"(B_z)$。

// 量測結果清楚顯示臨界電流隨 $B_z$ 變化的干涉圖樣。在零磁場 ($B_z = 0$) 時，臨界電流達到最大值 $I_(c,0)$；隨著 $|B_z|$ 的增加，$I_c(B_z)$ 呈現近似週期性的振盪，並在特定磁場值處壓低至接近零。整體包絡線與光學中的單狹縫夫朗和斐繞射 (Fraunhofer diffraction) 圖樣高度相似，因此我們將此 $I_c$–$B_z$ 依賴稱為*夫朗和斐干涉圖樣*。

// 在理想的、超導電流沿接面寬度方向均勻分佈的短接面模型中，臨界電流與穿過接面有效面積 $A_("eff")$ 的磁通量 $Phi$ 之間的關係可寫成
// $ I_c (B_z) = I_(c,0) abs((sin(pi Phi/Phi_0)) / (pi Phi/Phi_0)), $
// 其中 $Phi = B_z dot A_("eff")$ 為穿越接面的磁通量，而 $Phi_0 = h/(2e)$ 為超導磁通量量子。此關係式預測，當 $Phi = n Phi_0$（$n$ 為非零整數）時，$I_c$ 會出現一系列極小值，其間距直接反映出 $A_("eff")$ 的大小。

// 從實驗數據中，我們觀察到第一個極小值出現在約 $B_z approx 5$ mT 的磁場處。更重要的是，整個干涉圖樣呈現高度的左右對稱性，且在極小值處臨界電流被明顯抑制。這些特徵強烈指向一個結論：本研究中製備的約瑟夫森接面具有相當*均勻的超導電流密度分佈*。進一步地，我們可以利用第一個極小值位置 $B_("min",1)$，透過
// $ A_("eff") = Phi_0 / B_("min",1) $
// 來反推出接面的有效磁學面積，並與其幾何設計尺寸作定量比較。


// 第四章：實驗結果
= 實驗結果 Experimental Results<chapter-results>

本章呈現基於 1T-#ce[PtTe2] 的超導量子干涉儀的核心實驗結果。我們將系統性地展示元件的基礎電學特性、夫朗和斐干涉圖樣的磁場響應，以及從非對稱 SQUID 量測中重構出的電流-相位關係。這些結果不僅驗證了 #ce[PtTe2] 中存在非傳統的超導行為，更展示了利用外部磁通量對其進行主動調控的可行性。

== 四大電流參數的詳盡操作型定義 Detailed Operational Definitions of the Four Current Parameters <subsection-iv-characteristics>

基於上述物理圖像，並結合實驗測量中的掃描程序，我們以下對四個關鍵電流參數進行嚴格的操作型定義。這些定義不僅描述了物理現象，還規範了測量條件。

- 正向切換電流 (positive switching current, $I_"sw"^+$)
在電流控制模式下，當偏壓電流 $I_"bias"$ 從零開始向正方向（$I_"bias" > 0$）單調增加（即絕對值增加）時，接面從零電壓態（超導態）突變至有限電壓態（電阻態）瞬間所記錄到的電流值。

- 負向切換電流 (negative switching current, $I_"sw"^-$)

在電流控制模式下，當偏壓電流 $I_"bias"$ 從零開始向負方向（$I_"bias" < 0$）單調減少（即絕對值增加）時，接面從超導態突變至有限負電壓態瞬間所記錄到的電流值。為了方便與 $I_"sw"^+$ 比較，文獻常取其絕對值 $|I_"sw"^-|$ 進行討論。

- 正向重捕電流 (positive re-trapping current, $I_r^+$)

當接面處於正向電壓態（$V > 0, I_"bias" > 0$）時，將偏壓電流從高值逐漸降低，直到接面重新回到超導態（$V=0$）或進入低電壓擴散分支瞬間所對應的電流值。

- 負向重捕電流 (negative re-trapping current, $I_r^-$)

當接面處於負向電壓態（$V < 0, I_"bias" < 0$）時，將偏壓電流絕對值逐漸降低（即 $I_"bias"$ 從負值向零增加），直到接面重新回到超導態（$V=0$）瞬間所對應的電流值。

== 基礎溫度下的 I-V 特性 I-V Characteristics at Base Temperature <subsection-iv-characteristics-base>

為了鑑定元件的基本直流 (DC) 輸運特性，我們在極低溫環境（恆定溫度 $T = 40 "mK"$）下量測了其電流-電壓 ($I$-$V$) 特性曲線。該數據是透過對偏壓電流 ($I_"bias"$) 進行連續掃描並同步紀錄接面兩端電壓降 ($V$) 所獲得。
#figure(
  image("Images/Fig13-019-1-IV.svg", width: 100%),
  caption: [樣品019-1之 I-V 特性曲線],
) <fig13-019-1-iv>
@fig13-019-1-iv 中清晰地顯示了零電壓的超導區域、急劇的電阻性切換（正向切換電流 $I_"sw"^+ approx 36.5 "µA"$）以及顯著的遲滯行為（負向重捕電流 $I_r^- approx 2 "µA"$），反映了該接面處於欠阻尼狀態，使用正常電阻區域數據線性擬合得出正常電阻 $R_N$ 約為 $0.67 Omega$。


#figure(
  image("Images/iv_dvdi_comparison_354_408.svg", width: 80%),
  caption: [樣品003-2之正負向切換電流 I-V 特性曲線],
) <fig-iv-dvdi-comparison>
@fig-iv-dvdi-comparison 是由正負偏壓量測拼接而成的正負向切換電流 I-V 特性曲線。正向切換電流 $I_s^+ approx 27 "µA"$，負向切換電流 $I_s^- approx -33.5 "µA"$， $Delta I_s approx -6.5 "µA"$，$eta approx 10.7%$。雖出現 $I_s^+ != abs(I_s^-)$，但此為SQUID樣品003-2的參考接面及目標接面並聯的結果。可能因熱擾動或接面間的微小相位差異所導致，無法直接斷定為約瑟夫森二極體效應。需由之後的電流電壓磁場掃描測量來驗證。


#figure(
  image("Images/run_33_expert_vis.svg", width: 100%, fit: "stretch"),
  caption: [
    #ce[PtTe2] 約瑟夫森接面的直流傳輸特性與多重安德烈夫反射 (MAR)。
  ],
) <fig-MAR>

@fig-MAR (a) 我們在基溫 ($T approx 40 "mK"$) 下量測了接面的直流傳輸特性。接面展現出清晰的超電流分支，其切換電流 $I_c approx 24 mu "A"$。在高偏壓處觀察到的過剩電流 ($I_"exc"$) 顯示該接面具有中等透明度的介面特性，與後續的定量分析一致。

@fig-MAR (b) 展示了微分電阻 ($dv(V, I)$) 隨電壓 $V$ 的變化。頻譜中顯著的電阻谷位置與多重安德烈夫反射 (MAR) 的理論公式 $V_n = 2 Delta slash n e$ 高度吻合 ($n = 1, 2, 3$)，由此確立了超導能隙 $Delta approx 0.97 "meV"$。為了定量分析介面特性，我們採用 Octavio-Tinkham-Blonder-Klapwijk (OBTK) 模型對高偏壓數據進行擬合。分析結果顯示介面阻抗參數 $Z approx 0.76$，對應之平均穿透率 $tau approx 0.63$。此高透明度意味著限制超電流的主要因素並非介面阻障，而是 #ce[PtTe2] 通道內部的擴散散射過程。@blonder_transition_1982@octavio_subharmonic_1983@flensberg_subharmonic_1988@niebler_analytical_2009

值得注意的是，量測所得的 $I_c R_n$ 積約為 $0.70 "mV"$，顯著低於短彈道接面 (Short ballistic junction) 的理論極限 ($I_c R_n approx pi Delta slash 2 e approx 1.52 "mV"$)。為了釐清物理機制，我們檢視了元件的特徵長度。給定接面長度 $L = 260 "nm"$，利用長接面理論公式 $e I_c R_n approx 10.82 E_"Th"$ @dubos_josephson_2001，我們提取出的 Thouless 能為 $E_"Th" approx 65 mu "eV"$。由此推算的擴散係數 $D = E_"Th" L^2 slash planck approx 0.0067 "m"^2 slash "s"$。在費米速度 $v_F approx 0.65 times 10^6 "m/s"$ 的估算下，對應之平均自由徑 $l_e = 3 D slash v_F approx 31 "nm"$。這表明 $L slash l_e approx 8.4$，確認元件運作於明確的擴散區間 ($L >> l_e$)。此外，擴散相干長度 $xi_"diff" = sqrt(planck D slash Delta) approx 67 "nm"$，使得 $L slash xi_"diff" approx 4$。這證實了我們的 #ce[PtTe2] 接面屬於「長擴散約瑟夫森接面」，其超電流受限於電子穿越接面的擴散時間而非超導能隙。

在高於超導能隙 ($e V > 2 Delta$) 的偏壓區間，微分電阻並未如 BCS 理論預期飽和至恆定值，而是呈現隨電壓單調上升的趨勢。此現象主要歸因於接面處焦耳熱 (Joule Heating) 累積導致的電子溫度升高。在極低溫環境下，電子-聲子耦合極弱，導致熱電子能量難以耗散。此外，串聯濾波電阻在高電流下產生的額外熱量也可能透過基板傳導影響接面溫度。

== 座標系定義與轉換 Coordinate System Definition and Transformation <section-coordinate-system>

為了精確描述外部磁場與樣品超導特性的關係，我們必須建立實驗室座標系 (Lab Frame) 與樣品座標系 (Sample Frame) 之間的轉換關係。這對於分析非對稱 SQUID 的夫朗和斐干涉圖樣以及電流-相位關係 (CPR) 至關重要。

=== 實驗室與樣品座標系定義 Definition of Lab Frame and Sample Frame <subsection-frames-definition>

+ *實驗室座標系 (lab frame)*：$(X, Y, Z)$

  $X, Y, Z$ 軸由固定於低溫量測系統的由三維向量磁鐵的磁場指向定義。
  - $X$ 軸沿水平方向指向右。
  - $Y$ 軸沿水平方向且垂直於 $X$ 軸指向外側。
  - $Z$ 軸垂直於 $X$ 軸且指向上方軸則與 $X, Y$ 軸共同形成右手座標系。
  - 磁場大小表示為$B_"lab" = (B_x, B_y, B_z)$

+ *樣品座標系 (sample frame)*：$(X', Y', Z')$

  $X', Y', Z'$ 軸由樣品本身的幾何與樣品接面電流方向定義。
  - $X'$ 軸(Longitudinal)：沿樣品長軸方向，即樣品接面內超導電流 $I$ 的流動方向。
  - $Y'$ 軸(Transverse)：沿樣品寬度方向，位於樣品平面內且垂直於電流。
  - $Z'$ 軸(Normal)：垂直於樣品平面的法向量方向。
  - 磁場大小表示為$B_"sample" = (B_(x'), B_(y'), B_(z'))$

=== 幾何配置與旋轉角定義 Definition of Geometric Configuration and Rotation Angle<subsection-transformation-logic>

在本實驗中，樣品被水平放置於實驗室的 $X-Z$ 平面內，因此樣品平面（$X'-Y'$ 平面）與實驗室 $X-Z$ 平面共面，而樣品法向量 $Z'$ 軸平行於實驗室 $Y$ 軸。

由於樣品在平面內的放置角度並非總是與實驗室主軸對齊，因此引入旋轉角 $alpha$ 以描述平面內的偏轉。

定義旋轉角 $alpha$ 為：在實驗室 $X-Z$ 平面中，從實驗室 $+X$ 軸逆時針旋轉至樣品電流方向（$X'$ 軸）的角度。
=== 基底向量與旋轉矩陣 Base Vector and Rotation Matrix <subsection-rotation-matrix>

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
=== 磁場分量轉換 Field Component Transformation <subsection-field-component-transform>

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
  image("Images/coordinate_transform_diagram.png", width: 60%),
  caption: [
    實驗室座標系與樣品座標系之幾何關係。
  ],
) <fig-coordinate-system>
@fig-coordinate-system 描述了實驗室座標系 $(X, Y, Z)$ 與樣品座標系 $(X', Y', Z')$ 之間的幾何關係。樣品平面（粉色矩形）位於 $X$-$Z$ 平面內，電流方向 $X'$ 與 $X$ 軸夾角為 $alpha$。


=== 實例說明：Sample 003-2 Example of Sample 003-2 <subsection-example-003-2>

以本章主要分析的樣品 *Sample 003-2* 為例，其安裝角度經校準為 $alpha = 121.3^degree$。這意味著樣品的電流方向與實驗室 $X$ 軸與 $Z$ 軸之間存在特定的幾何關係，而非單純的平行或垂直。

當我們在實驗室座標系中施加一個磁場向量 $(B_x, B_y, B_z)$ 時，其實際作用於樣品的效果必須透過上述轉換關係進行解析。例如，若僅施加實驗室 $X$ 方向的磁場，在樣品座標系中將同時產生沿電流方向（$B_(x')$）與垂直電流方向（$B_(y')$）的分量，從而對夫朗和斐干涉圖樣與電流相位關係產生複合影響。此一精確的座標轉換對於正確解讀後續章節中的各向異性磁場響應至關重要。

#figure(
  image("Images/coordinate_system_schematic_003_2.png", width: 60%),
  caption: [
    Sample 003-2 的座標系配置示意圖。。
  ],
) <fig-coordinate-system-003-2>
@fig-coordinate-system-003-2 樣品位於實驗室 $X-Z$ 平面，逆時針旋轉角度 $alpha = 121.3^degree$。綠色矩形代表樣品，藍色箭頭指示沿長軸的電流方向（$x'$ axis）。

== 夫朗和斐干涉圖樣 Fraunhofer Interference Patterns <subsection-standard-fraunhofer>
=== 無面內磁場下的夫朗和斐干涉圖樣 Fraunhofer Interference Patterns with no In-Plane Magnetic Field
為了探測接面內部超導電流的空間分佈特性，我們量測了切換電流 $I_s$ 作為面外磁場 ($B'_z'$) 函數的調變行為。@fig-fraunhofer-heatmap 展示了原始的電壓-電流-磁場 (V-I-B) 掃描熱圖，其中深色區域代表零電阻的超導態。接著，我們從中提取出切換電流 $I_s$，如 @fig-fraunhofer-standard 所示。這構成了在沒有面內磁場 ($B_"in-plane" = 0$) 時的類夫朗和斐干涉圖樣。

#figure(
  image("Images/Thesis_Fig_Fraunhofer_Heatmap.png", width: 90%),
  caption: [夫朗和斐干涉圖樣的原始量測數據熱圖 ($V$ vs $I, B'_z$)。],
) <fig-fraunhofer-heatmap>
@fig-fraunhofer-heatmap 由003-2樣品的正偏壓（Run #354）與負偏壓（Run #408） 數據合成，展示了清晰的超導區間(白色區域)隨磁場的調變。
#figure(
  image("Images/Ic_Norm_354_408.png", width: 80%),
  caption: [正規化切換電流 ($I_s$) 隨面外磁場 ($B'_z$) 的變化。],
) <fig-fraunhofer-standard>
從原始數據中提取的切換電流 ($I_"sw"$) 隨面外磁場 ($B'_z'$) 的變化，已對 Run #354 最大值進行正規化。灰色垂直虛線標示偏移中心與第一個週期節點，水平箭頭指示週期 $B_"period" approx 2.15 "mT"$。
類夫朗和斐干涉圖樣 ($B_"in-plane" = 0$)。臨界電流隨面外磁場 ($B'_z$) 的變化呈現出類 $|sin(π Φ/Φ_0) / (π Φ/Φ_0)|$ 的形式。

實驗結果顯示在面外磁場$B'_z'$約為 -0.25 mT 時，切換電流達到最大值 $I_"sw"^"max"$，第一個極小值節點出現在面外磁場$B'_z'$約為 1.9 mT 處，但有顯著的節點抬升現象，整個干涉圖樣呈現高度的左右對稱性，且正向切換電流 $I_"sw"^+$ 與負向切換電流絕對值 $|I_"sw"^-|$ 的行為幾乎完全重合。

這些特徵表明接面具有均勻的超導電流密度分佈。根據第一個節點的位置，我們可以估算出樣品接面的有效磁學面積：
$
  A_"eff" = Φ_0 / B_"period" ≈ 2.07 × 10^(-15) / (2.15 × 10^(-3)) ≈ 9.63 × 10^(-13) "m"^2 = 0.963 "μm"^2
$
這與由光學顯微鏡測量及AutoCAD軟體計算的樣品接面的幾何面積0.8502675 $"μm"^2$相當。

// #figure(
//   image("Images/Ic_Flux_Norm_354_408.png", width: 80%),
//   caption: [
//     標準夫朗和斐干涉圖樣的正規化版本。左側圖顯示臨界電流隨正規化磁通量 ($Phi/Phi_0$) 的變化，其中 $Phi/Phi_0 = (B_z' - B_"offset") / B_"period"$。$I_c$ 已除以 $I_c^+$ 的最大值進行正規化。正向臨界電流 $I_c^+$ 與負向臨界電流絕對值 $|I_c^-|$ 在零場附近的行為顯示出高度的一致性。黑色虛線代表標準夫朗和斐理論曲線 $I_c ~ |"sinc"(pi Phi/Phi_0)|$。
//   ],
// ) <fig-fraunhofer-normalized>

=== 夫朗和斐干涉圖樣隨面內磁場角度的演化 Evolution of the Fraunhofer Interference Pattern with the In-Plane Magnetic-Field Angle <subsection-fraunhofer-angle-evolution>
當施加固定面內磁場 ($B_"In-Plane"$) 時，夫朗和斐干涉圖樣隨面內磁場角度發生顯著變化。
#figure(
  image("Images/Fig21-003-2-30mT-fraunhofer-angle.svg", width: 87%),
  caption: [
    樣品003-2夫朗和斐干涉圖樣隨面內磁場角度的演化。
  ],
) <fig-fraunhofer-angle-evolution>

@fig-fraunhofer-angle-evolution 展示了樣品003-2在面內磁場$B_"In-Plane"$固定在 $30 "mT"$ 時，夫朗和斐干涉圖樣在不同角度 $theta$ 值下的干涉圖樣演化，隨著 $theta$ 的增加，原本對稱的干涉圖樣逐漸變得不對稱，對稱軸位置發生偏移，包絡函數形狀也隨之改變。


#figure(
  image("Images/Fig22-003-2-30mT-fraunhofer-angle-heatmap.svg", width: 100%),
  caption: [樣品003-2夫朗和斐干涉圖樣隨面內磁場角度的演化],
) <fig-fraunhofer-evolution-heatmap>
@fig-fraunhofer-evolution-heatmap 樣品003-2在面內磁場$B_"In-Plane"$固定在 $60 "mT"$ 時，夫朗和斐干涉圖樣隨角度 $theta$ 的演化熱圖。圖中呈現的中央包絡峰值位置偏移$2pi$週期特性應為磁場座標與樣品並未完全正交與共原點所造成，並非樣品內秉之特性所造成，然而中央包絡峰值大小則明顯與面內磁場角度有關。

=== 夫朗和斐干涉圖樣隨面內磁場強度的演化 Evolution of the Fraunhofer Interference Pattern with the In-Plane Magnetic-Field Magnitude <subsection-fraunhofer-field-evolution>
當施加固定角度的面內磁場 ($B_"In-Plane"$) 時，夫朗和斐干涉圖樣隨面內磁場強度發生顯著變化。

#figure(
  image("Images/Fig23-003-2-27-fraunhofer-magnitude.svg", width: 100%),
  caption: [樣品003-2之夫朗和斐干涉圖樣隨磁場強度的演化（$theta=27.4 degree$）。],
) <fig-27-fraunhofer-magnitude>
@fig-27-fraunhofer-magnitude 樣品003-2在面內磁場角度$theta$固定在 $27.4 degree$ 時，夫朗和斐干涉圖樣隨磁場強度$B_"In-Plane"$的演化。

#figure(
  image("Images/Fig24-003-2-27-fraunhofer-magnitude-heatmap.svg", width: 100%),
  caption: [樣品003-2之夫朗和斐干涉圖樣隨磁場強度的演化熱圖（$theta=27.4 degree$）],
) <fig-27-fraunhofer-magnitude-heatmap>
@fig-27-fraunhofer-magnitude-heatmap 樣品003-2在面內磁場角度$theta$固定在 $27.4 degree$ 時，夫朗和斐干涉圖樣隨磁場強度$B_"In-Plane"$的演化熱圖。

#figure(
  image("Images/Fig25-003-2-297-fraunhofer-magnitude.svg", width: 100%),
  caption: [樣品003-2之夫朗和斐干涉圖樣隨磁場強度的演化（$theta=297.4 degree$）],
) <fig-297-fraunhofer-magnitude>
@fig-297-fraunhofer-magnitude 樣品003-2在面內磁場角度$theta$固定在 $297.4 degree$ 時，夫朗和斐干涉圖樣隨磁場強度$B_"In-Plane"$的演化。

#figure(
  image("Images/Fig26-003-2-297-fraunhofer-magnitude-heatmap.svg", width: 100%),
  caption: [樣品003-2之夫朗和斐干涉圖樣隨磁場強度的演化熱圖（$theta=297.4 degree$）],
) <fig-297-fraunhofer-magnitude-heatmap>
@fig-297-fraunhofer-magnitude-heatmap 樣品003-2在面內磁場角度$theta$固定在 $297.4 degree$ 時，夫朗和斐干涉圖樣隨磁場強度$B_"In-Plane"$的演化熱圖。


// #figure(
//   grid(
//     columns: (1fr,) * 2,
//     image("Images/003-2_30mT_IVB_raw_data.svg"), image("Images/003-2_60mT_IVB_raw_data.svg"),
//     image("Images/003-3_60mT_IVB_raw_data.svg"), image("Images/005-1_30mT_IVB_raw_data.svg"),
//     image("Images/005-1_60mT_IVB_raw_data.svg"), image("Images/005-2_60mT_IVB_raw_data.svg"),
//   ),
//   caption: [面內磁場下夫朗和斐干涉圖樣的演化 / Evolution of the Fraunhofer pattern under in-plane magnetic field],
// ) <fig-fraunhofer-evolution2>

// #figure(
//   grid(
//     columns: (1fr,) * 2,
//     image("Images/003-2_Finite_Perpendicular_IVB_raw_data.svg"), image("Images/003-2_Finite_Parallel_IVB_raw_data.svg"),
//   ),
//   caption: [垂直/平行電流方向磁場下夫朗和斐干涉圖樣的演化],
// ) <fig-fraunhofer-perpendicular-parallel>

// #figure(
//   grid(
//     columns: (1fr,) * 2,
//     image("Images/003-2_Finite_Perpendicular_IVB_raw_heatmap.svg"),
//     image("Images/003-2_Finite_Parallel_IVB_raw_heatmap.svg"),
//   ),
//   caption: [垂直/平行電流方向磁場下夫朗和斐干涉圖樣的演化熱圖],
// ) <fig-fraunhofer-perpendicular-parallel-heatmap>


主要觀察結果包括：

1. *圖樣不對稱性增加*：隨著 $B_"In-Plane"$ 的增加，原本高度對稱的夫朗和斐干涉圖樣逐漸變得不對對稱

2. *極小值位置偏移*：干涉圖樣的極小值不再出現在對稱的磁場位置，而是向正或負磁場方向偏移

3. *包絡函數調變*：整體包絡函數的形狀發生變化，不再嚴格遵循 $sinc$ 函數

4. *振幅調變*：不同極小值的深度出現差異，破壞了原有的週期性

這些變化強烈暗示平面內磁場改變了 #ce[PtTe2] 接面的電流-相位關係，可能產生時間反演對稱性破缺。

== 電流-相位關係分析 Current-Phase Relation Analysis <section-cpr-analysis>

=== CPR 模型選擇：諧波展開與透明度模型之比較 CPR Model Selection: Harmonic-Expansion and Transparency-Based Approaches <subsection-cpr-model-selection>

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
  image("Images/CPR_Harmonics_vs_Tau.png", width: 70%),
  caption: [
    二階與三階諧波分量隨透明度 $tau$ 的變化。為了產生 $I_2/I_1 = 0.25$ 的二階分量，透明度必須高達 $tau approx 0.90$。
  ],
) <fig-cpr-harmonics-tau>

2. *時間反演對稱性的破缺*：標準的Kulik-Omelyanchuk模型通常假設時間反演對稱性，導致 $I_c^+ = |I_c^-|$（如 @fig-cpr-diode-comparison 綠色曲線所示）。然而，我們的實驗數據顯示明顯的時間反演對稱性的破缺 ($I_c^+ eq.not |I_c^-|$)。為了描述這種時間反演對稱性的破缺，必須引入高階諧波的相位偏移 $delta$。然而標準的Kulik-Omelyanchuk模型隱含對高階諧波的相位偏移 $delta$ 的限制，$delta$必須固定於0。反而簡單的諧波展開模型多了這種自由度（如 @fig-cpr-diode-comparison 紫色曲線所示），能夠靈活地描述此系統。

#figure(
  image("Images/CPR_Diode_Comparison.png", width: 70%),
  caption: [
    透明度模型與諧波模型的比較。
  ],
) <fig-cpr-diode-comparison>
標準Kulik-Omelyanchuk模型 (綠線) 雖然能產生偏斜的波形，但仍保持 $I_c^+ = |I_c^-|$ 的對稱性。含有相位偏移的諧波模型 (紫線) 則能自然描述 $I_c^+ != |I_c^-|$ 的約瑟夫森二極體效應。
基於上述理由，採用包含相位自由度的諧波展開模型，是對本系統非傳統超導電流特性的更合適描述。


#figure(
  image("Images/KO-1_cpr_fit_127.svg", width: 80%),
  caption: [使用Kulik-Omelyanchuk模型擬合典型 #ce[PtTe2] 約瑟夫森接面的電流相位關係特性曲線],
) <fig-OK-1-cpr-fit>
使用Kulik-Omelyanchuk模型擬合典型 #ce[PtTe2] 約瑟夫森接面的電流相位關係特性曲線。

在無面內磁場時，使用Kulik-Omelyanchuk模型擬合典型 #ce[PtTe2] 約瑟夫森接面的電流相位關係特性曲線。得出介面透明度為 $tau approx 0.6$，屬於中高透明度接面。

#figure(
  image("Images/delta_cpr_fit_127.svg", width: 80%),
  caption: [使用二階諧波相位差可調模型擬合典型 #ce[PtTe2] 約瑟夫森接面的電流相位關係特性曲線],
) <fig-delta-cpr-fit>
使用二階諧波相位差可調模型擬合典型 #ce[PtTe2] 約瑟夫森接面的電流相位關係特性曲線。

#figure(
  image("Images/cpr_fit_508.svg", width: 80%),
  caption: [樣品003-2在面內磁場強度為$180 "mT"$，角度為$297.4 degree$的二階諧波相位差可調模型擬合結果],
) <fig-cpr-fit-508>
@fig-cpr-fit-508 顯示在高面內磁場強度時，二階諧波相位差可調模型能夠很好地擬合實驗數據且二階諧波分量顯著。


=== $I_c R_N$ 乘積估算 $I_c R_N$ Product Estimation <subsection-icrn-product>

$I_c R_N$ 乘積是表徵約瑟夫森接面品質的重要參數，它反映了接面的超導能隙與傳輸特性。@tab-icrn-statistics 總結了多個元件的 $I_c R_N$ 乘積統計資料。

#figure(
  include "chapters/generated_icrn_table.typ",
  caption: [
    多個 #ce[PtTe2] 約瑟夫森接面的 $I_c R_N$ 乘積統計
  ],
) <tab-icrn-statistics>

// 樣品003-2之 $I_c R_N$ 乘積結果為：
// - 切換電流：$I_c^"(1)" approx 3.935$ µA
// - 正常態電阻：$R_N approx 1.848$ Ω
// - $I_c^"(1)" R_N$ 乘積：$approx 7.272$ µV

// 雖然此數值低於理論極限，但表 @tab-icrn-statistics 顯示其他樣品（如 Sample 004-2）可達 $1.2$ mV，表明 $I_c R_N$ 乘積受製程變異影響較大。整體而言，數值範圍與其他 #ce[PtTe2] 相關研究一致。
// 這個數值與典型的金屬約瑟夫森接面相比較低，但與其他拓撲材料基礎的接面相當，反映了 #ce[PtTe2] 作為弱連結材料的特性以及可能存在的近接效應影響。

// 根據 Ambegaokar-Baratoff 關係，理論預期的 $I_c R_N$ 乘積應為：
// $ I_c R_N = (π Δ)/(2e) tanh(Δ/(2k_B T)) $

// 其中 $Δ$ 為超導能隙。在 $T ≪ T_c$ 的極限下，對於 $T_c ≈ 2.7$ K 的 #ce[PtTe2]，理論預期約為 0.4 mV。觀測到的較高數值可能反映了接面的多重安德烈夫反射過程或非傳統的配對機制。


// #figure(
//   include "chapters/generated_properties_table.typ",
//   caption: [
//     NbTi 與 #ce[PtTe2] 物性參數表。
//   ],
// ) <tab-properties>

==== 環路電感與自我屏蔽效應評估 Self-Screening Effect Evaluation <subsection-self-screening>
為了驗證模型的適用性，我們估算了 SQUID 環路的幾何電感 $L$。對於面積約 $250 "µm"^2$ 的環路，幾何電感估計為 $L approx 3$ pH。考量最大臨界電流 $I_c^"max" approx 100$ µA，計算出的屏蔽參數 $beta_L = 2 pi L I_c / Phi_0 approx 0.001$。由於 $beta_L lt lt 1$，自我屏蔽效應可以忽略，這證實了我們採用顯式 CPR 模型 ($I_s(phi)$) 而忽略迴路電感影響的合理性。

// === 非傳統 CPR特徵 <subsection-unconventional-cpr>

// 透過分析非對稱 SQUID 的磁通量調變行為，我們可以重構出 #ce[PtTe2] 接面的電流-相位關係 (CPR)。@fig-cpr-reconstruction 展示了重構出的 CPR 與傳統正弦 CPR 的比較。

// #figure(
//   image("Images/Thesis_Fig_CPR_Harmonics.png", width: 90%),
//   caption: [
//     重構的 #ce[PtTe2] 接面電流-相位關係 (Sample 005-1, Run 170)。實驗數據與擬合結果顯示了顯著的非純正弦特徵。
//   ],
// ) <fig-cpr-reconstruction>

// #figure(
//   grid(
//     columns: (1fr, 1fr),
//     rows: (auto, auto),
//     gutter: 1em,
//     image("Images/CPR_Sweep_003-2_Run511.png"), image("Images/CPR_Sweep_003-3_Run269.png"),
//     image("Images/CPR_Sweep_005-1_Run170.png"), image("Images/CPR_Sweep_005-2_Run230.png"),
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
//     image("Images/003-2_CPR_30mT_summary_report.svg"),
//     image("Images/003-2_CPR_60mT_summary_report.svg"),
//     image("Images/003-3_CPR_60mT_summary_report.svg"),

//     image("Images/005-1_CPR_30mT_summary_report.svg"),
//     image("Images/005-1_CPR_60mT_summary_report.svg"),
//     image("Images/005-2_CPR_60mT_summary_report.svg"),
//   ),
//   caption: [面內磁場下CPR的演化 / Evolution of the CPR under in-plane magnetic field],
// ) <fig-CPR-evolution2>


// // 重構的 CPR 可以用以下形式表示：
// // $ I_s(φ) = I_1 sin(φ + φ_1) + I_2 sin(2φ + φ_2) $

// 其中：
// - $I_1$：一階諧波振幅
// - $I_2$：二階諧波振幅
// - $φ_1, φ_2$：相應的相位偏移
// #include "chapters/gen_cpr_table.typ"
// @tab-cpr-parameters-gen 總結了在不同磁場條件下提取的 CPR 參數：



// #figure(
//   image("Images/Thesis_Fig_I2I1_Evolution.png", width: 80%),
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

// 這些非傳統 CPR 特徵可以歸因於 #ce[PtTe2] 的拓撲表面態。在狄拉克半金屬中，螺旋自旋-動量鎖定的表面態能夠促進高階安德烈夫反射過程，從而產生高次諧波超電流分量。面內磁場透過調控自旋軌道耦合強度，進一步增強了這些非傳統效應。我們在擬合過程中提取的參數誤差（如 $delta I_1, delta I_2$）均小於擬合值的 5%，證實了特徵的穩健性。

// === 角度依賴的約瑟夫森二極體效應 <subsection-angle-jde>
// 為了進一步探究二極體效應的幾何依賴性，我們測量了二極體效率 $eta$ 隨面內磁場角度 $theta$ 的變化。

// #figure(
//   grid(
//     columns: (1fr, 1fr),
//     image("Images/005-1_JDE_Angle.png", width: 95%), image("Images/005-1_Ic_Angle.png", width: 95%),
//   ),
//   caption: [Sample 005-1 的角度解析二極體效應。(左) 二極體效率 $eta$ 隨面內角度的變化，顯示出明顯的振盪行為。(右) 對應的正負臨界電流隨角度的變化。],
// ) <fig-angle-jde>

// 如 @fig-angle-jde 所示，二極體效率展現出與角度強烈相關的週期性變化，這與理論預期的自旋-軌道耦合各向異性相符。特定角度下的效率最大化暗示了拓撲表面態自旋織構的具體對稱性。

=== CPR 參數隨面內磁場的各向異性演化 Angular anisotropy in the in-plane-field dependence of the CPR parameters <subsection-cpr-evolution-003-2>
為了探究不同晶體方向上的磁場響應差異，我們針對 Sample 003-2 在兩個特定角度 ($theta = 27.4^degree$ @fig-cpr-fit-parameters-evolution-27 與 $297.4^degree$ @fig-cpr-fit-parameters-evolution-297) 進行了細緻的磁場掃描。

// #figure(
//   grid(
//     columns: (1fr, 1fr),
//     rows: (auto, auto, auto),
//     gutter: 1em,
//     image("Images/Ic_vs_Field.png"), image("Images/Ratio_vs_Field.png"),
//     image("Images/I1_vs_Field.png"), image("Images/I2_vs_Field.png"),
//     grid.cell(colspan: 2, image("Images/Delta_vs_Field.png", width: 60%)),
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
  image("Images/CPR_evolution_27_log_offset_corrected.svg", width: 100%),
  caption: [樣品003-2之電流相位關係隨磁場強度的演化（$theta=27.4 degree$）。],
) <fig-cpr-fit-parameters-evolution-27>

#figure(
  image("Images/CPR_evolution_297_log_offset_corrected.svg", width: 100%),
  caption: [樣品003-2之電流相位關係隨磁場強度的演化（$theta=297.4 degree$）。],
) <fig-cpr-fit-parameters-evolution-297>



// #figure(
//   grid(
//     columns: (1fr, 1fr),
//     image("Images/CPR_evolution_27_log_offset_corrected.svg", width: 95%),
//     image("Images/CPR_evolution_297_log_offset_corrected.svg", width: 95%),
//   ),
//   caption: [樣品003-2 在特定角度$theta$下的參數演化 ($27.4^degree$ vs $297.4^degree$)。(左) $theta = 27.4^degree$。(右) $theta = 297.4^degree$。],
// ) <fig-angle-cpr-evolution>


#figure(
  image("Images/compare_combined copy.svg", width: 100%),
  caption: [
    CPR擬合參數隨面內磁場的演化。
  ],
) <fig-cpr-fit-parameters-evolution>

@fig-cpr-fit-parameters-evolution 展示了關鍵數參 ($I_c^"Ref", I_c^"(1)", I_c^"(2)", I_c^"(2)"/I_c^"(1)", delta, chi^2$) 隨面內磁場強度的演化。從擬合參數的演化可以觀察到參考接面臨界電流 $I_"c,ref"$、$I_"c1"$、$I_"c2"$ 在不同夾角$theta$下的面內場$B_"In-Plane"$作用下的下降趨勢有別，因此可能需要考慮參考介面的面內磁場作用，所以此參數演化統計的可靠性值得商榷，但依然可以從中提取出一些有用的物理現象。在低面內場時，$I_c^"(2)"/I_c^"(1)"$ 與 $delta$ 的數值較低，擬合誤差也較大，需要提升量測精度，以獲得更準確的結果。然而在高面內場時，$I_c^"(2)"/I_c^"(1)"$ 與 $delta$ 的數值較高，擬合誤差也較小，二階諧波相位可調模型可以很好地描述現象，但固定夾角$theta$時的面內場$B_"In-Plane"$強度與$I_c^"(2)"/I_c^"(1)"$ 和 $delta$ 的關係並非簡單的線性關係，這可能暗示了更複雜的物理現象，並非完全如 @sivakumar_long-range_2024 所述使用Rashba效應與SOC效應造成的自旋-動量耦合現象即可描述，因此樣品目標接面長度更長，面內場$B_"In-Plane"$更強，需要考慮更多因素。

// === 夫朗和斐非對稱性與 CPR 非傳統性的關聯 <subsection-fraunhofer-cpr-correlation>

// @fig-correlation-analysis 展示了夫朗和斐干涉圖樣的非對稱性參數與 CPR 中二階諧波分量的關聯性。

// #figure(
//   rect(width: 80%, height: 8cm, stroke: 1pt + gray)[
//     #align(center + horizon)[
//       關聯性分析圖\
//       夫朗和斐非對稱性 vs CPR 二階分量\
//       不同 $B_"In-Plane"$ 條件下的數據點\
//       線性關聯趨勢\
//       （圖片待補充）
//     ]
//   ],
//   caption: [
//     夫朗和斐干涉圖樣非對稱性與 CPR 非傳統性的關聯。隨著面內磁場的增加，兩者呈現明顯的正相關，證實了它們的共同物理起源。
//   ],
// ) <fig-correlation-analysis>

// 關聯性分析揭示了幾個重要發現：

// 1. *強正相關性*：夫朗和斐干涉圖樣的非對稱程度與 CPR 中二階諧波分量的大小呈現強正相關 ($R^2 > 0.9$)

// 2. *磁場可調控性*：透過調節面內磁場 $B_"In-Plane"$，可以連續地調控 CPR 的非傳統性

// 3. *共同物理起源*：這種關聯性強烈暗示夫朗和斐非對稱性和非傳統 CPR 具有共同的物理起源——#ce[PtTe2] 的拓撲表面態

// 4. *二極體效應的定量表徵*：二極體效率 $η = (I_c^+ - I_c^-)/(I_c^+ + I_c^-)$ 隨 $B_"In-Plane"$ 呈現可預測的變化

// 這些結果為理解 #ce[PtTe2] 中的拓撲超導現象提供了直接的實驗證據，並展示了利用外部磁場調控量子元件特性的巨大潜力。

== 結果總結 Section Results Summary<section-results-summary>

本章的實驗結果確立了以下重要發現：

1. *高品質的 #ce[PtTe2] 約瑟夫森接面*：成功製備了具有清晰超導特性和良好電學性能的元件。

2. *非傳統的電流-相位關係*：直接觀測到包含顯著二階諧波分量的非純正弦 CPR。

3. *高面內磁場下的顯著二階諧波分量與相位差*：觀察到高面內磁場下的 CPR 中二階諧波分量與相位差的顯著變化，這表明了磁場對 CPR 的調控作用。


這些結果為理解 #ce[PtTe2] 中的非傳統的電流-相位關係提供了直接的實驗證據，並展示了利用外部磁場調控量子元件特性的巨大潛力。


// ------------------------------------------------------------
// 第五章（原）＋第六章（原）整併：單一章
// 保留兩個 chapter label，避免既有引用失效
// ------------------------------------------------------------

= 討論、結論與展望 Discussion, Conclusions, and Outlook <chapter-discussion-conclusion-prospect>

== 討論 Discussion <section-discussion>

=== 直接量測電流–相位關係：探討非對稱夫朗和斐干涉圖樣的起源 Direct Measurement of the Current–Phase Relation: Investigating the Origin of Asymmetric Fraunhofer Interference Patterns <section-asymmetric-fraunhofer-origin>

不同於使用量測正負向切換電流計算切換電流差 $Delta I_s$、再間接推得電流–相位關係的方法，本研究使用以 #ce[PtTe2] 構成之非對稱超導量子干涉儀直接量測 CPR，從而提供理解非對稱夫朗和斐干涉圖樣之起源與內在物理機制的重要線索。

=== 製備技術挑戰與改進方向 Fabrication Challenges and Directions for Improvement <section-fabrication-challenges>

// Fabrication Challenges
// 製備過程中遇到的技術挑戰與解決方案

在 #ce[PtTe2] 基礎超導元件的製備過程中，遇到了多項技術挑戰，這些挑戰直接影響最終元件的電學特性與量測結果的可靠性。

==== 薄片尺寸與厚度控制 Flake Size and Thickness Control <subsection-flake-size-thickness>

// Flake Size and Thickness
// 本小節內容有待補充

二維材料薄片的尺寸與厚度控制是影響元件性能的關鍵因素。機械剝離法獲得的 #ce[PtTe2] 薄片在尺寸分佈與厚度均勻性方面存在固有變異性。

// 待補充：具體的尺寸要求、厚度對電學特性的影響、改進策略

==== 過渡金屬二硫屬化物表面保護與殘留物清除 Surface Protection and Residue Removal for Transition Metal Dichalcogenides <subsection-tmd-surface-protection>

// TMD Surface Protection and Residues Cleaning
// 本小節內容有待補充

過渡金屬二硫屬化物材料表面的保護與清潔是確保高品質歐姆接觸的重要步驟。在電子束微影與後續製程中，如何有效保護材料表面並完全清除製程殘留物是製備成功的關鍵。

// 待補充：具體的表面處理方法、殘留物的來源與影響、清除技術的比較

==== 濺鍍超導電極的側壁問題 Sidewall Issues in Sputtered Superconducting Electrodes <subsection-sputtered-leads-sidewall>

// Side-Wall Issue of Sputtered Superconducting Leads
// 本小節內容有待補充

濺鍍製程中的側壁沉積問題會影響電極圖案的精確度與電學特性。特別是在製備細線寬的超導電極時，側壁效應可能導致短路或產生非預期的電流路徑。

// 待補充：側壁問題的具體表現、對元件性能的影響、解決方案與改進建議

==== SQUID 環路面積與接面尺寸的匹配 Matching the SQUID Loop Area to the Junction Dimensions <subsection-squid-area-flake-size>

// SQUID Ring Area and Flake Size

在製備非對稱 SQUID 時，SQUID 環路面積與接面尺寸的匹配是影響量測精度的重要因素。較大的 SQUID 環路面積與接面尺寸比可提供較佳的參考接面相位鎖定效果，但同時對磁場控制精度提出更高要求。本研究提供一個初步結果，為後續研究與樣品幾何設計提供重要參考。

==== 長接面與高面內磁場：顯著二階諧波分量與相位差 Long Junctions and High In-Plane Magnetic Fields: Pronounced Second-Harmonic Component and Phase Offset <subsection-long-flake-high-field>

// Long Flake and High-Field Second Harmonic Component and Phase Difference

在長接面與高面內磁場下，我們觀察到顯著二階諧波分量與相位差，這隱含約瑟夫森二極體效應出現的可能。然而，在高面內磁場下，接面臨界電流密度分布不均勻性會使夫朗和斐干涉圖樣嚴重扭曲；此時，原始二極體效率之定義是否仍適用值得進一步檢驗。

== 結論 Conclusions <section-conclusion>

本研究成功地實現對第二類狄拉克半金屬（Type-II Dirac semimetal）1T-#ce[PtTe2] 基超導量子干涉儀中「磁通量控制之電流–相位關係」的深入探索。透過結合精密元件製備技術、極低溫量測平台與數據分析流程，本研究獲得以下主要成果：

=== 主要研究成果 Main Research Findings <subsection-main-achievements>

+ *高品質介面接觸*：
  - 成功製備高品質金屬–半金屬接觸界面，提升 SQUID 元件之可靠性。

+ *非傳統 CPR 的直接觀測*：
  - 成功製備基於 1T-#ce[PtTe2] 的平面型 SQUID 元件。
  - 透過非對稱 SQUID 量測技術，直接重構 #ce[PtTe2] 約瑟夫森接面的 CPR。
  - 確認 CPR 顯著偏離傳統正弦形式 $I_s = I_c sin(phi)$，呈現可觀高階諧波分量。

+ *磁通量調控特性之系統性研究*：
  - 展示外部磁通量可連續調控 CPR 形式。
  - 實現「可調控的 $phi_0$-約瑟夫森接面」功能，其中 $phi_0$ 相位偏移可由磁場原位調節。
  - 驗證元件作為磁通量可調諧超導量子元件的應用潛力。

=== 技術創新與方法學貢獻 Technical Innovations and Methodological Contributions <subsection-technical-innovations>

+ *精密製備技術*：
  - 建立二維材料機械剝離至超導元件製備的完整流程。
  - 開發有效的介面清潔與原位離子束蝕刻技術，以確保金屬–半金屬接觸品質。
  - 實現奈米級精度之電子束微影圖案定義。

+ *量測方法學*：
  - 搭建整合式毫開爾文溫度之極低溫量測平台。
  - 改良基於 QCoDeS 框架之自動化數據擷取與分析系統，以實現正負向電流與面內磁場的控制與量測。
  - 發展自非對稱 SQUID 干涉圖樣重構 CPR 的分析方法。

== 展望 Outlook <section-prospect>

基於本研究成果與技術基礎，後續研究具備廣闊發展空間：

=== 短期研究方向 Short-Term Research Directions <subsection-short-term-prospects>

+ *元件性能優化*：
  - 進一步優化製程以提升接面均勻性與再現性。
  - 探索不同厚度 #ce[PtTe2] 薄片對 CPR 的影響。
  - 改良幾何設計以平衡量測精度與量測速度。
  - 替換參考接面材料以降低其對目標接面 CPR 的影響。

+ *物理機制深入研究*：
  - 透過溫度依賴量測釐清拓撲表面態與超導配對之競合關係。
  - 研究磁場方向性對約瑟夫森二極體效應的影響。
  - 探索閘極電壓對接面 CPR 的調控效果。

+ *量測技術拓展*：
  - 納入夏皮羅階梯量測以研究接面之量子漲落與動力學機制。

=== 中長期研究方向 Mid- to Long-Term Research Directions <subsection-long-term-prospects>

+ *新型量子元件開發*：
  - 基於可調控 $phi_0$-接面探索拓撲保護量子位元（topologically protected qubits）。
  - 設計具內建相位偏移之超導干涉元件，實現免外加磁場的量子態操控。
  - 探索 #ce[PtTe2] 基約瑟夫森接面在超導量子計算中的應用潛力。

+ *材料體系拓展*：
  - 探索其他狄拉克/外爾半金屬（例如 #ce[WTe2]、#ce[MoTe2]）之類似現象。
  - 研究異質結構（例如 #ce[PtTe2]/石墨烯）中的介面超導與拓撲效應。
  - 開發基於范德瓦耳斯異質結構（van der Waals heterostructures）的可調控超導元件。

=== 科學影響與意義 Scientific Impact and Significance <subsection-scientific-impact>

本研究在基礎物理層面揭示拓撲材料與超導性的深刻交互作用，並為量子感測與量子資訊相關技術提供具可調控特性的材料平台與元件路徑。隨量子計算、量子感測等領域快速發展，具備內稟拓撲特徵與可調相位工程能力的超導元件將具更高之應用潛力。

== 結語 Concluding Remarks <section-concluding-remarks>

本研究展示 1T-#ce[PtTe2] 基 SQUID 中磁通量控制 CPR 的豐富物理內涵；所觀測之非傳統 CPR 與潛在的約瑟夫森二極體效應，除加深對拓撲材料近接超導之理解外，亦為後續新型量子元件的設計奠定基礎。本研究亦體現材料科學、凝聚態物理與量子工程的跨域整合：藉由將新興拓撲量子材料與成熟超導技術結合，不僅可揭示新的量子輸運現象，也可望開啟通往可調控量子器件之新途徑。


// // 第五章：討論
// = 討論 <chapter-discussion>

// == 直接量測電流相位關係探討非對稱夫朗和斐干涉圖樣的起源 <section-asymmetric-fraunhofer-origin>

// 不同於使用量測正負向切換電流計算切換電流差 $Delta I_s$間接得出電流相位關係的方式，本研究使用#ce[PtTe2]構成的非對稱SQUID直接量測電流相位關係，從而提供了深入理解非對稱夫朗和斐（Fraunhofer）干涉圖樣的起源內在物理機制的重要線索。

// // 待補充：具體的非對稱性分析、物理機制討論、與理論預測的比較

// // == 非傳統電流-相位關係的性質與起源 <section-unconventional-cpr-nature>

// // // Nature and Origin of Unconventional CPRs
// // // 本節內容有待補充

// // 非傳統的電流-相位關係（Current-Phase Relation, CPR）的出現是第二類狄拉克半金屬（Type-II Dirac Semimetal）與超導性結合的重要表現。在#ce[PtTe2]約瑟夫森接面中，偏離標準正弦函數的CPR反映了其獨特的拓撲電子結構。

// // // 待補充：CPR的具體形式分析、高階諧波成分、與材料拓撲性質的關聯

// // == 與相關研究之比較 <section-comparison-related-work>

// // 本文的研究結果與近期關於第二類狄拉克半金屬 Josephson 二極體效應的報導高度一致，特別是針對 $1T-"PtTe"_2$ 與同族材料 $"NiTe"_2$ 的研究。

// // 首先，我們觀察到的約瑟夫森二極體效應（JDE）與近期在 $1T-"PtTe"_2$ 單一接面中報導的現象 [arXiv:2403.19445] 相呼應。相關研究同樣發現了可透過磁場調控的二階 Josephson 效應（$phi_0$-junction behavior），並將其歸因於螺旋自旋-動量鎖定的表面態。我們的 SQUID 量測進一步提供了電流-相位關係（CPR）的直接相位敏感證據，確認了高階諧波 ($I_2$) 的存在及其相位偏移 ($delta$) 是導致二極體效應的微觀根源。

// // 其次，與 $"NiTe"_2$ 的研究相比，我們同樣觀察到了二極體效率隨面內磁場的振盪與反轉行為。這被認為是有限動量古柏對（Finite-momentum Cooper pairing）機制的特徵。然而，我們的角度依賴性測量顯示出獨特的對稱性特徵，這可能反映了 #ce[PtTe2] 表面態具體的自旋織構差異。

// // 總體而言，本研究採用非對稱 SQUID 技術，不僅驗證了先前基於傳輸測量（Transport）的發現，更提供了關於超導電流相位動力學的細緻資訊，補充了現有文獻在相位敏感性測量方面的不足。

// == 製備技術挑戰 <section-fabrication-challenges>

// // Fabrication Challenges
// // 製備過程中遇到的技術挑戰與解決方案

// 在#ce[PtTe2]基礎超導元件的製備過程中，遇到了多項技術挑戰，這些挑戰直接影響了最終元件的電學特性與量測結果的可靠性。

// === 薄片尺寸與厚度控制 <subsection-flake-size-thickness>

// // Flake Size and Thickness
// // 本小節內容有待補充

// 二維材料薄片（Flake）的尺寸與厚度控制是影響元件性能的關鍵因素。機械剝離法（Mechanical Exfoliation）獲得的#ce[PtTe2]薄片在尺寸分佈和厚度均勻性方面存在固有的變異性。

// // 待補充：具體的尺寸要求、厚度對電學特性的影響、改進策略

// === 過渡金屬二硫屬化物表面保護與殘留物清除 <subsection-tmd-surface-protection>

// // TMD Surface Protection and Residues Cleaning
// // 本小節內容有待補充

// 過渡金屬二硫屬化物（Transition Metal Dichalcogenide, TMD）材料表面的保護與清潔是確保高品質歐姆接觸（Ohmic Contact）的重要步驟。在電子束微影（Electron Beam Lithography, EBL）與後續製程中，如何有效保護材料表面並完全清除製程殘留物是製備成功的關鍵。

// // 待補充：具體的表面處理方法、殘留物的來源與影響、清除技術的比較

// === 濺鍍超導電極的側壁問題 <subsection-sputtered-leads-sidewall>

// // Side-Wall Issue of Sputtered Superconducting Leads
// // 本小節內容有待補充

// 磁控濺鍍（Magnetron Sputtering）製程中的側壁沉積問題會影響電極圖案的精確度與電學特性。特別是在製備細線寬的超導電極時，側壁效應可能導致短路或產生非預期的電流路徑。

// // 待補充：側壁問題的具體表現、對元件性能的影響、解決方案與改進建議

// === SQUID環路面積與接面尺寸的匹配 <subsection-squid-area-flake-size>

// // SQUID Ring Area and Flake Size

// 在製備非對稱SQUID時，SQUID環路面積與接面尺寸的匹配是影響量測精度的重要因素，較大的SQUID環路面積與接面尺寸比可以得到較佳的參考接面相位鎖定效果，但對磁場的控制精度要求較高。本研究提供了一個初步結果，為後續研究與樣品幾何設計提供了重要的參考。

// === 長接面與高面內磁場下的顯著二階諧波分量與相位差 <subsection-long-flake-high-field>

// // Long Flake and High-Field Second Harmonic Component and Phase Difference

// 在長接面與高面內磁場下，我們觀察到顯著的二階諧波分量與相位差，這隱含約瑟夫森二極體效應出現的可能，但在高面內磁場下，接面臨界電流密度分布的不均勻性造成夫浪和斐干涉圖樣已經嚴重扭曲，此時原始的二極體效率定義是否適用值得商榷。

// // 第六章：結論與展望 (Chapter 6: Conclusion and Prospect)
// = 結論與展望 <chapter-conclusion-prospect>

// == 結論 <section-conclusion>

// 本研究成功地實現了對第二類狄拉克半金屬 (Type-II Dirac Semimetal) 1T-#ce[PtTe2] 基超導量子干涉儀 (Superconducting Quantum Interference Device, SQUID) 中磁通量控制電流-相位關係 (flux-controlled current-phase relation) 的深入探索。透過結合精密的元件製備技術、極低溫量測平台以及先進的數據分析方法，我們獲得了以下重要的研究成果：

// === 主要研究成果 <subsection-main-achievements>

// + *高品質的介面接觸*：
//   - 成功製備了高品質的金屬-半金屬接觸界面，實現了超導量子干涉儀元件的高可靠性


// + *非傳統電流-相位關係的直接觀測*：
//   - 成功製備了基於 1T-#ce[PtTe2] 的平面型超導量子干涉儀元件
//   - 透過非對稱 SQUID 量測技術，直接重構出 #ce[PtTe2] 約瑟夫森接面 (Josephson Junction) 的電流-相位關係
//   - 確認了電流-相位關係顯著偏離傳統的正弦函數形式 $I_s = I_c sin(phi)$，展現出明顯的高階諧波分量

// + *磁通量調控特性的系統性研究*：
//   - 展示了外部磁通量對電流-相位關係形式的連續調控能力
//   - 實現了「可調控的 $phi_0$-約瑟夫森接面」功能，其中 $phi_0$ 相位偏移可透過磁場進行原位調節
//   - 驗證了元件作為磁通量可調諧超導量子元件的應用潛力

// // + *拓撲超導物理的深入理解*：
// //   - 揭示了狄拉克半金屬中螺旋自旋-動量鎖定 (helical spin-momentum locking) 拓撲表面態與超導近接效應 (superconducting proximity effect) 的交互作用機制
// //   - 證實了高透明度介面 (high-transparency interface) 促進長距離相位調和高階安德烈夫反射 (phase-coherent higher-order Andreev reflections) 的物理圖像
// //   - 建立了材料拓撲特性與巨觀量子輸運現象之間的直接聯繫

// === 技術創新與方法學貢獻 <subsection-technical-innovations>

// + *精密製備技術*：
//   - 建立了完整的二維材料機械剝離 (mechanical exfoliation) 到超導元件製備的技術流程
//   - 開發了有效的介面清潔與原位離子束蝕刻 (in-situ ion milling) 技術，確保高品質的金屬-半金屬接觸
//   - 實現了奈米級精度的電子束微影 (electron beam lithography) 圖案定義

// + *量測方法學*：
//   - 搭建了整合式的毫開爾文溫度極低溫量測平台
//   - 改良基於 QCoDeS 框架的自動化數據擷取與分析系統以實現正負向電流與平面內磁場的控制與量測
//   - 發展了從非對稱 SQUID 干涉圖樣重構電流-相位關係的分析方法

// == 展望 <section-prospect>

// 基於本研究的重要發現和建立的技術基礎，未來的研究方向具有廣闊的發展空間：

// === 短期研究方向 <subsection-short-term-prospects>

// + *元件性能優化*：
//   - 進一步優化製備工藝，提高接面的均勻性和可重現性
//   - 探索不同厚度 #ce[PtTe2] 薄片對電流-相位關係的影響
//   - 改良樣品幾何結構設計以取得量測精度與速度的平衡
//   - 替換參考接面材料以排除其對目標接面電流-相位關係的影響

// + *物理機制深入研究*：
//   - 透過溫度依賴性量測深入理解拓撲表面態與超導配對的競爭與協作關係
//   - 研究磁場方向性對約瑟夫森二極體效應的影響
//   - 探索閘極電壓對接面電流-相位關係的影響

// + *量測技術拓展*：
//   - 加入夏皮羅階梯 (Shapiro steps) 量測技術以研究接面的量子漲落機制


// === 中長期研究方向 <subsection-long-term-prospects>

// + *新型量子元件開發*：
//   - 基於可調控 $phi_0$-接面開發拓撲保護的量子位元 (topologically protected qubits)
//   - 設計具有內建相位偏移的超導量子干涉元件，實現免磁場的量子態操控
//   - 探索 #ce[PtTe2] 基約瑟夫森接面在超導量子計算中的應用潛力

// + *材料體系拓展*：
//   - 探索其他狄拉克/外爾半金屬 (如 WTe₂、MoTe₂) 中的類似現象
//   - 研究異質結構 (如 #ce[PtTe2]/石墨烯) 中的介面超導與拓撲效應
//   - 開發基於范德瓦耳斯異質結構 (van der Waals heterostructures) 的可調控超導元件


// === 科學影響與意義 <subsection-scientific-impact>

// 本研究不僅在基礎物理層面揭示了拓撲材料與超導性的深刻交互作用，更為未來量子技術的發展提供了重要的材料平台和物理基礎。隨著量子計算、量子感測等領域的快速發展，具有內稟拓撲保護和可調控特性的超導元件將發揮越來越重要的作用。

// == 結語 <section-concluding-remarks>

// 本研究成功地展示了 1T-#ce[PtTe2] 基超導量子干涉儀中磁通量控制電流-相位關係的豐富物理內涵。所獲得的非傳統電流-相位關係和約瑟夫森二極體效應，不僅加深了我們對拓撲超導物理的理解，也為開發新一代量子元件奠定了重要基礎。

// 這項研究體現了材料科學、凝聚態物理和量子工程等多學科交叉融合的力量。透過將新興拓撲量子材料與成熟的超導技術相結合，我們不僅發現了新的物理現象，更開闢了通向未來量子技術的新途徑。

// 隨著相關研究的不斷深入和技術的持續發展，相信基於拓撲材料的超導量子元件將在推動量子科技革命中發揮關鍵作用，為人類社會帶來前所未有的技術變革和應用可能。




// 附錄
#include "appendices/appendix.typ"

// 參考文獻
#pagebreak()
#{
  set align(center)
  text(size: 18pt, weight: "bold")[參考文獻]
}
#v(1em)
#bibliography("references.bib", title: none)

