# **從 Typst 到 Quarto：基於碩士論文口試簡報白皮書之跨平台簡報建構技術報告**

## **1\. 緒論：學術發表工具的典範轉移與整合挑戰**

在當代學術研究的生態系統中，文件製作工具的選擇不僅僅是格式的偏好，更涉及研究再現性（Reproducibility）、工作流效率以及知識傳播的有效性。長久以來，LaTeX 憑藉其對數學公式的精確排版與參考文獻管理的強大能力，壟斷了理工科系（STEM）碩博士論文的撰寫標準。然而，隨著 **Typst**——一種基於 Rust 語言開發的新世代排版系統——的橫空出世，其即時編譯（Incremental Compilation）、現代化的腳本語法以及極低的學習門檻，正逐漸挑戰 LaTeX 的霸主地位 1。

與此同時，**Quarto** 作為新一代的開源科學出版系統，正重新定義技術簡報的製作流程。Quarto 並非單純的排版引擎，而是建立在 Pandoc 之上的整合框架，它允許研究者將數據分析（R/Python）、敘事文本與互動式視覺化整合為單一工作流，並輸出為 HTML5 簡報（Reveal.js）、PDF 或 Word 1。

本報告旨在解決一個具體且高價值的學術場景：**如何將一份已完成的 Typst 格式碩士論文，依據嚴謹的「碩士論文口試簡報白皮書」規範，透過自動化與半自動化的轉換流程，遷移至 Quarto 平台以建構高品質的口試簡報。** 這並非單純的檔案轉檔，而是一場涉及語法映射（Syntax Mapping）、內容重構（Content Refactoring）與視覺修辭（Visual Rhetoric）的深度工程。

### **1.1 研究動機與技術背景**

碩士論文口試（Oral Defense）是研究生學涯中最關鍵的考核儀式。依據國立台灣大學、國立成功大學等頂尖學府的規範 6，口試簡報不僅是對論文內容的摘要，更是一場在嚴格時間限制下（通常為 20-25 分鐘）的邏輯辯證。

Typst 雖然在生成靜態 PDF 論文方面表現卓越，但其原生的簡報功能（如 Polylux 套件）生成的仍是靜態 PDF 投影片，缺乏現代網頁技術支援的互動性（如動態圖表、程式碼摺疊、碎片化呈現）。相比之下，Quarto 結合 reveal.js 引擎，能夠提供包括演講者視圖（Speaker View）、畫筆功能（Chalkboard）、以及響應式佈局在內的進階功能，這些對於口試現場的即時互動至關重要 10。

因此，建立一套從 Typst 原始檔案資料夾到 Quarto 簡報的標準化轉換路徑，對於採用新技術堆疊的研究生而言，具有極高的實用價值。

## ---

**2\. 碩士論文口試簡報白皮書：規範與策略**

在進入技術實作之前，必須先確立「目標規格」。所謂「碩士論文口試簡報白皮書」，並非單一文件，而是綜合了學術界對於學位考試的各項明文規定與不成文慣例的集合體。本章節整合了國內外學術機構的指導原則 12，定義了 Quarto 簡報必須達成的結構與視覺標準。

### **2.1 時間與結構的黃金比例**

口試簡報的核心限制在於**時間**。大多數系所嚴格規定報告時間為 20 至 30 分鐘，隨後進行委員提問。這意味著長達百頁的 Typst 論文必須進行極高強度的資訊壓縮。白皮書建議的結構如下表所示：

| 簡報區段 (Section) | 建議頁數 | 時間分配 | 內容重點與白皮書規範 |
| :---- | :---- | :---- | :---- |
| **封面與標題** | 1 | 1 分鐘 | 需包含論文題目、研究生姓名、指導教授、日期。**視覺上需展現專業度與學術莊重感**。 |
| **研究背景與動機** | 2-3 | 3 分鐘 | 定義問題（Problem Statement）。必須明確指出既有文獻的缺口（Gap）與本研究的貢獻定位。 |
| **文獻探討** | 2-3 | 2 分鐘 | **切勿羅列所有參考文獻**。僅展示與本研究最直接相關的關鍵理論框架，建立研究合法性。 |
| **研究方法 (Methodology)** | 4-6 | 5-7 分鐘 | **口試防禦的核心**。需詳細展示演算法流程、實驗設計、數學模型推導。此處需展現高度嚴謹性。 |
| **研究結果與分析** | 5-7 | 7-10 分鐘 | **論文的精華**。需運用圖表（數據視覺化）佐證發現。白皮書強調數據的誠實呈現與統計顯著性討論。 |
| **結論與建議** | 2-3 | 3 分鐘 | 收斂研究發現，提出具體貢獻、研究限制（Limitations）與未來展望。 |
| **致謝與 Q\&A** | 1 | \- | 感謝委員。隨後進入提問環節。 |
| **備用投影片 (Backup Slides)** | 無限制 | \- | **關鍵策略**。針對預期問題準備的詳細數據或推導，不計入報告時間但對防禦成功率至關重要。 |

