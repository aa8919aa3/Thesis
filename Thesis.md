# Thesis: Flux Controlled Current-Phase Relation in 1T-PtTe2 SQUIDs

# **Flux Controlled Current-Phase Relation in 1T-PtTe2 SQUIDs
1T-PtTe2** SQUID 中的磁通量控制電流-相位關係

# **CONTENTS**

# Acknowledgements

# **Abstract**

# **Chapter I.** Introduction

Recent advancements in topological quantum materials have unveiled unique opportunities to engineer superconducting devices with tailored current-phase relations (CPRs). Platinum ditelluride (PtTe₂), a type-II Dirac semimetal with helical spin-momentum locking, exhibits a Josephson diode effect and higher-harmonic supercurrent components that enable flux-tunable CPRs in superconducting quantum interference devices (SQUIDs). This work synthesizes experimental and theoretical insights to demonstrate how magnetic flux controls the harmonic content of the CPR in PtTe₂-based SQUIDs, revealing a direct correlation between spin-orbit coupling, second-order Josephson effects, and nonreciprocal critical currents. The interplay between topological surface states and superconducting order parameters in PtTe₂ facilitates coherent Andreev processes, allowing deterministic tuning of the CPR via external magnetic fields. These findings position PtTe₂ SQUIDs as versatile platforms for superconducting logic circuits and quantum sensing applications.

在凝聚態物理的前沿探索中，一個核心的驅動力源於將具有非凡電子特性的新興量子材料與成熟的宏觀量子系統（如超導電路）相結合，以期發現新奇的物理現象並構建功能更強大的量子元件。本論文完整地記述了基於第二類狄拉克半金屬 1T-PtTe₂ 的超導量子干涉儀 (SQUID) 的設計、微奈米製備，以及在極低溫下的精密電學量測。研究的核心目標是探測在此類混合元件中由狄拉克費米子所中介的、非傳統的電流-相位關係 (Current-Phase Relation, CPR)，並更進一步地，展示如何利用外部磁通量作為一個原位調控旋鈕，來實現對此基本量子特性的主動控制。為達成此目標，我們建立了一套完整的元件製備流程，並搭建了一座整合性的超低噪聲低溫量測平台。本文所呈現的結果，不僅揭示了狄拉克物理與超導近接效應之間深刻的交互作用，也為開發新型、可調諧的超導量子電子學元件提供了一條富有前景的途徑。

## 1.1 Emergence of Novel Materials and the Superconducting Quantum Interference Devices (SQUIDs)新穎材料的出現與超導量子干涉儀（SQUID）

Among the emerging materials in this field is Platinum Ditelluride (PtTe2), a type-II Dirac semimetal exhibiting superconducting properties below a critical temperature. 1  Its unique electronic and topological characteristics, stemming from its Dirac cone band structure, position it as a promising candidate for the development of advanced superconducting devices. 2  The behavior of superconducting devices, particularly those incorporating Josephson junctions, is fundamentally governed by the Current-Phase Relation (CPR), which describes the relationship between the supercurrent and the phase difference across the junction. 3  The ability to control this CPR using an external magnetic flux is of paramount importance for tuning the properties and functionalities of SQUIDs, especially those based on novel materials like PtTe2. This report aims to provide a comprehensive overview of the flux-controlled current-phase relation in PtTe2 SQUIDs, thereby establishing a solid foundation for a detailed research paper on this topic.

Superconducting Quantum Interference Devices (SQUIDs) stand as the most sensitive instruments for detecting magnetic flux, operating on the principles of superconductivity and quantum mechanics. Their fundamental structure comprises a superconducting loop interrupted by one or two Josephson junctions. This configuration allows for the measurement of extremely weak magnetic fields, making SQUIDs indispensable tools in various scientific and technological domains, ranging from fundamental physics experiments to medical diagnostics. The continuous drive to enhance the performance of SQUIDs and explore new functionalities has led to significant research into the utilization of novel superconducting materials. This exploration aims to achieve higher operating temperatures, exploit unique quantum phenomena, and broaden the scope of SQUID applications.

近代凝聚態物理的發展，很大程度上是由新興量子材料的發現與合成所驅動。從石墨烯等二維材料，到拓撲絕緣體，再到狄拉克 (Dirac) 與外爾 (Weyl) 半金屬，這些材料因其非凡的電子能帶結構與對稱性保護的拓撲特性，為基礎物理研究和下一代量子技術的開發提供了前所未有的平台。將這些材料的獨特量子特性與超導性相結合，構建混合量子元件 (hybrid quantum devices)，已成為探索新奇物理現象（如馬約拉納束縛態）和開發新型量子計算元件的關鍵途徑。
在此背景下，超導量子干涉儀 (SQUID) 作為一種極其靈敏的磁通量感測器，不僅在傳統的生物磁學、地質探測等領域扮演著不可或缺的角色，更在現代量子科技中佔據了核心地位。SQUID 的工作原理巧妙地融合了超導態的宏觀量子特性與約瑟夫森效應 (Josephson effect)，使其能夠將穿透其超導迴路的極微弱磁通量變化，轉換為易於量測的電壓或電流信號。正因如此，SQUID 不僅是構建超導量子位元（特別是磁通量量子位元, flux qubit）的基礎單元，也是實現對量子位元進行高保真度讀取 (readout) 的關鍵元件。
傳統的 SQUID 通常由常規超導體（如鋁或鈮）構成，其物理特性已得到充分的理解。然而，近年來研究的熱點逐漸轉向利用新興量子材料來構建 SQUID 中的核心元件——約瑟夫森接面 (Josephson junction)。接面的核心物理性質由其電流-相位關係 (Current-Phase Relation, CPR) 所描述，即超導電流 I_s 如何隨接面兩端超導波函數的相位差 \phi 而變化，寫作 I_s(\phi)。傳統接面的 CPR 遵循一個簡單的正弦函數 (I_s = I_c \sin\phi)，而這個關係的具體形式，從根本上取決於構成接面「弱連結 (weak link)」區域的材料的電子傳輸特性。
因此，將狄拉克半金屬等具有非傳統電子能帶結構的材料作為弱連結，有望實現非傳統的電流-相位關係 (unconventional CPR)。一個非正弦的 CPR 可能會導致元件展現出諸如有限動量的庫柏對穿隧、自發的對稱性破缺、甚至是拓撲保護的超導態等新奇物理。特別是，一個偏離正弦形式的 CPR 是實現 \phi_0-接面的前提，這種接面因其內在的 \pi/2 相位偏移，在構建抗噪聲的拓撲量子位元方面具有巨大的潛力。
本研究的核心，便是將第二類狄拉克半金屬 1T-PtTe₂ 作為弱連結，來構建平面型的 SQUID 元件。我們的目標不僅是探測由 1T-PtTe₂ 的獨特電子態所導致的非傳統電流-相位關係，更是要進一步探索是否可以利用外部磁通量作為一個原位的調控旋鈕，來主動地、連續地控制 (control) 其 CPR 的形式。實現對 CPR 的原位調控，將為開發可調諧的、功能更強大的超導量子元件邁出關鍵的一步。

### 1.1.1 Platinum Ditelluride (PtTe2): Material Properties and Superconducting Characteristics

Platinum Ditelluride (PtTe2) is a material that crystallizes in a layered structure and belongs to the family of transition metal dichalcogenides (TMDCs), characterized by the general formula MX2. In its bulk form, PtTe2 is classified as a type-II Dirac semimetal, which means its electronic band structure features Dirac cones, points in momentum space where the conduction and valence bands meet linearly. This unique electronic structure gives rise to intriguing electronic transport properties. Notably, the behavior of PtTe2 can vary with dimensionality; in its monolayer form, it can exhibit properties of either a semiconductor or a metal. The distinctive electronic structure of PtTe2 as a Dirac semimetal is expected to have a significant influence on its superconducting behavior and the current-phase relation of SQUIDs fabricated from it.

