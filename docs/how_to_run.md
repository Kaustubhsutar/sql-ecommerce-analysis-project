## ▶️ How to Reproduce This Analysis

Follow the steps below to replicate the project in **Google BigQuery**:

---

### Step 1: Open BigQuery

- Go to **Google Cloud Console**
- Navigate to **BigQuery**

---

### Step 2: Create a Dataset

- Click on your project name (left panel)
- Click **Create Dataset**
- Enter a Dataset ID (e.g., `e_commerce_data_analysis`)
- Select data location
- Click **Create Dataset**

---

### Step 3: Upload CSV File as Table

For the CSV file (`user_events.csv`):

- Click **Create Table**
- Under **Source**, choose:
  - **Create table from**: Upload
  - Select the `user_events.csv` file
- Under **Destination**:
  - Choose your dataset (`e_commerce_data_analysis`)
  - Enter table name: `user_events`
- Under **Schema**:
  - Select **Auto-detect**
- Click **Advanced Options**:
  - Set **Header rows to skip = 1**
- Click **Create Table**

---

### Step 4: Run the Analysis Script

- Open the `funnel_analysis.sql` file
- Copy the SQL code into the BigQuery Query Editor
- Update the project ID if necessary
- Run the queries to generate insights