### **2.2 視覺層次與認知負荷管理**

依據白皮書規範，簡報的視覺設計必須遵循「低認知負荷」原則。Typst 論文通常充滿密集的文字與公式，直接複製貼上是簡報製作的大忌。

* **字體策略**：標題應使用襯線體（Serif）以示莊重（如 Typst 預設風格），內文使用無襯線體（Sans-Serif）以利投影閱讀。  
* **版面配置**：嚴格禁止「文字牆（Wall of Text）」。每頁投影片應控制在 6-8 行重點。  
* **雙欄佈局**：對於理工論文，常需並列「公式推導」與「物理意義」或「程式碼」與「輸出結果」。Quarto 的 Column Layout 是實現此規範的關鍵技術 5。

## ---

**3\. 來源端分析：Typst 檔案結構與轉換阻礙**

要實現自動化或半自動化的轉換，首先必須解析 Typst 專案的解剖結構。Typst 的專案結構通常比單一 Markdown 檔案複雜，這對轉換構成了第一道門檻。

### **3.1 典型 Typst 論文資料夾結構**

一個標準的碩士論文 Typst 專案通常包含以下層級：

thesis-project/  
├── main.typ \# 主文件，負責 import 章節與設定全域樣式  
├── typst.toml \# 專案設定檔（套件依賴）  
├── chapters/ \# 章節資料夾  
│ ├── 01-intro.typ  
│ ├── 02-method.typ  
│ └──...  
├── figures/ \# 圖片資料夾  
│ ├── architecture.png  
│ └── plot.svg  
├── bib/ \# 參考文獻  
│ └── references.bib  
└── templates/ \# 自定義模板與函數  
└── thesis-template.typ

### **3.2 轉換的核心挑戰：語法阻抗不匹配（Impedance Mismatch）**

雖然 Pandoc 3.1.2+ 已經支援 Typst 讀取器（Reader），但 Typst 與 Quarto (Markdown) 之間存在本質上的架構差異 18：

1. **圖靈完備性（Turing Completeness）**：Typst 是一種具有程式邏輯的語言。論文中常使用自定義函數（如 \#theorem(title: "...")\[...\]）來生成內容。Pandoc 的讀取器主要是解析語法結構，無法「執行」這些 Typst 腳本。這意味著所有封裝在自定義函數中的內容，在轉換過程中極易遺失或變成原始代碼塊。  
2. **數學環境的微小差異**：Typst 的數學語法（$ x^2 $）雖然簡潔且與 LaTeX 相似，但其變數插入語法（$ \#x $）與部分函數名稱（如 mat() vs LaTeX 的 matrix）並不完全相容於 Quarto 所使用的 MathJax/LaTeX 渲染引擎。  
3. **引用系統衝突**：Typst 使用 @label 進行引用，Quarto 雖然也支援 @citation，但對於圖表交叉引用（Cross-reference）有更嚴格的 {@fig-label} 語法要求。

## ---

**4\. 技術實作一：轉換工程（From Typst to Quarto Markdown）**

本章節詳述如何將上述 Typst 資料夾結構轉換為 Quarto 可用的素材。這是一個結合自動化工具與人工介入的精細流程。

### **4.1 預處理：腳本淨化（Sanitization）**

在執行 Pandoc 之前，必須先對原始 .typ 檔案進行「淨化」，移除 Pandoc 無法理解的複雜 Typst 邏輯。建議使用 Python 或 Shell 腳本批次處理 chapters/ 資料夾下的檔案。

**關鍵操作：**