PtTe2 demonstrates superconducting properties when cooled below a critical temperature (Tc) of approximately 10 K. Research on related materials, such as Iridium Ditelluride (IrTe2), has shown that superconductivity can be induced or enhanced through doping with Platinum, suggesting a crucial role for Pt in the emergence of this phenomenon within this class of compounds. More specific studies on PtTe2 have reported superconducting responses at lower temperatures, with Josephson junctions made from this material showing superconductivity up to around 4.5 K and 2.7 K. This relatively low critical temperature necessitates the use of cryogenic operating conditions for PtTe2-based SQUIDs.

The superconducting coherence length (ξ) is another fundamental parameter that characterizes a superconductor. It represents the spatial extent over which the superconducting order parameter can vary. For a Josephson junction made of PtTe2, the coherence length has been estimated to be approximately 200 nm. The magnitude of the coherence length is crucial as it dictates the behavior of Josephson junctions. For instance, it helps determine whether a junction operates in the short or long junction limit, which in turn influences its current-phase relation. A coherence length of 200 nm, when compared to typical junction sizes, provides insights into the nature of Cooper pairs and the spatial scale of superconducting correlations within PtTe2.

碲化鉑 (PtTe₂) 是一種過渡金屬二硫屬化物 (Transition Metal Dichalcogenide, TMD)，屬於通式為 MX₂ 的材料家族。在結構上，PtTe₂ 結晶為 1T 相，呈現出一種層狀結構，此特性使其可以透過機械剝離法獲得二維薄片。其物理性質會隨維度變化，例如其單層形式可表現出半導體或金屬的特性。
在電子特性方面，塊材 PtTe₂ 已被歸類為一種第二類狄拉克半金屬 (Type-II Dirac Semimetal)。其電子能帶結構的特徵是在動量空間中存在狄拉克錐，即導帶與價帶發生線性接觸的狄拉克點。這種獨特的電子結構賦予了 PtTe₂ 一系列奇特的電子輸運性質，使其成為研究拓撲物理與超導性之間交互作用的理想材料平台。
PtTe₂ 在冷卻至約 10 K 的臨界溫度 (T_c) 以下時，會展現出超導特性。針對此材料製作的約瑟夫森接面，已有研究報導其在約 2.7 K 至 4.5 K 的溫度下仍能維持超導電流。另一個表徵其超導態的關鍵參數是相干長度 (coherence length, \xi)，它代表了庫柏對 (Cooper pair) 關聯性的空間尺度。對於 PtTe₂ 約瑟夫森接面，其相干長度已被估計約為 200 nm。雖然塊材 PtTe₂ 具有本徵超導性，但在本研究所探討的混合元件中，PtTe₂ 弱連結區域的超導性，主要是透過與具有更高 T_c 的超導電極接觸，經由超導近接效應 (superconducting proximity effect) 所誘導和增強的。
PtTe₂ 的內稟物理性質——包括其狄拉克半金屬能帶結構，以及在約 200 nm 相干長度上展現的超導關聯性——被預期將深刻地影響以此材料製備的約瑟夫森接面的行為。具體而言，相干長度的量值與接面幾何尺寸的相對大小，將決定元件是工作在短接面極限還是長接面極限，這會直接衝擊其電流-相位關係 (Current-Phase Relation, CPR) 的具體形式。因此，由其獨特的狄拉克費米子所中介的庫柏對傳輸過程，被預期將導致一個偏離標準正弦函數的非傳統 CPR，而這正是本論文研究的核心課題。

碲化鉑 (PtTe₂) 是一種過渡金屬二硫屬化物 (Transition Metal Dichalcogenide, TMD)，屬於通式為 MX₂ 的材料家族，近年來因其豐富的物理內涵而備受關注。在結構上，PtTe₂ 結晶為 1T 相 (CdI₂-type)，呈現出一種由 Pt 原子層夾在兩層 Te 原子層之間的八面體配位層狀結構。這種層狀特性使其可以透過機械剝離法，輕易地獲得從塊材到幾個原子層甚至單原子層厚度的二維薄片，為構建凡德瓦爾異質結構 (van der Waals heterostructures) 和平面型奈米元件提供了極大的可能性。 在電子特性方面，PtTe₂ 最引人注目的特徵是它已被理論預測並由角解析光電子能譜 (ARPES) 等實驗技術證實為一種第二類狄拉克半金屬 (Type-II Dirac Semimetal)。與傳統的第一類狄拉克半金屬（如石墨烯）中點狀的費米面不同，第二類狄拉克半金屬擁有極度傾斜的狄拉克錐，使得電子和電洞口袋在狄拉克點處相切接觸。這些受晶體對稱性保護的狄拉克點，賦予了 PtTe₂ 獨特的低能電子態和輸運性質，使其成為研究拓撲物理與超導性之間交互作用的理想材料平台。
值得注意的是，塊材 PtTe₂ 本身並沒有超導性，然而，在本研究所探討的約瑟夫森接面元件中，PtTe₂ 作為「弱連結 (weak link)」區域，其超導性主要是透過與具有更高超導轉變溫度的電極（如鈮鈦合金 Niobium–titanium, Nb-Ti）接觸，經由超導近接效應 (superconducting proximity effect) 所誘導產生。這就構成了一個超導體-拓撲半金屬-超導體 (Superconductor–Topological Semimetal–Superconductor, S-TS-S) 的混合結構。
將超導性與 PtTe₂ 的狄拉克半金屬的拓撲特性相結合，為探索新奇的量子輸運現象提供了獨特的機會。在此S-TS-S結構中，庫柏對 (Cooper pairs) 穿越接面的傳輸過程，是由 PtTe₂ 內部獨特的狄拉克費米子所中介的。這種非傳統的傳輸機制，被預期將導致一個偏離標準正弦函數的非傳統電流-相位關係 (unconventional Current-Phase Relation)。因此，深入研究 PtTe₂ 約瑟夫森接面的電學特性，對於理解拓撲半金屬中的近接超導物理，以及探索其在未來量子技術中的應用潛力，具有至關重要的意義。

### 1.1.2 約瑟夫森接面與超導量子干涉儀 (Josephson Junctions and Superconducting Quantum Interference Devices)

約瑟夫森接面 (Josephson Junction, JJ) 是構成超導量子電路的基本構建模組。其物理結構為由一個「弱連結 (weak link)」隔開的兩個超導體。這個弱連結可以是一個極薄的絕緣層 (S-I-S)、一段正常金屬 (S-N-S)，或如本研究中的拓撲半金屬 (S-TS-S)。儘管庫柏對 (Cooper pairs) 無法在弱連結材料中長距離穩定存在，但它們可以透過量子穿隧 (quantum tunneling) 或近接效應 (proximity effect) 的方式，在弱連結區域建立起相干的超導電流。
此現象由兩條基本的約瑟夫森關係式所描述。第一條關係式，即直流約瑟夫森效應，闡述了流經接面的無耗散超導電流 $I_s$ 與兩端超導體波函數的相位差 $\phi$ 之間的關係，這便是電流-相位關係 (Current-Phase Relation, CPR)。對於傳統的接面，其形式為：

$$
I_s = I_c \sin(\phi) \tag{1}
$$

其中 $I_c$ 是接面的最大超導電流，即臨界電流 (critical current)。

