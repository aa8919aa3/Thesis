+++markdown

# 投影片講義：有限動量配對與 Pair-Density Wave（PDW）

---

## 1. 什麼是 Pair-Density Wave？

### 傳統超導 vs. 有限動量配對

* **BCS 超導**：總動量 $\mathbf{Q}=0$ 的 Cooper 對
  $\Rightarrow \Delta(\mathbf{r}) = \Delta_0$（均勻）
* **PDW 超導**：總動量 $\mathbf{Q} \neq 0$
  $\Rightarrow \Delta(\mathbf{r}) \propto e^{i\mathbf{Q}\cdot\mathbf{r}}$

> PDW = **Cooper 對的密度形成波動**
> 類比：CDW 是電子密度波動，PDW 是 Cooper 對的密度波動。

---

## 2. FFLO 與 PDW：相似與不同

| 特性     | FFLO             | PDW                           |
| ------ | ---------------- | ----------------------------- |
| 驅動機制   | Zeeman 場、Pauli 限 | 強關聯、CDW、stripe、嵌套效應等          |
| 場需求    | 高磁場              | 可在零場出現                        |
| 空間對稱破缺 | $U(1)$、平移對稱      | 同上，且常伴隨 nematic、CDW、charge-4e |
| 常見材料   | 有機超導、重費米子、鐵基     | 銅氧高溫超導、NbSe$_2$               |

---

## 3. PDW 的序參量結構與對稱性

### 多 $\mathbf{Q}$ 結構

$\Delta(\mathbf{r}) = \sum_{\mathbf{Q}} \Delta_{\mathbf{Q}} e^{i\mathbf{Q}\cdot\mathbf{r}}$

* 常見波向：$(\pm Q,0), (0, \pm Q)$
* 1D LO 型簡化：$\Delta(\mathbf{r}) = 2|\Delta_Q|\cos(Qx + \phi)$

### 破缺的對稱性

* $U(1)$ 相位對稱（超導）
* 平移對稱（因為 $\mathbf{Q} \neq 0$）
* 可能還有：旋轉對稱（nematic）、鏡射對稱

---

## 4. PDW 的 Ginzburg–Landau 描述

### 多序參量自由能（無梯度項）

$$
F = r(|\Delta_Q|^2 + |\Delta_{-Q}|^2) + u_1(...) + u_2|\Delta_Q|^2|\Delta_{-Q}|^2 + ...
$$

### 耦合誘發的 CDW 項：

$$
F_{\text{coup}} = \lambda[\rho_{2Q} \Delta_Q \Delta_{-Q}^* + \text{c.c.}]
$$

> PDW 存在 $\Rightarrow$ 必然誘發 CDW (vestigial order)

---

## 5. 銅氧中的 PDW：微觀圖像

### 條紋序與「條狀超導」

* Cooper 對被限制在條紋中
* 相鄰條紋序參量變號 $\Rightarrow$ $\Delta(\mathbf{r}) \propto \cos(\mathbf{Q}\cdot\mathbf{r})$

### frustrated Josephson 耦合

* 不同層或條紋間耦合為反相
* 導致交錯相位 $\Rightarrow$ PDW 結構自然形成

---

## 6. 實驗證據：從 cuprates 到 TMD

### (a) Bi-2212 中的磁場誘發 PDW

* 渦旋 halo 中發現空間調變 gap 結構
* 週期與已知 CDW 相符 → PDW 信號

### (b) 零場 Josephson 探針 STM

* Josephson 電流空間震盪 → Cooper 對密度有週期性

### (c) NbSe$_2$ 中的 PDW

* CDW 波向與 PDW 波向一致
* Josephson current mapping 顯示 PDW 調變

---

## 7. PDW 的理論意義與前沿議題

* **pseudogap** 解釋：PDW 漲落或 vestigial phase
* **charge-4e 超導**：PDW 的漲落誘發二次配對
* **拓撲超導性**：PDW + 自旋軌道耦合 $\Rightarrow$ Majorana 模態
* **工程化 PDW**：多層 NbSe$_2$、vdW 結構、人工晶格等平台

---

## 8. 討論與習題（簡要）

1. **CDW 從 PDW 誘發機制？**
2. **nematic PDW 如何由 GL 自由能偏好形成？**
3. **微觀條紋模型與 PDW 的對應？**
4. **實驗觀察中 PDW 與 CDW 如何區分？Josephson 尖端如何幫助觀測？**

---

## 延伸學習資源

* 📘 [Agterberg et al. PDW 綜論 (arXiv:1904.09687)](https://arxiv.org/abs/1904.09687)
* 🔬 [NbSe$_2$ SJTM 實驗](https://www.science.org/doi/10.1126/science.abd4607)
* 🧠 [Charge-4e 超導與 PDW 漲落](https://arxiv.org/abs/2303.17631)

---

## 延伸：如果規劃讀書會

📅 建議進度（3～4 週）：

1. **Week 1**：BCS, FFLO 與有限動量配對概念
2. **Week 2**：PDW 對稱性、GL 描述、vestigial orders
3. **Week 3**：實驗證據與案例研究
4. **Week 4**（選修）：Jupyter Notebook 模擬 + charge-4e SC / Topo PDW 討論

---

🛠 如果你想製作 **互動模擬 / Notebook 教材**，我可以幫你設計範本範例。

+++