* **移除 Import 與 Set 規則**：.typ 檔頭通常包含 \#import "template.typ" 或 \#set page(...)。這些指令是為了 PDF 排版設計，對於 Quarto 簡報無效且會造成干擾，應予以刪除。  
* **正規化圖表語法**：若論文使用了自定義的 \#my-image() 函數，需利用 Regex（正規表示式）將其替換為標準的 \#figure(image(...)) 語法，因為 Pandoc 能夠識別標準的 Typst Figure 語法並將其轉換為 Markdown 的 \!\[Caption\](path) 20。

### **4.2 核心轉換指令：Pandoc 批次處理**

由於論文是分章節撰寫，我們應採用「分治法（Divide and Conquer）」，將每個章節獨立轉換為對應的 .qmd 檔案。

**Shell 批次轉換腳本範例：**

Bash

\#\!/bin/bash  
\# 建立輸出目錄  
mkdir \-p quarto\_src/chapters

\# 遍歷所有章節檔案  
for typ\_file in thesis-project/chapters/\*.typ; do  
    filename=$(basename \-- "$typ\_file")  
    filename="${filename%.\*}"  
      
    echo "Converting $typ\_file to Quarto Markdown..."  
      
    \# 呼叫 Pandoc 進行轉換  
    \# \-f typst: 輸入格式為 Typst  
    \# \-t markdown: 輸出為 Markdown  
    \# \--wrap=none: 不強制換行，方便後續編輯  
    pandoc "$typ\_file" \\  
        \-f typst \\  
        \-t markdown \\  
        \-o "quarto\_src/chapters/${filename}.qmd" \\  
        \--wrap=none  
done

### **4.3 後處理：語法映射修正（Syntax Refactoring）**

轉換後的 .qmd 檔案並非即插即用，必須依照下表進行語法修正，以符合 Quarto 的標準 22：