第二條關係式，即交流約瑟夫森效應，則描述了當接面兩端存在一個非零的直流電壓 V 時，相位差 \phi 將隨時間演化，進而產生一個頻率為 f = (2e/h)V 的高頻振盪電流，其中 2e/h 為約瑟夫森常數。這兩條關係式共同奠定了所有超導電子學的物理基礎。
超導量子干涉儀 (Superconducting Quantum Interference Device, SQUID) 則是約瑟夫森效應最精巧的應用之一。一個直流 SQUID (DC SQUID) 的結構是一個由兩個約瑟夫森接面所打斷的超導迴路。其工作原理基於通過迴路的磁通量量子化與量子干涉。當一個外部磁通量 \Phi_{ext} 施加於 SQUID 迴路時，迴路中會感應出一個屏蔽電流，此電流會分別對兩個接面中的超導電流產生相加或相減的效應。
由於量子力學的干涉效應，整個 SQUID 元件的總臨界電流 I_{c, total} 會隨著外部磁通量 \Phi_{ext} 的變化而發生週期性的調變。對於一個對稱的 SQUID，其調變關係遵循：
I_{c, total}(\Phi_{ext}) = 2I_c \left| \cos\left(\frac{\pi \Phi_{ext}}{\Phi_0}\right) \right|
其中 I_c 是單個接面的臨界電流，而 \Phi_0 = h/2e 是超導磁通量量子。這種調變的週期精確地為一個磁通量量子 \Phi_0。正是這種對磁通量極高的靈敏度，使得 SQUID 成為現今最精確的磁場感測器。
在本研究中，SQUID 的角色超越了單純的磁場感測器。由於 SQUID 的宏觀量子行為（即其 I_c(\Phi_{ext}) 調變模式）從根本上是由其構成的兩個約瑟夫森接面的微觀 CPR 所決定的，因此，SQUID 本身就構成了一個探測 CPR 的絕佳平台。一個具有非傳統 CPR 的接面，將會導致 SQUID 的磁通量調變圖樣偏離標準的餘弦函數。透過精密地量測此調變圖樣，我們便能反向推演出構成接面的弱連結材料（在此即為 PtTe₂）中潛藏的、非傳統的電流-相位關係。

### 1.1.3 非對稱 SQUID (Asymmetric SQUIDs)

前一節所描述的理想直流 SQUID 模型，其前提是構成迴路的兩個約瑟夫森接面 (J1 and J2) 的特性完全相同（即 I_{c1} = I_{c2}），且在迴路中對稱分佈。然而，在實際的元件製備過程中，由於奈米級製程的inherent variations，兩個接面幾乎不可避免地存在差異，從而導致非對稱性 (asymmetry)。更有甚者，在許多現代量子元件的設計中，非對稱性不僅不是缺陷，反而是一種被有意引入的、用以實現特定功能的設計策略。
SQUID 的非對稱性主要體現在兩個方面：接面非對稱性，即兩個接面的臨界電流 (I_{c1} \neq I_{c2})、正常態電阻 (R_{N1} \neq R_{N2}) 或電容 (C_1 \neq C_2) 不同；以及迴路非對稱性，即兩個接面在超導迴路中的位置不同，導致迴路電感分配不均 (L_1 \neq L_2)。這些非對稱性會打破 SQUID 理想的磁通量調變模式，使得其 I_c(\Phi_{ext}) 圖樣偏離完美的 |\cos(\pi \Phi_{ext}/\Phi_0)| 函數，表現為圖樣的傾斜、振幅的變化或極小值無法降至零等特徵。
儘管非對稱性會使 SQUID 的行為變得更為複雜，但它也提供了一個探測約瑟夫森接面內在物理的強大工具。特別是，一個高度非對稱的 SQUID（例如，其中一個接面的臨界電流遠大於另一個，I_{c1} \gg I_{c2}），可以被視為一個相位偏置 (phase-biased) 的探測器，用以直接測量較弱接面 (weak junction) 的電流-相位關係 (CPR)。在此組態中，較強的接面 (strong junction) 近似地提供了一個固定的相位參考，而施加於 SQUID 迴路的外部磁通量 \Phi_{ext} 則主要用於連續地、精確地調控較弱接面上的相位差 \phi_2。
因此，透過精密量測一個非對稱 SQUID 的總臨界電流 I_{c, total} 隨外部磁通量 \Phi_{ext} 的完整調變曲線，並對其非餘弦的畸變形狀進行分析（例如，透過傅立葉轉換），我們可以直接重構出待測的、較弱接面的 CPR I_s(\phi)。在本研究中，我們正是利用了這一原理。透過設計並製備以 1T-PtTe₂ 作為其中一個弱連結的非對稱 SQUID，其磁通量調變圖樣的畸變程度，便直接編碼了我們所要探測的核心物理——由狄拉克半金屬所中介的非傳統電流-相位關係。

### 1.1.4 超導二極體效應與約瑟夫森二極體效應 (Superconducting Diode Effect and Josephson Diode Effect)

在傳統電子學中，二極體是一種基礎的非互易 (non-reciprocal) 元件，它允許電流單向流動。這種行為源於其內建的空間反演對稱性破缺（如 P-N 接面）。然而，超導體中的無耗散超導電流通常被認為是互易的，即其臨界電流 I_c 的大小與方向無關 (I_c^+ = I_c^-)。近年來，一種打破此常規的現象——超導二極體效應 (Superconducting Diode Effect, SDE)——在理論與實驗上引起了極大的關注。SDE 指的是在零外加磁場下，超導體本身展現出方向相關的臨界電流 (I_c^+ \neq I_c^-)，即超導電流存在一個「易行」方向。實現 SDE 的一個關鍵條件，是必須同時打破空間反演對稱性與時間反演對稱性。
約瑟夫森二極體效應 (Josephson Diode Effect, JDE) 則是 SDE 在約瑟夫森接面中的具體體現，即接面的切換電流 I_{sw} 呈現出方向依賴性 (I_{sw}^+ \neq I_{sw}^-)。JDE 的物理根源，與我們前述的電流-相位關係 (CPR) 緊密相連。一個非對稱的 CPR——即 I_s(\phi) \neq -I_s(-\phi)——是產生 JDE 的內在原因。這種非對稱的 CPR 意味著接面中最大正向超導電流與最大負向超導電流的絕對值不相等。此效應的強度可由二極體效率 (diode efficiency) \eta = (I_c^+ - I_c^-) / (I_c^+ + I_c^-) 來量化。
約瑟夫森接面為實現和調控二極體效應提供了一個極具吸引力的平台。這是因為實現 JDE 所需的對稱性破缺，可以在接面系統中有意地進行設計與調控。例如，具有強自旋-軌道耦合的材料（如本研究中的 PtTe₂）可以提供所需的空間反演對稱性破缺；而施加於 SQUID 迴路上的外部磁通量，則可以人為地打破時間反演對稱性。
因此，本研究所探討的、以狄拉克半金屬 PtTe₂ 為核心的非對稱 SQUID 系統，正是實現磁通量可調諧的約瑟夫森二極體效應 (flux-tunable Josephson Diode Effect) 的理想候選體系。透過精密地測量元件在不同磁通量偏置下的正、反向切換電流，我們不僅能夠探測 PtTe₂ 接面中是否存在內稟的非傳統 CPR，更有望實現對其二極體效應的連續調控。這項研究為理解拓撲半金屬中的非互易超導輸運現象，以及開發新型的超導量子線路元件，開闢了新的可能性。

## 1.5 Overview of Previous Work

Among the emerging materials in this field is Platinum Ditelluride (PtTe2), a type-II Dirac semimetal exhibiting superconducting properties below a critical temperature. 1  Its unique electronic and topological characteristics, stemming from its Dirac cone band structure, position it as a promising candidate for the development of advanced superconducting devices. 2  The behavior of superconducting devices, particularly those incorporating Josephson junctions, is fundamentally governed by the Current-Phase Relation (CPR), which describes the relationship between the supercurrent and the phase difference across the junction. 3  The ability to control this CPR using an external magnetic flux is of paramount importance for tuning the properties and functionalities of SQUIDs, especially those based on novel materials like PtTe2. This report aims to provide a comprehensive overview of the flux-controlled current-phase relation in PtTe2 SQUIDs, thereby establishing a solid foundation for a detailed research paper on this topic.

