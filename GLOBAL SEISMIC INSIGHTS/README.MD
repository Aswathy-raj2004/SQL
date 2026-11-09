# 🌍 Global Seismic Insights
### An Exploratory Analysis of Worldwide Earthquake Activity (2023–2025)

## 📌 Project Overview

Global Seismic Insights is a data analytics project that explores worldwide earthquake activity between 2023 and 2025 using data from the **United States Geological Survey (USGS) Earthquake Catalog**.

The project focuses on analysing earthquake frequency, magnitude, depth, and geographic distribution to identify patterns and trends in recorded seismic activity.

The analysis was performed using **Microsoft Excel, MySQL, and Power BI**, following a complete data analytics workflow from data collection and preparation to SQL analysis and interactive dashboard development.

## 🎯 Project Objectives

- Analyse and compare recorded earthquake activity across 2023, 2024, and 2025.
- Identify monthly and yearly earthquake frequency patterns.
- Examine the distribution of earthquakes across magnitude categories.
- Analyse earthquake depth and its distribution.
- Explore the relationship between earthquake magnitude and depth.
- Identify the strongest recorded earthquake events.
- Examine geographic concentrations and location-based activity patterns.
- Present key findings through interactive Power BI dashboards.

## 🗂️ Dataset Information

**Data Source:** [USGS Earthquake Catalog](https://earthquake.usgs.gov/earthquakes/search/)

The dataset contains worldwide earthquake catalog records for 2023, 2024, and 2025, with a minimum magnitude threshold of 4.0.

### Dataset Summary

| Description | Details |
|---|---:|
| Analysis period | 2023–2025 |
| Magnitude threshold | 4.0 and above |
| Total imported records | 48,705 |
| Records classified as earthquakes | 48,690 |
| Other event-type records | 15 |

The imported catalog also contained a small number of records classified as volcanic eruptions, landslides, explosions, and mining explosions. These were excluded from earthquake-specific analysis by filtering the event type.

### Important Dataset Columns

| Column | Description |
|---|---|
| `id` | Unique event identifier |
| `time` | Date and time of earthquake occurrence |
| `latitude` | Geographic latitude |
| `longitude` | Geographic longitude |
| `depth` | Earthquake depth in kilometres |
| `mag` | Earthquake magnitude |
| `magType` | Magnitude measurement type |
| `place` | Descriptive location of the event |
| `type` | Event classification |
| `updated` | Last catalog update timestamp |
| `net` | Network that contributed the event |

Additional fields include seismic solution quality measurements, location errors, magnitude errors, and data-source information.

## 🛠️ Tools and Technologies

| Tool | Purpose |
|---|---|
| Microsoft Excel | Data cleaning, preparation, and combining yearly datasets |
| MySQL Workbench | Data storage, SQL queries, aggregation, and analysis |
| SQL | Data exploration, categorisation, and analytical calculations |
| Power BI Desktop | Data modelling, DAX measures, interactive visualisations, and dashboards |
| DAX | Calculated measures and analytical calculations |


## ⚙️ Project Workflow

The project follows a structured data analytics workflow:

**1. Data Collection**
- Retrieved earthquake records from the official USGS Earthquake Catalog.
- Collected datasets for 2023, 2024, and 2025.
- Applied a minimum magnitude threshold of 4.0.

**2. Data Cleaning and Preparation – Excel**
- Combined the three yearly datasets.
- Reviewed column names and data structure.
- Checked record counts and event types.
- Prepared the consolidated dataset for database import.

**3. Data Import and Analysis – MySQL**
- Created database tables and imported the prepared dataset.
- Converted event timestamps into proper datetime columns.
- Validated the imported record count.
- Used SQL queries to analyse yearly and monthly earthquake counts.
- Calculated average, minimum, and maximum magnitudes.
- Created magnitude and depth categories using `CASE WHEN`.
- Identified the ten strongest recorded earthquake events.

**4. Data Modelling and Visualisation – Power BI**
- Connected Power BI to the MySQL database.
- Created DAX measures for earthquake counts, average magnitude, highest magnitude, and average depth.
- Developed calculated categories for magnitude and depth.
- Designed interactive dashboards with KPI cards, charts, maps, tables, and slicers.

## 📊 Power BI Dashboard

The Power BI report consists of three analytical pages.

### Page 1: Global Seismic Insights

Provides an overall summary of worldwide recorded earthquake activity.

**Key Visualisations:**
- KPI cards displaying total earthquakes, average magnitude, highest magnitude, and average depth.
- Yearly earthquake distribution.
- Monthly earthquake distribution aggregated across all three years.
- Global earthquake distribution map using latitude and longitude.

**Purpose:** To provide an overview of recorded earthquake activity and its geographic distribution.

### Page 2: Magnitude & Depth Analysis

Explores the characteristics and distribution of recorded earthquakes.

**Key Visualisations:**
- Earthquake distribution by magnitude category.
- Earthquake distribution by depth category.
- Magnitude composition across shallow, intermediate, and deep earthquakes.
- Top 10 strongest recorded earthquakes with their magnitude, location, date, and depth.

**Purpose:** To understand the distribution of earthquake magnitudes and depths and identify significant recorded events.

### Page 3: Geographic Insights

Examines location-based earthquake patterns and yearly comparisons.

**Key Visualisations:**
- Top 10 location descriptions by earthquake count.
- Earthquake activity by location and year.
- Average magnitude by year.
- Average depth by year.

**Purpose:** To compare recorded earthquake activity across frequently occurring location descriptions and identify differences between years.

## 🔍 Key Findings and Insights

### 1. Overall Earthquake Activity
- The dataset contains 48,690 records classified as earthquakes.
- The overall average magnitude is approximately **4.51**.
- The highest recorded magnitude is **8.80**.
- The average earthquake depth is approximately **82.80 km**.
- Recorded earthquake counts were highest in 2025 among the three years.

### 2. Magnitude Distribution

| Magnitude Category | Magnitude Range | Earthquake Count |
|---|---|---:|
| Light | 4.0–4.9 | 43,274 |
| Moderate | 5.0–5.9 | 5,025 |
| Strong | 6.0–6.9 | 346 |
| Major | 7.0–7.9 | 44 |
| Great | 8.0 and above | 1 |

**Insight:** Most recorded earthquakes fall within the 4.0–4.9 magnitude range. The number of recorded events decreases considerably as magnitude increases.

*Note: These are simplified analytical categories used in this project.*

### 3. Depth Distribution

| Depth Category | Depth Range | Percentage |
|---|---|---:|
| Shallow | Below 70 km | 70.97% |
| Intermediate | 70–300 km | 21.65% |
| Deep | Above 300 km | 7.38% |

**Insight:** Approximately 71% of the recorded earthquakes were shallow, making shallow earthquakes the largest depth category in the dataset.

### 4. Geographic Distribution
- The global map shows concentrations of recorded events around several active seismic regions.
- The south of the Fiji Islands has the highest earthquake count among the displayed location descriptions.
- Other frequently occurring descriptions include the South Sandwich Islands, Fiji region, Kermadec Islands, and Izu Islands, Japan region.

**Insight:** Several high-count location descriptions are associated with the Pacific region, reflecting the concentration of recorded seismic events around active tectonic areas.

### 5. Yearly Comparisons
- Average magnitude remained relatively stable across the three years, with a small increase in 2025.
- Average recorded earthquake depth was lower in 2025 than in 2023 and 2024.
- The south of the Fiji Islands recorded 264 events in 2023, 420 in 2024, and 330 in 2025.

**Insight:** The dataset reveals differences in recorded earthquake frequency and average depth across years and locations, although these differences do not necessarily indicate changes in underlying global seismic activity.

## 💻 SQL Analysis

Some of the important SQL operations performed in this project include:

### Yearly Earthquake Count

```sql
SELECT
    YEAR(time_dt) AS Earthquake_Year,
    COUNT(*) AS Total_Earthquakes
FROM earthquakes_import
WHERE type = 'earthquake'
GROUP BY YEAR(time_dt)
ORDER BY Earthquake_Year;
```

### Average Magnitude by Year

```sql
SELECT
    YEAR(time_dt) AS Earthquake_Year,
    AVG(mag) AS Average_Magnitude
FROM earthquakes_import
WHERE type = 'earthquake'
GROUP BY YEAR(time_dt)
ORDER BY Earthquake_Year;
```

### Magnitude Categorisation

```sql
SELECT
    CASE
        WHEN mag >= 4 AND mag < 5 THEN 'Light'
        WHEN mag >= 5 AND mag < 6 THEN 'Moderate'
        WHEN mag >= 6 AND mag < 7 THEN 'Strong'
        WHEN mag >= 7 AND mag < 8 THEN 'Major'
        ELSE 'Great'
    END AS Magnitude_Category,
    COUNT(*) AS Earthquake_Count
FROM earthquakes_import
WHERE type = 'earthquake'
GROUP BY Magnitude_Category
ORDER BY MIN(mag);
```

### Top 10 Strongest Earthquakes

```sql
SELECT
    id,
    mag,
    time_dt,
    place,
    depth
FROM earthquakes_import
WHERE type = 'earthquake'
ORDER BY mag DESC
LIMIT 10;
```


## ⚠️ Data Limitations

- The analysis includes USGS catalog records with magnitude 4.0 or above. It does not represent every earthquake worldwide.
- Recorded earthquake counts may be influenced by monitoring coverage, reporting practices, and catalog completeness.
- The `place` field contains descriptive location text and is not a standardised country or region classification.
- Magnitude and depth describe different earthquake characteristics; neither alone determines the damage caused by an event.
- The analysis covers only three years and should not be used to establish long-term seismic trends.
- The results describe the selected USGS catalog records and should not be interpreted as proof of changes in global seismic activity.

## 🚀 Future Improvements

Potential extensions to this project include:

- Adding more years of earthquake records for longer-term trend analysis.
- Incorporating standardised country and tectonic-region classifications.
- Exploring additional seismic indicators and event characteristics.
- Investigating relationships between magnitude, depth, and geographic location in greater detail.
- Developing more advanced spatial and time-series analysis.

## 📌 Conclusion

Global Seismic Insights demonstrates how raw earthquake catalog data can be transformed into meaningful analytical insights using Excel, MySQL, SQL, and Power BI.

The project explores earthquake frequency, magnitude distribution, depth characteristics, and geographic patterns through structured data analysis and interactive visualisation.

It also highlights the importance of data cleaning, validation, appropriate visualisation choices, and understanding dataset limitations when interpreting analytical results.

---

**Data Source:** [USGS Earthquake Catalog](https://earthquake.usgs.gov/earthquakes/search/)

**Project:** Global Seismic Insights – Earthquake Data Analytics (2023–2025)

**Tools:** Microsoft Excel | MySQL | Power BI | SQL | DAX
