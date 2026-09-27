# IoT Factory Inventory & ERP Database Management System
> 物聯網高科技製造工廠庫存與供應鏈管理資料庫系統架構

![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?logo=mysql&logoColor=white)
![Security](https://img.shields.io/badge/Security-HmacSHA256%20%2B%20Salt-green)
![Architecture](https://img.shields.io/badge/Architecture-3NF%20Relational%20Schema-orange)

## 📌 專案概述 (Project Overview)
本專案為國立中央大學「資料庫管理 (DBMS)」期末專案。以資料庫管理員（Database Administrator, DBA）視角，專為生產高科技硬體（如微電腦、顯示器及各類嵌入式元件）之物聯網製造工廠設計一套具備高擴展性、強資料一致性與高安全性之關聯式資料庫系統。

系統完整涵蓋四核心模組：
1. **員工權限與身分認證 (Employee & Credential Security)**
2. **物料控制與 BOM 表管理 (Raw Material & Bill of Materials, BOM)**
3. **供應鏈與採購追蹤 (Supply Chain & Procurement Tracking)**
4. **客戶銷貨與庫存動態扣抵 (Product Sales & Real-time Inventory Lifecycle)**

---

## 🏗️ 實體關聯模型架構 (ER Model & Schema Design)

系統嚴格遵循第三正規化 (3NF)，消除資料冗餘並確保參照完整性 (Referential Integrity)。

### 核心實體清單 (Core Entities)
* `tbl_Credential`: 獨立儲存帳號認證資安資訊，符合 OWASP 安全儲存規範。
* `tbl_Employee`: 員工基本資料與職稱權限，具備 `report_to` 自我參照外鍵（實作階層樹狀管理）。
* `tbl_Supplier`: 原料供應商基本資訊與聯絡窗口。
* `tbl_Material`: 實體原材料主檔，包含單價、供應商關聯與安全庫存臨界值 (`reorder_level`)。
* `tbl_Product`: 最終商品主檔，售價依據零件成本加成 120% (`Cost * 1.2`)。
* `tbl_Product_m2m_Material`: 多對多關聯表，記錄每項成品所需的物料清單 (Bill of Materials, BOM) 及單機用量。
* `tbl_Procurement_Order` & `tbl_Procurement_Order_Detail`: 採購訂單主表與明細表（1 對多）。
* `tbl_Product_Order`: 客戶銷貨訂單，紀錄下單員工、客戶信箱及狀態轉移。

---

## ⚙️ 核心業務邏輯與 13 組預存程序 (Stored Procedures)

系統所有核心邏輯皆封裝於 MySQL Stored Procedures 中，確保資料庫層級的 ACID 交易與業務規則一致性：

| 編號 | 預存程序名稱 | 模組分類 | 功能與設計說明 |
| :---: | :--- | :---: | :--- |
| **01** | `sp_RegisterEmployee` | 身分安全 | 驗證信箱唯一性，透過動態 Salt 結合 HmacSHA256 完成密碼雜湊註冊。 |
| **02** | `sp_UpdatePwd` | 身分安全 | 驗證原密碼雜湊值，驗證通過後以全系統隨機 Salt 重新雜湊並更新密碼。 |
| **03** | `sp_Login` | 身分安全 | 比對員工雜湊密碼，回傳明確狀態碼（1:成功, 2:密碼錯誤, 3:帳號不存在）。 |
| **04** | `sp_CreateProcurementOrder` | 採購管理 | 建立採購訂單主檔與細項，紀錄供應商、下單員工與採購數量。 |
| **05** | `sp_CreateProductOrder` | 銷售管理 | 建立客戶銷貨訂單，關聯產品清單並鎖定銷售當下之庫存。 |
| **06** | `sp_GetRecentOrdersBySupplier` | 報表查詢 | 查詢指定區間內特定供應商訂單，並動態匯總計算已完成訂單總額。 |
| **07** | `sp_UpdateOrderStatus` | 狀態機控制 | **嚴格不可逆狀態機轉移**：`Pending (1) -> Processing (2) -> Completed (3)`，且任何狀態均可進入 `Canceled (0)`，終態不可再逆轉。 |
| **08** | `sp_ComputeInventory` | 庫存核心 | 跨訂單紀錄動態計算物料即時總存貨數量 (`overall_quantity`)。 |
| **09** | `sp_CheckInventory` | 智慧預警 | 依訂單 BOM 檢核物料庫存，若低於安全庫存水位 (`reorder_level`) 立即報警缺料品項。 |
| **10** | `sp_GetUnreceivedOrders` | 供應鏈追蹤 | 檢索未到貨訂單 (`delivery_status = 2`)，依未到貨量降冪排序以利跟催。 |
| **11** | `sp_GetSupplierPerformanceReport` | 績效分析 | 統計期間內採購次數與訂單完成率 (`Completed / (Completed + Canceled)`)，輔助供應商評核。 |
| **12** | `sp_DeleteEmployee` | 完整性防護 | 刪除員工前驗證外鍵依賴性，防止孤立歷史訂單產生。 |
| **13** | `sp_ConfirmSupervisor` | 階層樹查詢 | 透過遞迴查詢（Recursive Query）沿 `report_to` 逐層上溯完整主管鏈直至頂層董事長。 |

---

## 🔒 資安與技術亮點 (Technical Highlights)

1. **密碼學安全實踐 (OWASP Cryptographic Storage)**
   * 杜絕明文儲存，每組帳號配發專屬動態加鹽字串（Cryptographic Salt）。
   * 密碼透過 `HmacSHA256` 進行單向雜湊運算，防禦彩虹表（Rainbow Table）攻擊。
2. **生命週期不可逆狀態機 (Order Lifecycle State Machine)**
   * 訂單狀態採用位階限制，防止系統被惡意重放修改已完成交易。
3. **動態 BOM 計算與物料自動預警**
   * 當銷貨訂單進入 Pending 時，自動對齊 BOM 展開零組件需求，低於閾值即時警示，實現敏捷生產控制。

---

## 🚀 部署與執行指引 (Getting Started)

### 環境需求
* MySQL Server 8.0+
* MySQL Workbench

### 安裝步驟
1. Clone 本專案庫：
   ```bash
   git clone [https://github.com/meyigeshiren/iot-factory-erp-dbms.git](https://github.com/meyigeshiren/iot-factory-erp-dbms.git)
   cd iot-factory-erp-dbms