Superconducting Quantum Interference Devices (SQUIDs) stand as the most sensitive instruments for detecting magnetic flux, operating on the principles of superconductivity and quantum mechanics. Their fundamental structure comprises a superconducting loop interrupted by one or two Josephson junctions. This configuration allows for the measurement of extremely weak magnetic fields, making SQUIDs indispensable tools in various scientific and technological domains, ranging from fundamental physics experiments to medical diagnostics. The continuous drive to enhance the performance of SQUIDs and explore new functionalities has led to significant research into the utilization of novel superconducting materials. This exploration aims to achieve higher operating temperatures, exploit unique quantum phenomena, and broaden the scope of SQUID applications.

## 1.2 文獻回顧：1T-PtTe₂ 中的拓撲超導與二極體效應 (Literature Review: Topological Superconductivity and Diode Effects in 1T-PtTe₂)

近年來，在狄拉克半金屬 1T-PtTe₂ 中觀測到的巨大且可調控的約瑟夫森二極體效應 (JDE)，為研究拓撲物理與超導性的交互作用開闢了新的道路。一項由 S. S. P. Parkin 研究群所領導的開創性工作，系統性地揭示了 1T-PtTe₂ 中 JDE 的物理起源，並將其與材料內稟的拓撲電子態直接聯繫起來 `.` 

### 1.2.1 關鍵發現：巨大的二階諧波超電流與可調控的 \\phi_0-接面

`該研究的核心觀測結果是在 1T-PtTe₂ 約瑟夫森接面中，存在一個異常巨大的二階諧波超電流 (second-harmonic supercurrent) . 在傳統的電流-相位關係 (CPR) 中，$I_s(\\phi) = I_c \\sin(\\phi)$，只包含一階諧波項。然而，在 1T-PtTe₂ 接面中，二階項 ($I_2 \\sin(2\\phi + \\phi_2)$) 的貢獻非常顯著，這是其 CPR 非傳統性的直接證據 . 更重要的是，研究發現 JDE 的大小與這個巨大的二階諧波超電流直接相關 . 作者進一步展示，透過施加一個平面內磁場，可以連續地調控一階與二階諧波之間的相對相位差。這使得元件的功能如同一個「**可調控的二階 $\\phi_0$-約瑟夫森接面**」，其 CPR 不僅是非正弦的，而且其非對稱性可以被外部磁場即時控制 . 1.2.2 物理起源：螺旋自旋-動量鎖定的拓撲態 Parkin 等人將這些非傳統的超導行為，歸因于 1T-PtTe₂ 在費米能級附近存在的螺旋自旋-動量鎖定 (helical spin-momentum locking) 的拓撲表面態 . 他們提出，這些拓撲態的存在極大地提高了超導體 (Nb) 與 1T-PtTe₂ 之間的**介面透明度 (interface transparency)** . 一個高透明度的介面能夠抑制正常的單粒子反射，並促進長距離的、相位調和的高階安德烈夫反射 (phase-coherent higher-order Andreev reflections)` . 這種高階的穿隧過程，正是產生巨大二階諧波超電流和顯著 JDE 的微觀物理機制。
1.2.3 方法學的嚴謹性：排除幾何與自場效應
該研究的一個重要貢獻是，它系統性地區分了由材料內稟物理（拓撲態）產生的 JDE，與由元件幾何形狀或自場效應 (self-field effect, SFE) 等外部因素導致的非互易性 . 在寬的約瑟夫森接面中，流經自身的電流會產生一個不可忽略的磁場，破壞電流分佈的均勻性，從而導致一個偽造的、非內稟的二極體效應 .
為了排除這種幾何偽影，作者特別設計了一種「十字交叉 (criss-crossed)」的電極結構。實驗證明，這種結構可以有效地補償自場效應，將由幾何因素導致的 JDE 降至最低，從而確保觀測到的二極體效應主要源於 1T-PtTe₂ 的內稟材料特性 ``. 這種嚴謹的實驗設計，為後續在該體系中的研究樹立了典範。

1.3 本文研究動機與架構 (Motivation and Thesis Outline)
如前文所述，Parkin 等人的開創性工作已經證實，在 1T-PtTe₂ 約瑟夫森接面中存在由其拓撲電子態所主導的、巨大的約瑟夫森二極體效應 (JDE) ``. 他們的研究強烈地暗示了此系統的電流-相位關係 (CPR) 中，包含一個顯著的二階諧波分量，這是其非傳統性的直接體現。
然而，先前的工作主要是透過對單一接面二極體效應的分析來間接推斷 (indirectly infer) CPR 的形式。一個更直接、更具決定性的證據，即利用非對稱 SQUID 干涉儀對 CPR 進行直接的相位解析量測與重構 (direct phase-resolved measurement and reconstruction)，仍有待實現。
鑑於此，本論文的核心研究動機，便是補足這一關鍵的實驗環節。我們旨在透過設計、製備並量測基於 1T-PtTe₂ 的非對稱超導量子干涉儀，達成以下幾個核心科學目標：

- 目標一: 直接重構 1T-PtTe₂ 接面的電流-相位關係，並定量分析其中高階諧波分量的具體形式與比重。
- 目標二: 系統性地研究 CPR 的形式如何隨外部磁通量等參數進行演化，以驗證其「可調控性」。
- 目標三: 將直接測得的 CPR 與觀測到的約瑟夫森二極體效應進行直接比對，以建立兩者之間明確的因果關係，從而驗證其內稟的物理起源。
為闡述此研究的全貌，本論文的架構安排如下：
- 第一章、緒論 (Chapter I, Introduction): 對本研究的背景、動機與核心概念（包括新興材料、SQUID、非傳統CPR及JDE）進行系統性的介紹。
- 第二章、樣品製備與表徵 (Chapter II, Sample Fabrication and Characterization): 詳細闡述從材料剝離、對準標記製作、多步驟電子束微影到金屬沉積與剝離的完整元件製備流程。
- 第三章、實驗裝置與量測方法 (Chapter III, Experimental Setup and Methodology): 系統性地介紹用於本研究的極低溫量測平台，包括稀釋制冷機、向量磁鐵、超低噪聲量測電子系統以及數據擷取框架。
- 第四章、實驗結果與討論 (Chapter IV, Results and Discussion): 呈現本論文的核心數據，包括元件的基礎 I-V 特性、夫朗和費干涉圖樣，並重點展示從非對稱 SQUID 量測中重構出的電流-相位關係及其磁通量調控行為。本章也將對觀測到的約瑟夫森二極體效應進行深入分析。
- 第五章、結論與展望 (Chapter V, Conclusion and Outlook): 總結本論文的主要研究成果，並對未來可能的研究方向，如利用 PtTe₂ 開發新型拓撲超導量子元件等，進行展望。

# **Chapter II. Device Fabrication**

## 2.1 Material Preparation

### 2.1.1 **Flux zone  Growth Method**

## 2.2 Exfoliation

本章將詳細說明本實驗使用機械剝離法（Mechanical Exfoliation Method）得到二維材料層狀薄片（Flake）的完整流程與方法，包括基板預處理、膠帶黏貼剝離。

### 2.2.1 **Substrate Preparation**

本實驗使用的基板為低電阻重參雜P型單面矽/熱氧化二氧化矽基板（NOVA electronics #HS39626-OX：4”, P-type, <100>, 1.0∼ 5.0 × 10−3Ω· 𝑐𝑚 Resistivity, 2850 A°±5% Dry Thermal Oxide）。

1. 將7×7mm大小的破片放入140 °C的二甲基亞碸（DMSO, Dimethyl sulfoxide）溶劑中靜置1小時，以去除基板上保護用的S1813正型光阻薄膜。
2. 將破片放入40 °C的Acetone溶劑中去除DMSO，約1分鐘後再放入IPA溶劑中進行潤洗後取出，接著使用氮氣槍吹乾基板表面。
3. 使用O2 Plasma進行基板表面清潔，使用前用100% Power, 50 SCCM, 5 mins進行腔體清潔，過程中需觀察腔體內電漿顏色，以確保管路中沒有O2以外的其他氣體。使用100% Power, 40 SCCM, 10 mins進行基板表面清潔。完成後儘速將基板放置於手套箱內開始進行剝離以避免水氣附著。