| 語法元素 | Typst 原始碼 | Pandoc 轉換結果 (可能) | Quarto 簡報修正目標 | 修正理由 |
| :---- | :---- | :---- | :---- | :---- |
| **標題** | \= Introduction | \# Introduction | \# Introduction | 相容，無需修正。 |
| **數學公式** | $ x \< y $ | $ x \< y $ | $ x \< y $ | 大部分相容。需檢查特殊符號如 arrow 需轉為 \\rightarrow。 |
| **圖片** | \#figure(image("p.png"), caption: "C") | \!\[C\](p.png) | \!\[C\](p.png){\#fig-label} | **關鍵**：需補上 {\#fig-id} 以支援交叉引用。 |
| **引用** | @ref1 | @ref1 | \[@ref1\] | Quarto 的文獻引用通常需要方括號。 |
| **表格** | \#table(...) | (通常為原始 HTML 或錯亂文字) | Markdown Table 或 knitr::kable | Typst 表格轉換極易失敗，建議重製或截圖。 |
| **程式碼塊** | \`\`\`typ | \`\`\`typ | \`\`\`python 或 \`\`\`r | 將 Typst 代碼塊改為可執行的 Python/R 代碼塊以展示動態結果。 |

## ---

**5\. 技術實作二：Quarto 簡報工程建構**

完成內容萃取後，下一步是依據「白皮書」規範，利用 Quarto 建立簡報專案。這不僅是貼上文字，而是架構一個完整的簡報軟體工程。

### **5.1 專案初始化與 YAML 設定**

Quarto 的核心控制在於 YAML Metadata。為了符合口試的學術規範，我們需要設定特定的參數以啟用 reveal.js 的進階功能。

**檔案：defense.qmd 的 YAML 配置：**

YAML

\---  
title: "基於深度強化學習之異質網路資源分配優化"  
subtitle: "碩士學位論文口試"  
author: "陳大文 (指導教授：林教授)"  
institute: "國立成功大學 資訊工程研究所"  
date: "2026-01-02"  
format:  
  revealjs:  
    \# 簡報主題：採用雙主題策略，先載入預設，再載入自定義 SCSS  
    theme: \[simple, custom\_defense.scss\]  
    \# 功能設定  
    slide-number: true          \# 顯示頁碼（白皮書規範：方便委員參照）  
    show-slide-number: all  
    logo: images/ncku\_logo.png  \# 校徽（白皮書規範：品牌識別）  
    footer: "114學年度碩士論文口試 | 陳大文"  
    width: 1600                 \# 16:9 寬螢幕  
    height: 900  
    auto-stretch: false         \# 禁止圖片自動過度拉伸  
    center: false               \# 內容預設置頂（適合學術條列）  
    transition: slide           \# 轉場效果  
    background-transition: fade  
    \# 互動功能  
    chalkboard: true            \# 啟用畫筆功能（回答問題時可用）  
    multiplex: false  
bibliography: bib/references.bib  
\---

### **5.2 視覺風格定義：自定義 SCSS 主題**

依據白皮書，簡報風格需「專業、簡潔、高對比」。預設主題往往過於休閒。透過 Quarto 的 SCSS 支援，我們可以微調變數以符合學術品味 24。

**檔案：custom\_defense.scss 內容範例：**

SCSS

/\*-- scss:defaults \--\*/  
// 定義學校品牌色 (以 NCKU 紅為例)  
$theme-color: \#B00000;  
$link-color: $theme-color;  
$selection-bg: rgba(176, 0, 0, 0.2);

// 字體設定：標題使用襯線體展現學術感，內文無襯線體  
$font-family-sans-serif: "Helvetica Neue", "Microsoft JhengHei", sans-serif;  
$presentation-heading-font: "Times New Roman", "DFKai-SB", serif;

// 字級設定：確保後排委員能看清  
$presentation-font-size-root: 32px;

/\*-- scss:rules \--\*/  
// 調整頁碼樣式  
.reveal.slide-number {  
  font-size: 20px;  
  color: $theme-color;  
  background-color: transparent;  
}

// 定義「定理」區塊樣式 (Theorem Block)  
.theorem {  
  border-left: 6px solid $theme-color;  
  background-color: rgba(0, 0, 0, 0.03);  
  padding: 15px;  
  margin-bottom: 20px;  
  border-radius: 0 5px 5px 0;  
}

// 強調重點的樣式  
.highlight-text {  
  color: $theme-color;  
  font-weight: bold;  
}

這段 SCSS 代碼將確保簡報的視覺輸出符合「白皮書」中對於可讀性與專業形象的要求，且無需在每一頁重複設定格式。

## ---

**6\. 內容重構策略：從論文到簡報的轉換藝術**

將 Typst 轉換為 Markdown 只是第一步，如何將 15,000 字的論文濃縮為 25 頁的簡報，需要特定的內容重構策略。

### **6.1 雙欄佈局的應用 (Two-Column Layout)**

在「研究方法」或「實驗結果」章節，白皮書強烈建議圖文並茂。Quarto 的 Column 語法是實現此目標的最佳工具 5。

**應用場景：左側解釋演算法，右側展示虛擬碼或架構圖。**

## **演算法核心架構**

:::: {.columns}

::: {.column width="60%"}  
階段一：特徵提取  
本研究採用改進型 ResNet-50 進行特徵提取。與傳統方法相比，主要差異在於：

* 引入注意力機制 (Attention Mechanism)  
* 替換最後的全連接層  
* **運算效率提升 15%**

:::

::: {.column width="40%"}  
{\#fig-arch width="100%"}  
:::  
::::

### **6.2 數學公式的轉換與呈現**

Typst 的數學公式在轉換到 Quarto 後，會透過 MathJax 渲染為 LaTeX 格式。

* **Typst:** $ x(t) \= A cos(omega t \+ phi) $  
* **Quarto:** $$x(t) \= A \\cos(\\omega t \+ \\phi)$$

**注意：** 在口試簡報中，避免推導過長的公式。若必須展示推導過程，建議使用 **碎片化揭示（Incremental Reveal）** 技術，利用 .fragment 語法逐步顯示公式的變形，引導委員的視線 28。

## **損失函數推導**

我們定義總損失函數 $L$ 如下：

$$L \= L\_{data} \+ \\lambda L\_{reg}$$  
::: {.fragment}  
其中，數據項 $L\_{data}$ 為均方誤差：

$$L\_{data} \= \\frac{1}{N} \\sum\_{i=1}^{N} (y\_i \- \\hat{y}\_i)^2$$

:::  
::: {.fragment}  
正則化項 $L\_{reg}$ 用於防止過擬合：

$$L\_{reg} \= ||w||\_2^2$$

:::

### **6.3 互動式圖表的整合**

這是 Quarto 相較於 Typst 簡報的最大優勢。若碩士論文包含數據分析，可直接在簡報中嵌入 R 或 Python 代碼塊，生成可互動的 Plotly 或 ECharts 圖表 10。

Python

\#| echo: false  
\#| fig-cap: "模型收斂曲線 (可縮放)"

import plotly.express as px  
df \= px.data.iris() \# 假設這是實驗數據  
fig \= px.scatter(df, x="sepal\_width", y="sepal\_length", color="species")  
fig.show()

在口試現場，當委員詢問「圖表右上角的離群值是什麼？」時，講者可以直接將滑鼠移至該點顯示詳細數據，展現對資料的掌握度。

## ---

**7\. 高階防禦機制：善用 Quarto 簡報工具**

依據白皮書，口試不僅是內容的展示，更是演講者與聽眾的互動。Quarto 提供了多項工具來輔助這場「防禦戰」。

### **7.1 演講者備忘錄 (Speaker Notes)**

切勿照唸投影片。白皮書要求投影片精簡，細節應記在備忘錄中。Quarto 支援 \<div class="notes"\> 語法 10。

## **實驗結果分析**

本方法在精確度上達到 98.5%。

::: {.notes}

1. 強調與 SOTA 方法 (ResNet) 的比較，提升了 2.3%。  
2. 若委員問及訓練時間，回答：雖然訓練時間增加 10%，但推論時間持平。  
3. 提醒自己展示下一頁的混淆矩陣。  
   :::

在報告時按下 S 鍵，即可開啟演講者視圖，看到上述筆記、下一張投影片預覽以及計時器，這對於精準控制 20 分鐘報告時間至關重要。

### **7.2 備用投影片策略 (The Backup Slides Strategy)**

面對委員的尖銳提問，最有效的防禦是「我準備了這張圖」。

* **實作方式**：在簡報的「致謝」頁面之後，加入詳細的數據表、額外的實驗佐證或數學證明。  
* **技巧**：在 YAML 中設定 show-slide-number: speaker 或手動控制，避免備用投影片影響總頁數顯示（例如顯示 "25/80" 會讓聽眾崩潰，應顯示 "25/25"）。

### **7.3 畫筆與黑板模式 (Chalkboard)**

在 YAML 中啟用 chalkboard: true 後，簡報左下角會出現畫筆工具。在回答問題時，可直接在投影片上圈選重點，或切換到黑板模式進行臨時推導。這模仿了傳統白板推導的學術傳統，但數位化地整合在簡報中。

## ---

**8\. 結論與建議**

本報告詳細闡述了將 Typst 碩士論文轉換為 Quarto 口試簡報的完整工作流。透過 Pandoc 的中介轉換、元件化的檔案處理策略，以及 Quarto 強大的 reveal.js 整合能力，研究生可以從繁瑣的格式調整中解放，專注於內容的邏輯構建。

**總結關鍵優勢：**

1. **結構化繼承**：直接繼承 Typst 論文的章節邏輯，確保簡報與論文內容的一致性。  
2. **視覺專業化**：透過自定義 SCSS 滿足「口試白皮書」的嚴格視覺規範。  
3. **防禦互動化**：利用互動圖表與演講者工具，提升回答問題的深度與自信。

對於未來的學術工作流而言，這種「Typst 撰寫文檔，Quarto 製作簡報」的混合模式（Hybrid Workflow），結合了兩者的強項，將是實現高效能學術傳播的最佳實踐。

### ---

**附錄：轉換工作流檢查表 (Checklist)**

| 階段 | 檢查項目 | 狀態 | 備註 |
| :---- | :---- | :---- | :---- |
| **預處理** | 備份原始 Typst 專案 | ☐ | 防止資料遺失 |
|  | 執行 Regex 腳本標準化 \#figure 語法 | ☐ | 確保 Pandoc 可讀取圖片 |
| **轉換** | 執行 Pandoc 批次轉換腳本 | ☐ | 產出 .qmd 初稿 |
| **重構** | 檢查並修正數學公式 ($) | ☐ | 修正變數插入語法 |
|  | 為圖片與表格添加 Label ({\#id}) | ☐ | 確保交叉引用運作 |
|  | 將 Typst 代碼塊改為 Python/R 代碼塊 | ☐ | 啟用動態執行 |
| **設計** | 設定 YAML (Logo, Footer, Theme) | ☐ | 符合學校規範 |
|  | 載入 custom\_defense.scss | ☐ | 調整字體與顏色 |
| **排演** | 檢查所有 LaTeX 公式的渲染結果 | ☐ | 防止缺字或亂碼 |
|  | 測試 Speaker View (S鍵) 功能 | ☐ | 確認備忘錄可見 |
|  | 確認 20 分鐘內的頁數分配 | ☐ | 避免超時 |

#### **引用的著作**

1. Typst Options \- Quarto, 檢索日期：1月 2, 2026， [https://quarto.org/docs/reference/formats/typst.html](https://quarto.org/docs/reference/formats/typst.html)  
2. A Tale about Typesetting with Typst vs. TeX \- Benjamin Hackl, 檢索日期：1月 2, 2026， [https://benjamin-hackl.at/blog/2024/07/typesetting-and-typst.html](https://benjamin-hackl.at/blog/2024/07/typesetting-and-typst.html)  
3. What is Typst? The Modern LaTeX Alternative, 檢索日期：1月 2, 2026， [https://www.youtube.com/watch?v=NTGkb4FCLhM](https://www.youtube.com/watch?v=NTGkb4FCLhM)  
4. Nicola Rennie: Styling Quarto PDFs with Typst \- YouTube, 檢索日期：1月 2, 2026， [https://www.youtube.com/watch?v=2DbuqYKOsrY](https://www.youtube.com/watch?v=2DbuqYKOsrY)  
5. Presentations \- Quarto, 檢索日期：1月 2, 2026， [https://quarto.org/docs/presentations/](https://quarto.org/docs/presentations/)  
6. 研究生於申請口試前，請先完成以下事項: \- 成功大學物理系, 檢索日期：1月 2, 2026， [https://www.phys.ncku.edu.tw/document-detail/0/65/](https://www.phys.ncku.edu.tw/document-detail/0/65/)  
7. 114學年第1學期碩士論文口試事宜 \- 國立成功大學企管系, 檢索日期：1月 2, 2026， [https://ba.ncku.edu.tw/p/405-1177-286525,c23935.php?Lang=zh-tw](https://ba.ncku.edu.tw/p/405-1177-286525,c23935.php?Lang=zh-tw)  
8. PowerPoint 簡報 \- 國立陽明交通大學科技法律學院, 檢索日期：1月 2, 2026， [https://law.nycu.edu.tw/wp-content/uploads/2022/08/%E5%B0%88%E7%8F%AD%E5%8F%A3%E8%A9%A6%E7%94%B3%E8%AB%8B%E6%B5%81%E7%A8%8B.odp](https://law.nycu.edu.tw/wp-content/uploads/2022/08/%E5%B0%88%E7%8F%AD%E5%8F%A3%E8%A9%A6%E7%94%B3%E8%AB%8B%E6%B5%81%E7%A8%8B.odp)  
9. Timeline \- National Taiwan University GMBA, 檢索日期：1月 2, 2026， [https://gmba.ntu.edu.tw/en/thesis\_and\_graduation/timeline](https://gmba.ntu.edu.tw/en/thesis_and_graduation/timeline)  
10. Revealjs \- Quarto, 檢索日期：1月 2, 2026， [https://quarto.org/docs/presentations/revealjs/](https://quarto.org/docs/presentations/revealjs/)  
11. Seven tips for creating Quarto revealjs presentations | Dr Tom Palmer, 檢索日期：1月 2, 2026， [https://remlapmot.github.io/post/2025/quarto-revealjs-tips/](https://remlapmot.github.io/post/2025/quarto-revealjs-tips/)  
12. Preparing for a Master Thesis Defense | EMUNI, 檢索日期：1月 2, 2026， [https://emuni.si/wp-content/uploads/2019/11/EMUNI\_Preparing\_for\_Masters\_Thesis\_Defense.pdf](https://emuni.si/wp-content/uploads/2019/11/EMUNI_Preparing_for_Masters_Thesis_Defense.pdf)  
13. Preparing a Presentation for Your Dissertation Defense: Guidelines \- Valdosta State University, 檢索日期：1月 2, 2026， [https://www.valdosta.edu/colleges/education/deans-office/documents/dissertation-defense-guide.pdf](https://www.valdosta.edu/colleges/education/deans-office/documents/dissertation-defense-guide.pdf)  
14. Example MS Thesis Outline | Electrical Engineering and Computer Science, 檢索日期：1月 2, 2026， [https://eecs.ku.edu/example-ms-thesis-outline](https://eecs.ku.edu/example-ms-thesis-outline)  
15. Guidelines for Students Writing MSc Dissertations \- Nanyang Technological University, 檢索日期：1月 2, 2026， [https://www.ntu.edu.sg/docs/librariesprovider122/curriculum/guidelines-for-students-writing-msc-dissertationsfa7ae60d-44d2-4fa2-a5fb-7a5032013932.pdf?sfvrsn=6f415e5b\_3](https://www.ntu.edu.sg/docs/librariesprovider122/curriculum/guidelines-for-students-writing-msc-dissertationsfa7ae60d-44d2-4fa2-a5fb-7a5032013932.pdf?sfvrsn=6f415e5b_3)  
16. Thesis Guidelines for Prof. Lyuu's Students, 檢索日期：1月 2, 2026， [https://www.csie.ntu.edu.tw/\~lyuu/thesis\_guides.html](https://www.csie.ntu.edu.tw/~lyuu/thesis_guides.html)  
17. How to use two-column layout with reveal.js? \- Stack Overflow, 檢索日期：1月 2, 2026， [https://stackoverflow.com/questions/30861845/how-to-use-two-column-layout-with-reveal-js](https://stackoverflow.com/questions/30861845/how-to-use-two-column-layout-with-reveal-js)  
18. typst reader · Issue \#8740 · jgm/pandoc \- GitHub, 檢索日期：1月 2, 2026， [https://github.com/jgm/pandoc/issues/8740](https://github.com/jgm/pandoc/issues/8740)  
19. lvignoli/typst-pandoc: Typst custom reader and writer for Pandoc \- GitHub, 檢索日期：1月 2, 2026， [https://github.com/lvignoli/typst-pandoc](https://github.com/lvignoli/typst-pandoc)  
20. Image Function – Typst Documentation, 檢索日期：1月 2, 2026， [https://typst.app/docs/reference/visualize/image/](https://typst.app/docs/reference/visualize/image/)  
21. For LaTeX Users – Typst Documentation, 檢索日期：1月 2, 2026， [https://typst.app/docs/guides/for-latex-users/](https://typst.app/docs/guides/for-latex-users/)  
22. Markdown Basics \- Quarto, 檢索日期：1月 2, 2026， [https://quarto.org/docs/authoring/markdown-basics.html](https://quarto.org/docs/authoring/markdown-basics.html)  
23. How to Make High-Quality PDFs with Quarto and Typst \- R for the Rest of Us, 檢索日期：1月 2, 2026， [https://rfortherestofus.com/2025/11/quarto-typst-pdf](https://rfortherestofus.com/2025/11/quarto-typst-pdf)  
24. Themes | reveal.js, 檢索日期：1月 2, 2026， [https://revealjs.com/themes/](https://revealjs.com/themes/)  
25. Reveal Themes \- Quarto, 檢索日期：1月 2, 2026， [https://quarto.org/docs/presentations/revealjs/themes.html](https://quarto.org/docs/presentations/revealjs/themes.html)  
26. Journal Formats \- Quarto, 檢索日期：1月 2, 2026， [https://quarto.org/docs/journals/formats.html](https://quarto.org/docs/journals/formats.html)  
27. quarto revealjs presentation column layout with spacing \#5418 \- GitHub, 檢索日期：1月 2, 2026， [https://github.com/orgs/quarto-dev/discussions/5418](https://github.com/orgs/quarto-dev/discussions/5418)  
28. Advanced Reveal \- Quarto, 檢索日期：1月 2, 2026， [https://quarto.org/docs/presentations/revealjs/advanced.html](https://quarto.org/docs/presentations/revealjs/advanced.html)  
29. Quarto Presentations, 檢索日期：1月 2, 2026， [https://quarto.org/docs/presentations/revealjs/demo/](https://quarto.org/docs/presentations/revealjs/demo/)  
30. How to ensure speaker notes visibility in a revealjs presentation created with quarto, for a slide with multiple fragments? \- Stack Overflow, 檢索日期：1月 2, 2026， [https://stackoverflow.com/questions/79811704/how-to-ensure-speaker-notes-visibility-in-a-revealjs-presentation-created-with-q](https://stackoverflow.com/questions/79811704/how-to-ensure-speaker-notes-visibility-in-a-revealjs-presentation-created-with-q)