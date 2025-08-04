// 附錄
// Appendix

// 定義 appendix 函數
#let appendix(body) = {
  // 強制分頁，附錄從新頁開始
  pagebreak()
  
  // 重置標題計數器
  counter(heading).update(0)
  
  // 設定附錄的標題編號格式（A.1, B.1 等）
  set heading(numbering: "A.1")
  
  // 設定頁碼格式（可選）
  set page(numbering: "A-1")
  counter(page).update(1)
  
  body
}

#show: appendix

= 附錄 A：詳細實驗數據 <appendix-detailed-data>

== 完整實驗結果 <section-complete-results>

本附錄提供了主要實驗的詳細數據和補充分析。

=== 資料集詳細資訊 <subsection-dataset-details>

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    align: center,
    [*資料集*], [*來源*], [*資料類型*], [*收集時間*], [*品質評分*],
    [Dataset A], [公開資料庫], [數值型], [2023年1月], [A],
    [Dataset B], [合作機構], [混合型], [2023年3月], [B+],
    [Dataset C], [自行收集], [文本型], [2023年5月], [A-]
  ),
  caption: [資料集詳細資訊]
)

=== 完整效能指標 <subsection-complete-metrics>

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center,
    [*方法*], [*準確率*], [*精確率*], [*召回率*], [*F1分數*], [*AUC*],
    [方法A], [0.825], [0.831], [0.819], [0.825], [0.887],
    [方法B], [0.847], [0.852], [0.841], [0.846], [0.902],
    [方法C], [0.863], [0.869], [0.857], [0.863], [0.915],
    [本研究方法], [0.891], [0.896], [0.886], [0.891], [0.943]
  ),
  caption: [完整效能指標比較]
)

== 參數調整記錄 <section-parameter-tuning>

在實驗過程中進行了大量的參數調整，主要記錄如下：

- 學習率範圍：0.0001 - 0.1
- 最佳學習率：0.001
- 批次大小測試：8, 16, 32, 64, 128
- 最佳批次大小：32

= 附錄 B：程式碼清單 <appendix-code-listing>

== 主要演算法實作 <section-main-algorithm-implementation>

```python
def main_algorithm(data, parameters):
    """
    主要演算法實作
    
    Args:
        data: 輸入資料
        parameters: 演算法參數
    
    Returns:
        results: 處理結果
    """
    # 初始化
    model = initialize_model(parameters)
    
    # 訓練過程
    for epoch in range(parameters.epochs):
        # 前向傳播
        outputs = model.forward(data)
        
        # 計算損失
        loss = compute_loss(outputs, targets)
        
        # 反向傳播
        model.backward(loss)
        
        # 更新參數
        model.update_parameters()
    
    return model
```

== 輔助函數 <section-helper-functions>

```python
def preprocess_data(raw_data):
    """資料預處理函數"""
    # 資料清理
    cleaned_data = clean_data(raw_data)
    
    # 特徵提取
    features = extract_features(cleaned_data)
    
    # 正規化
    normalized_features = normalize(features)
    
    return normalized_features

def evaluate_model(model, test_data):
    """模型評估函數"""
    predictions = model.predict(test_data)
    
    # 計算各種指標
    accuracy = compute_accuracy(predictions, test_labels)
    precision = compute_precision(predictions, test_labels)
    recall = compute_recall(predictions, test_labels)
    f1_score = compute_f1_score(precision, recall)
    
    return {
        'accuracy': accuracy,
        'precision': precision,
        'recall': recall,
        'f1_score': f1_score
    }
```

= 附錄 C：實驗環境配置 <appendix-environment-setup>

== 軟體環境 <section-software-environment>

=== Python 套件版本 <subsection-python-packages>

- Python: 3.8.10
- NumPy: 1.21.0
- Pandas: 1.3.0
- Scikit-learn: 0.24.2
- Matplotlib: 3.4.2
- Seaborn: 0.11.1

=== 系統配置 <subsection-system-configuration>

- 作業系統：Ubuntu 20.04 LTS
- 核心版本：5.4.0-74-generic
- Python 環境：Anaconda 4.10.1
- IDE：PyCharm Professional 2021.1

== 硬體規格 <section-hardware-specifications>

- 處理器：Intel Core i7-9700K \@ 3.60GHz
- 記憶體：32GB DDR4-3200
- 儲存裝置：1TB NVMe SSD
- 顯示卡：NVIDIA GeForce RTX 3080
- 主機板：ASUS ROG STRIX Z390-E

這樣的硬體配置能夠確保實驗的順利進行和結果的可重現性。