### 2.2.2 **2D Materials Exfoliation**

本實驗使用的膠帶為Nitto SPV-224PR-MJ，以下簡稱藍膠。

1. 確認手套箱內水氧值皆小於0.5ppm，將零號藍膠（Tape 0）膠面朝上固定於平面，用鑷子將夾取PtTe2塊材（Bulk）放置於Tape 0上。
2. 一號藍膠（Tape 1）膠面朝下覆蓋於Tape 0後使用棉棒輕推表面確保確實兩膠面接觸，撕開兩片膠帶實現層與層的分離。
3. 重複步驟2，直到塊材佈滿大於7×7mm大小的面積範圍後將Tape 0用另一片藍膠覆蓋後收納備用。
4. 將Tape 1膠面朝上固定於平面，二號藍膠（Tape 2）膠面朝下覆蓋於Tape 1後使用棉棒輕推表面確保確實兩膠面接觸，撕開兩片膠帶實現層與層的分離後將Tape 1用另一片藍膠覆蓋後收納備用。
5. 重複步驟4，直到塊材分布密度合適，以PtTe2為例通常為Tape 4或5。
6. 使用電磁加熱烤盤（）以120 °C加熱基板10分鐘後靜置1分鐘。
7. 將基板放置於平面，藍膠膠面朝下並傾斜一小角度使其一側接觸基板後使用棉棒輕推表面，確保膠面與基板表面確實接觸且無氣泡後靜置5分鐘。
8. 撕開膠帶實現層與層的分離後將基板置於可重複使用真空密封食品壓縮袋，使用手持式真空保鮮機抽真空後拿出手套箱。
9. 儘速將基板移動至旋轉塗佈機（Spin Coater）使用PMMA A6以500 rpm 旋轉 5 秒, 以高加速度升速至最終轉速4000 rpm，此旋塗步驟總時長為 55 秒。
10. 使用180 °C預烤（Prebake）基板3分鐘即完成機械剝離流程。

## 2.3 **Microscopy**

本章將詳細說明本實驗使用的各種顯微鏡及其目的與使用方式。

### 2.3.1 **Optical  Microscopy**

本實驗使用的光學顯微鏡（OM, Optical Microscope）為KEYENCE  VHX-7000N，使用目的主要有以下幾種：

1. 尋找與定位二維材料層狀薄片（Flake）：
完成機械剝離流程後，透過光學顯微鏡（OM, Optical Microscope）初步判斷是否有PtTe2薄片，並使用VHX-7000N的連續拍攝功能拍攝基板的四個角落及薄片照片，並得到座標
2. 確認曝光後顯影結果：
完成顯影流程後，透過OM判斷曝光結果，確認線寬與曝光劑量是否正確，並使用「量測與標尺」功能拍攝照片並標注量測結果。
3. 確認Markers蒸鍍後離舉結果：
完成離舉流程後，透過OM判斷Markers蒸鍍結果，確認Markers是否確實離舉無相連部分，並用適當倍率拍攝Markers與目標薄片同框的照片以供後續數位化流程使用。
4. 確認Contacts濺鍍後離舉結果：
完成離舉流程後，透過OM判斷Contacts濺鍍結果，確認小線寬部分是否確實離舉無相連部分，並使用「量測與標尺」功能拍攝照片並標注量測結果。
5. 確認打線結果：
完成打線流程後，透過OM判斷打線結果，確認基板上供接線轉接用之銲墊（Bonding Pad）和PCB上金銲線連接指（Bonding Finger）與鋁銲線頭是否確實相連，並檢查鋁銲線無相互接觸以避免短路或形成預期外的電路通路。使用「圖片連接」功能用適當倍率拍攝所有金打線板與基板的照片，以供後續量測時作為線路參考。

### 2.3.2 **Atomic Force Microscopy**

本實驗使用的原子力顯微鏡（AFM, Atomic Force Microscopy）為Park systems NX10，判斷目標PtTe2薄片的層數 ，與確認接觸金屬的厚度與形貌

為了對元件的微觀結構與形貌進行精確表徵，本研究採用了一台 **Park Systems NX10 原子力顯微鏡**進行量測。AFM 在此研究中扮演了兩個關鍵角色：(1) 鑑定機械剝離 (mechanically exfoliated) 的 PtTe₂ 薄片的厚度與層數；(2) 確認蒸鍍金屬電極的厚度、表面粗糙度與邊緣形貌。

所有 AFM 量測均在**非接觸模式 (non-contact mode)** 下進行，以最小化探針與樣品表面之間的交互作用，從而保護脆弱的二維材料薄片與金屬結構不被物理損傷。

首先，對於 PtTe₂ 薄片，我們透過量測其表面與周圍 SiO₂ 基板之間的**步階高度 (step height)** 來確定其物理厚度。基於已知的 PtTe₂ 材料層間距 `[需提供 PtTe₂ 的層間距並引用文獻]`，我們可以從量測到的厚度推算出薄片的原子層數。這一步驟對於篩選出符合實驗需求的特定層數（例如單層或少層）的樣品至關重要。

其次，在完成電極蒸鍍製程後，我們利用 AFM 對接觸金屬NbTi的形貌進行檢測。分析的重點包括金屬膜的表面粗糙度 (surface roughness)、顆粒大小 (grain size) 以及電極圖案的邊緣清晰度。同時，透過量測金屬與基板的步階高度，我們可以驗證其實際沉積厚度是否與蒸鍍儀器設定的目標值一致。此項表徵是確保元件具備良好歐姆接觸與電氣性能的關鍵品質控制環節。

### 2.3.3 **Scanning Electron Microscopy**

## 2.4 **E-Beam Lithography(EBL)**

本研究中所有奈米級圖案的定義，例如對準標記與元件電極，均是透過電子束微影技術完成。整個流程在一台 Raith PIONEER Two 掃描式電鏡/電子束微影系統上執行 。以下將詳述其製備、曝光與顯影的具體步驟。

### 2.4.1 Resist Preparation

在進行圖案定義之前，首先須在樣品表面旋塗一層電子束抗蝕劑。

`[請確認是否進行了基板清潔步驟，例如：丙酮/異丙醇超音波震盪]`。本實驗選用聚甲基丙烯酸甲酯 (Poly(methyl methacrylate), PMMA) A6 等級作為正向抗蝕劑 。旋塗程序分為兩階段：首先以 500 rpm 的低速旋轉 5 秒，以確保抗蝕劑均勻散佈，隨後以 4000 rpm 的高速旋轉 55 秒，以達到最終所需的厚度 。旋塗完成後，樣品被放置於 180°C 的熱板上烘烤 180 秒，目的是為了完全去除抗蝕劑中的溶劑並使其固化 。

### 2.4.2 Pattern Exposure

抗蝕劑準備完成後，樣品被送入 EBL 系統的真空腔體中進行圖案曝光。所有的曝光步驟均在 20 kV 的加速電壓下進行 。此流程同樣分為兩步：

1. **對準標記曝光**: 
第一步是在樣品上定義大面積的對準標記 (alignment markers)，這些標記將作為後續高精度圖案疊對的基準。為實現快速曝光，此步驟選用了 120 µm 的大光圈 (aperture) 以獲得約 12 nA 的較大電子束流，並採用 370 μC/cm² 的面積劑量 (area dose) 進行寫入 。
2. **接觸電極曝光**: 
在系統通過對準標記精確鎖定 PtTe₂ 薄片的位置後，進行第二步高解析度的接觸電極圖案曝光。為確保圖案的精細度與邊緣的陡峭度，此步驟換用 30 µm 的小光圈，將束流精細地控制在約 0.3 nA，並以 375 μC/cm² 的劑量進行寫入 。

### 2.4.3 Development

曝光完成後，將樣品從系統中取出進行化學顯影，以溶解經電子束照射後分子鏈斷裂的 PMMA 區域。樣品被沉浸於甲基異丁基酮 (MIBK) 與異丙醇 (IPA) 體積比為 1:3 的混合溶液中 。整個顯影過程在 23°C 的恆溫環境下精確控制 50 秒 。隨後，為終止顯影反應，樣品被迅速轉移至純 IPA 溶液中浸泡 20 秒，以沖洗並去除殘留的顯影劑 。完成此步驟後，樣品表面即形成了所需圖案的抗蝕劑模板，可供後續的金屬沉積與剝離 (lift-off) 製程使用。

## 2.5 Thermal Evaporation Deposition

### 2.5.1 Thermal Evaporation Deposition **of Normal Metals**

為了能夠在後續的電子束微影 (EBL) 步驟中，將奈米級的電極圖案精確地疊對 (align) 到目標 PtTe₂ 薄片上，我們首先在 SiO₂/Si 基板上製作了一組金屬材質的全域對準標記 (global alignment markers)。

標記的圖案首先透過 `[請確認定義標記圖案的方法，例如：標準光刻 (photolithography) 或第一輪的 EBL]` 技術被定義在抗蝕劑層上。在完成顯影後，樣品被送入一台 **Korvus HEX 桌上型物理氣相沉積 (PVD) 系統**中進行金屬沉積。該系統的核心是一個四腔電子束蒸發器，其原理是利用高能電子束在真空環境下直接轟擊並加熱裝有源材料的坩堝，使材料蒸發。

為確保標記的穩定性與高對比度，我們採用了雙層金屬結構。在腔體被抽至低於 `[請提供基礎壓力]` 的高真空環境後，依序蒸鍍：

1. **附著層 (Adhesion Layer)**：一層約 `[請提供 Cr 厚度]` nm 厚的**鉻 (Cr)**，用以增強標記與基板的附著力。
2. **對比層 (Contrast Layer)**：一層約 `[請提供 Au 厚度]` nm 厚的**金 (Au)**，其較高的原子序數能夠在掃描式電子顯微鏡 (SEM) 下提供清晰的二次電子或背向散射電子圖像，從而利於 EBL 系統進行自動識別和對位。

金屬沉積完成後，透過在 `[請提供剝離溶劑]` 中進行**剝離 (lift-off)**，移除抗蝕劑，最終在基板表面留下永久性的 Cr/Au 金屬對準標記。這些標記為所有後續的材料轉移和微影製程提供了一個固定的、高精度的參考坐標系。

## 2.6 Sputter Deposition

最終用以連接 PtTe₂ 元件的超導電極，是透過一套包含原位 (in-situ) 介面清潔與磁控濺鍍 (magnetron sputtering) 的整合性製程完成。所有步驟均在 Aja Orion 8 物理氣相沉積 (PVD) 系統中執行，以確保最佳的介面品質。

### 2.6.1 Interface Cleaning: In-situ Ion Milling

在沉積超導金屬之前，為了確保金屬與 PtTe₂ 材料之間形成一個潔淨、低電阻的歐姆接觸 (Ohmic contact) 介面，我們對樣品進行了一道原位的離子束蝕刻處理。該過程在氬氣 (Ar) 環境下進行（流量控制在 10.4 sccm），離子源以 600 V 的加速電壓產生離子束，對樣品表面進行持續 30 秒的輕微物理蝕刻。此步驟旨在有效去除先前 EBL 製程中可能殘留的任何抗蝕劑殘渣或樣品表面的自然污染物。

### 2.6.2 Sputter Deposition **of Superconducting Metals**

介面清潔完成後，樣品維持在高真空環境中，不破壞真空，立即進行超導薄膜的沉積。我們選擇**鈮鈦 (NbTi)** 合金作為超導接觸電極材料。濺鍍製程在 3 mTorr 的氬氣工作壓力下進行。一個 300 W 的直流 (DC) 電源被施加於 NbTi 靶材上，使其原子被濺射並沉積到樣品表面，最終形成一層厚度為 70 nm 的均勻薄膜。

## 2.7 **Lift-off P**rocess

### 2.7.1 **Lift-off for Markers**

### 2.7.2 **Lift-off for Contacts**

完成濺鍍後，樣品從真空系統中取出，並執行最後的剝離步驟以定義出最終的電極圖案。樣品浸泡於 `[請提供剝離溶劑，例如：丙酮]` 中 `[請確認時間與是否使用超音波輔助]`，以溶解下層的 PMMA 抗蝕劑，並移除覆蓋其上的多餘 NbTi 薄膜。此步驟完成後，僅留下在 EBL 步驟 (`2.4`) 中定義的、且與 PtTe₂ 直接接觸的超導電極結構。

# **Chapter III. Device Characterization**

## 3.1 Measurement Setup

本研究旨在探討特定樣品在低溫環境及外加磁場下的電運輸性質 (Electrical Transport Properties)。為此，我們搭建了一套基於四端點量測法(Four-Point Probe Method) 又名開爾文測量法（Kelvin sensing）的直流電學量測系統。本章節將詳述其量測原理、實驗架構與操作步驟。

### 3.1.1 **Dilution Refrigerator**

為實現對樣品在毫開爾文 (milli-Kelvin, mK）溫度區間的量子現象觀測，本研究採用了一套 Bluefors 公司製造的 LD-400 型濕式稀釋制冷系統（Wet Dilution Refrigerator System）。該系統能夠提供約40 mK的穩定基礎溫度（Base Temperature）。提供如此低的實驗環境至關重要，其主要目的有二：第一，確保樣品溫度遠低於其超導轉變溫度 (Tc)10K，使樣品能完全進入並穩定維持在超導態；第二，有效抑制因熱能 （kBT）引起的熱擾動（Thermal Fluctuations），從而降低量子退相干（Quantum Decoherence） 效應，使得如電流-相位關係（Current-Phase Relation） 等微弱的宏觀量子現象（macroscopic quantum effects)）得以被精確地量測。為進一步提升實驗效率，本系統配備了底部裝載快速樣品更換（Bottom-Loading Fast Sample Exchange, FSE） 機構。該機構允許在主制冷系統各級冷盤（如 4K plate 與 Still plate）皆保持在低溫狀態的情況下，獨立地將樣品載台（Sample Holder） 取出更換。相較於需要數日才能完成一次完整熱循環（升溫至室溫再降溫）的傳統方式，FSE 系統將更換樣品所需的週期縮短至14小時 。此功能極大地提高了樣品測試的效率，對於需要進行多輪製程參數迭代與多個元件篩選及特性比對的研究工作至關重要。

### 3.1.2 **Superconducting Magnet System**

為研究樣品在不同磁場強度與方向下的物理特性，本實驗系統集成了一套 Bluefors 製造的三維向量磁鐵 (3D Vector Magnet)。該磁鐵系統的核心由三組相互正交的超導線圈構成，能夠在主軸 (Z-axis) 方向上產生最高達 9 特斯拉 (Tesla) 的磁場，並在與之垂直的兩個次軸 (X-axis and Y-axis) 方向上分別產生最高 1 T 的磁場，此即為一組 9-1-1 T 組態。這種三軸向量能力使得我們可以在三維空間中產生任意方向的磁場向量，從而對樣品的各向異性 (anisotropy) 或需要精確磁場對位的現象 `[需說明樣品安裝的參考方向，例如 Z-axis 垂直於樣品表面]` 進行深入探討。

整個磁鐵系統的驅動與控制由一套 American Magnetics, Inc. (AMI) 的整合式電源供應系統負責。該系統包含三組獨立的磁鐵電源，其輸出電流由一台 AMI Model 430 電源程式控制器進行精密調控。此控制器不僅確保了各軸磁場的穩定性，更允許我們透過電腦程式自動化地控制磁場向量的大小、方向以及場掃描速率 (ramp rate) `[可補充典型的磁場掃描速率，例如 10 mT/min]`，以執行複雜的磁場掃描序列。

### 3.1.3 **Cryogenic Wiring and Custom PCB Sample Holder**

為了在將直流與射頻 (RF) 信號從室溫儀器傳導至毫開爾文溫區的量子元件時，最大程度地抑制傳導熱負載 (conducted heat load) 與電磁雜訊，本實驗搭建了一套多級濾波與熱錨方案。此方案的核心在於混合使用了商業化的低溫濾波器模組與客製化的終端樣品電路板。

**直流/低頻線路濾波 (DC/Low-Frequency Line Filtering)**所有通往樣品的直流與低頻控制線路，都經過一套 QDevil 公司生產的 QFilter 模組進行濾波 。此模組被牢固地安裝於稀釋制冷機的混合腔冷盤 (Mixing Chamber plate) 上，以確保信號線及濾波器元件本身都能與 mK 溫區達到充分的熱平衡 。我們採用的是標準的雙級濾波組態，將一個 24 通道的低頻 RC 濾波板與一個 24 通道的高頻 LC 濾波板進行串聯 。RC 濾波級的衰減起始於 65 kHz，而 LC 濾波級則針對 225 MHz 以上的射頻雜訊提供有效衰減 。

**客製化樣品座與高密度線路 (Custom Sample Holder and High-Density Wiring)**經過主濾波級後，信號透過一套高密度、模組化的線路連接至安裝有兩個樣品

`(2 X PCB)` 的客製化樣品座。該線路方案利用了多芯數的 Micro-D 連接器（如 51-pin 及 100-pin）對多達 48 個獨立的信號通道進行整合與管理 。在制冷機內部，這些信號透過多組（例如 4 組 12 對）磷青銅雙絞線 (Twisted Pair) 進行傳輸。最終，在室溫端的接口面板，線路被轉換為 Fischer 24-pin 連接器，以便與外部的量測儀器相連 。整個信號路徑的設計旨在確保信號完整性、最小化串擾 (crosstalk)，並提供穩固可靠的連接。

**高頻線路濾波 (High-Frequency Line Filtering)**
對於 RF 控制線路，則採用了不同的濾波策略。在同軸線路中，我們安裝了 Low-loss Infrared (IR) Filter，其主要功能是阻擋來自較高溫級的紅外光子直接輻射到樣品，以降低對量子態的干擾。該濾波器在有效阻擋紅外輻射的同時，對 DC 至 6 GHz 的工作信號僅有小於 1 dB 的插入損耗。

### 3.1.4 Current-Voltage(I-V)  Measurement System

為了全面性地鑑定元件的電學特性，本研究建立的 I-V 量測系統涵蓋了兩個關鍵階段：(1) 在室溫下對大量元件進行快速的初步篩選；(2) 在極低溫環境中對通過初篩的元件進行高精度的特性量測。

**3.1.4.1 室溫初步特性鑑定 (Room-Temperature Pre-characterization)**

在此測試組態中，激勵電流 (stimulus current) 由一台 Keithley 2400 源-量測單元 (SMU) 提供，該儀器被設定於電壓源模式，其輸出經過一個 100 kΩ 的串聯電阻轉換為電流源。此電流隨後被路由至待測元件，而元件上的響應電壓則由一台 Basel Precision Instruments (BPI) Model SP1004 低噪聲差動放大器進行放大，並由 Keithley DMM6500 萬用電錶讀取。為了能對晶片上的大量元件進行高效的自動化測試，整個信號的路由與切換由兩台 Quantum Machines 生產的 24 通道 QDAC 模組構成的矩陣交換器進行管理。

**3.1.4.2 極低溫 I-V 特性精細量測 (Cryogenic I-V Characterization)**

低溫下的高精度 I-V 量測，其核心由一套由台夫特理工大學 (Delft University of Technology) 設計與製造、專為低溫量子測量開發的、電池供電的 **IVVI-DAC2-rack** 系統執行。採用電池供電是為了實現與外部儀器電源的電氣隔離 (galvanic isolation)，從根本上消除接地迴路 (ground loops) 和來自電力線的雜訊。

**信號路由與儀器配置 (Signal Routing and Instrument Configuration)**
從低溫恆溫器引出的主線纜，其信號首先被轉換至四個 24-pin 的 Fischer 接口面板。實驗時，根據待測元件的位置，我們從中選取兩路 Fischer 插頭，將其連接至兩台 24 通道的 **Matrix-rack** 模組化跳線盤。這個 Matrix-rack 作為連接低溫世界與室溫儀器的中樞，其內部的 MCX 連接器跳線面板允許我們對每一條獨立的信號線進行靈活、精確的配置。對於一組特定的四端點量測，指定的線路通過 MCX-to-LEMO 轉接線，被分別連接至 IVVI-rack 中的功能模組：

- **電流源 (Current Source)**: 負責施加偏壓的線路 (I+,I−) 被連接至一個 **S4m 電流源模組**。該模組的輸出電流量程可手動設置，而其精確的電流大小則由 IVVI-rack 內建的 DAC 進行掃描控制。我們採用此模組的**對稱 (symmetric)** 輸出模式進行量測。在此模式下，模組同時提供正、負兩路相對於地電位對稱的電壓輸出，其主要優點是能夠最小化樣品上可能出現的共模電壓 (common-mode voltage)，並有效倍增電壓源的輸出擺幅 (output swing)。
- **電壓量測 (Voltage Measurement)**: 負責感測電壓的線路 (V+,V−) 被連接至一個 **M2b 電壓量測模組**。此模組是專為實現極低的 1/f 噪聲而優化的 JFET 輸入級差動放大器，其輸入電壓噪聲密度在 10 Hz 以上時低至 2 nV/√Hz。

經過 M2b 模組放大後，類比電壓信號從機架的隔離環境中被輸出，並最終由一台 Keithley DMM6500 6½-Digit 數位萬用電錶進行高精度數位化及數據記錄。

### 3.1.5 RF Signal Generator

為了探測樣品的 AC 約瑟夫森效應 (AC Josephson effect)，本實驗系統集成了一套射頻 (RF) 信號傳輸路徑，用以對樣品施加一可控的微波輻射場。

此微波信號由一台 **Rohde & Schwarz (R&S) SMB100A** 信號產生器負責生成。針對夏皮羅台階 (Shapiro steps) 的量測，該儀器被設定為輸出一段頻率與振幅皆恆定的**連續波 (Continuous Wave, CW)** 信號 `[請提供典型的頻率與功率範圍，例如 4-8 GHz，-30 至 0 dBm]`。

該 RF 信號從室溫端的儀器，經由一條專用的同軸線纜被引導至位於低溫恆溫器混合腔中的樣品處。此線路由 `[請確認 RF 線纜類型，例如：不鏽鋼或超導材質的半剛性同軸線纜]` 構成。為了精確控制到達樣品的微波功率，並同時最小化線纜帶來的熱負載，我們在線路中的不同溫級（例如 4K 冷盤與 Still 冷盤）上串聯了多級**低溫衰減器 (cryogenic attenuators)** `[請提供各溫級衰減器的數值，例如：-20 dB]`。最終，經過衰減後的微波信號，透過 `[請描述耦合方式，例如：一個安裝在樣品附近的微型天線、一個電感環路，或直接耦合至樣品的閘極線路]` 的方式與樣品發生交互作用。

透過掃描微波的頻率 (f) 與功率，我們可以觀測到樣品的 I-V 曲線上出現一系列電壓間隔為 ΔV=hf/2e 的量子化平台，即夏皮羅台階。

### 3.1.6 Data Acquisition Framework: QCoDeS

本研究的所有實驗控制、儀器協調與數據擷取流程，均基於

**QCoDeS** (Quantum Code and Data acquisition System) 軟體框架實現 。QCoDeS 是一個基於 Python 的開源框架，由哥本哈根/代爾夫特量子計算聯盟等機構開發，旨在為量子計算與凝聚態物理實驗提供一個標準化、模組化的軟體基礎設施 。我們選用此框架的核心原因在於其強大的儀器抽象能力與結構化的數據管理模型，這使得複雜的實驗流程得以簡化，並確保了數據的高度可追溯性。

在我們的具體實現中，所有實驗儀器（如 IVVI-rack 模組、信號產生器、數位電錶等）均被分別封裝為 QCoDeS 的

`Instrument` 物件，其可控屬性則對應為 `Parameter` 。整個實驗裝置由一個

`Station` 物件進行統一管理，其詳細配置透過 YAML 檔案進行定義與載入，確保了實驗設置的靈活性與可重現性 。所有的量測序列，無論是簡單的線性掃描還是複雜的多維掃描，都透過 QCoDeS 的

`Measurement` 上下文管理器執行 。在每次量測運行 (

`run`) 開始時，系統會自動擷取所有儀器參數的**快照 (snapshot)**，並與實驗數據一同儲存 。

所有實驗數據都被結構化地儲存於一個以 SQLite 為後端的本地數據庫中 。每一個

`DataSet` 實例都包含完整的元數據、儀器快照以及量測結果，並被賦予一個**全域唯一識別碼 (GUID)**，極大地增強了數據的可追溯性、完整性與共享便利性 。

## 3.2 **Experimental Realization**

### 3.2.1 **I-V Characteristics**

元件的基礎直流傳輸特性，是透過在 `[請提供量測溫度，例如 100 mK]` 的恆定溫度下，量測其電壓-電流 (I-V) 特性曲線來進行鑑定。圖 `[請插入圖號]` 展示了一條具代表性的 I-V 曲線，該曲線是透過緩慢掃描偏壓電流 (Ibias) 並同時記錄元件兩端的電壓降 (V) 而獲得的。

如圖所示，當偏壓電流從零開始增加時，元件首先展現出零電壓的狀態 (V=0)，此即為直流約瑟夫森效應 (DC Josephson effect) 所導致的無耗散超導電流分支。此超導態可一直維持，直到偏壓電流超過一個臨界閾值，此時接面會突然切換 (switch) 至一個具有有限電壓的電阻態。實驗上觀測到的這個切換點，我們定義為**切換電流 (switching current, Isw)**，對於圖中所示的元件，其值約為 120 µA。

在切換至電阻態後，I-V 特性遵循一個線性的歐姆關係，其斜率 (dV/dI) 即為接面的**正常態電阻 (normal-state resistance, RN)**，從圖中可估算出其值約為 `[請提供 Rn 值]` Ω。

當偏壓電流反向掃描（從高電流向零點掃描）時，我們觀察到顯著的**遲滯現象 (hysteretic behavior)**。接面並不會在 Isw 處立即返回超導態，而是維持在電阻分支上，直到電流降低至一個更小的值，即**回滯電流 (retrapping current, Ir)** 時，才重新「掉落」回零電壓的超導態。對於此元件，Ir 的觀測值約為 10 µA。

這種由切換電流與回滯電流之間巨大差異 (Ir≪Isw) 所構成的遲滯迴線，是**欠阻尼 (underdamped)** 約瑟夫森接面的典型特徵。此行為可由 Stewart-McCumber 模型 `[需引用 Stewart-McCumber 模型]` 進行描述，其遲滯程度由無因次的史都華-麥肯柏參數 βc=(2e/ℏ)IcRN2C 所決定。觀測到的顯著遲滯意味著此接面的 βc>1。

### 3.2.2 Fraunhofer Interference Patterns

為了進一步探測接面內部超導電流的空間分佈特性，我們量測了其臨界電流 Ic 作為外加磁場函數的調變行為。實驗中，我們施加一個垂直於樣品平面的磁場 (B⊥)，並在每一個固定的磁場點，透過掃描 I-V 曲線來測定其切換電流 Isw，並將其作為該磁場下的臨界電流值，即 Ic(B⊥)。

量測結果如圖 `[請插入圖號]` 所示。圖中清晰地展示了臨界電流隨磁場變化的干涉圖樣。在零磁場時，臨界電流達到其最大值 Ic0。隨著磁場強度的增加，臨界電流呈現出週期性的振盪，並在特定磁場下降至極小值。此圖樣的整體輪廓與光學中的單狹縫夫朗和費繞射 (Fraunhofer diffraction) 圖樣高度相似，因此被稱為**夫朗和費圖樣**。

在理想的、電流均勻分佈的短接面模型中，臨界電流與磁通量的關係可由以下公式描述：

Ic(B)=Ic0

[](data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="0.333em" height="2.400em" viewBox="0 0 333 2400"><path d="M145 15 v585 v1200 v585 c2.667,10,9.667,15,21,15
c10,0,16.667,-5,20,-15 v-585 v-1200 v-585 c-2.667,-10,-9.667,-15,-21,-15
c-10,0,-16.667,5,-20,15z M188 15 H145 v585 v1200 v585 h43z"></path></svg>)

πΦ/Φ0sin(πΦ/Φ0)

[](data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="0.333em" height="2.400em" viewBox="0 0 333 2400"><path d="M145 15 v585 v1200 v585 c2.667,10,9.667,15,21,15
c10,0,16.667,-5,20,-15 v-585 v-1200 v-585 c-2.667,-10,-9.667,-15,-21,-15
c-10,0,-16.667,5,-20,15z M188 15 H145 v585 v1200 v585 h43z"></path></svg>)

其中 Φ=B⊥⋅Aeff 是穿過接面有效面積 (Aeff) 的磁通量，而 Φ0=h/2e 是超導磁通量量子。

從實驗數據中，我們觀察到第一個極小值出現在約 5 mT 的磁場處。更重要的是，整個干涉圖樣呈現出高度的左右對稱性，並且在極小值處的電流抑制非常顯著。這些特徵強烈地表明，我們所製備的接面具有非常**均勻的超導電流密度分佈**。根據第一個極小值出現的位置 (Bmin,1)，我們可以透過關係式 Aeff=Φ0/Bmin,1 來估算出接面的有效磁學面積 `[可計算出 A_eff 的數值並與元件的幾何尺寸進行比較]`。

### 3.2.3 Current-Phase Relation(CPR)

# **Chapter IV. Results**

## 4.1 Basic Device Characterization

### 4.1.1 I-V Characteristics at Base Temperature

### 4.1.2 R-T Measurements and Superconducting Transitions

### 4.1.3 Estimation of $I_cR_N$ Product

## 4.2 Fraunhofer Pattern Response to Magnetic Fields

### 4.2.1 Standard Fraunhofer Pattern ($B_∥=0$)

### 4.2.2 Evolution of Fraunhofer Pattern with In-Plane Magnetic Fields $B_∥$

## 4.3 Current-Phase Relation Analysis

### 4.3.1 Unconventional CPR Features 
### 4.3.2 Correlation between Fraunhofer Asymmetry and CPR Unconventionality

# **Chapter V. Discussion**

## 5.1 Origin of Asymmetric Fraunhofer Patterns in PtTe₂ SQUIDs

## 5.2 Nature and Origin of  Unconventional CPRs

## 5.3

## 5.4 **Fabrication Challenges**

### 5.4.1 Flake Size and Thickness

### 5.4.2 **TMD Surface Protection and Residues Cleaning**

### 5.4.3 **Side-Wall Issue of Sputtered** Superconducting **Leads**

# **Chapter VI. Conclusion and Prospect**

## 6.1 **Conclusion**

## 6.2 **Prospect**

# References