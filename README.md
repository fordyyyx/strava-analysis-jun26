# Strava Activity Analysis

Personal sports analytics project analysing 228 Strava activities recorded between March 2023 and June 2026, spanning running, cycling, football, squash, rowing, and walking.

## Project Overview

Raw activity data was exported from Strava and loaded into a PostgreSQL database. The goal was to uncover patterns in training intensity, sport-specific effort, and fitness trends across a multi-sport training history using SQL.

## Tech Stack

- **PostgreSQL** — database and all analysis
- **DBeaver** — SQL editor and query development
- **Git / GitHub** — version control

## Dataset

- **228 total activities** across 6 sport categories
- **Date range:** March 2023 — June 2026
- **Source:** Strava bulk data export (activities.csv, 103 columns)
- **Key metrics used:** average heart rate, max heart rate, relative effort, moving time, distance, calories

## Repository Structure

```
strava-analysis-jun26/
├── README.md
├── schema/
│   ├── 01_create_tables.sql       # Table definitions for activities, bikes, shoes
│   └── 02_load_data.sql           # Staging table approach to handle duplicate CSV headers
└── analysis/
    └── 01_cross_sport_effort.sql  # Cross-sport intensity comparison
```

## Analyses

### 01 — Cross-Sport Effort Comparison

**Question:** Which sport is actually the most physically demanding — and do team sports like football and squash rival dedicated cardio sessions in intensity?

**Approach:** Raw heart rate and relative effort metrics aren't directly comparable across sports of different durations, so effort and calories were normalised per minute of activity. A composite intensity score was calculated as a weighted average of three normalised metrics: heart rate (40%), effort per minute (40%), and calories per minute (20%).

**Findings:**

| Sport | Activities | Avg Duration (mins) | Avg HR | Effort/Min | Composite Score |
|-------|-----------|-------------------|--------|------------|----------------|
| Run | 124 | 41.3 | 167.3 | 2.09 | 100.0 |
| Squash | 9 | 64.9 | 160.8 | 2.02 | 92.9 |
| Football | 13 | 68.0 | 159.7 | 1.70 | 88.1 |
| Rowing | 7 | 19.1 | 158.0 | 2.03 | 85.2 |
| Cycle | 60 | 58.7 | 145.2 | 1.38 | 72.8 |

**Key insight:** Despite running being the highest volume sport (124 sessions), squash and football achieve near-equivalent cardiovascular intensity per minute (92.9 and 88.1 vs 100.0). This suggests team sports are a highly efficient training stimulus — producing similar heart rate stress to running in sessions of comparable or longer duration. Indoor cycling sits notably lower (72.8), consistent with the steady-state effort typical of trainer sessions.

---

### 02 Fitness Trend

**Question:** For runs only, has my aerobic fitness improved over time - specifically, at the same level of effort has my pace or distance increased year on year

**Approach:** Firstly I removed any anomalous or unreliable data (any overly slow runs or months with less than 3 runs in) and calculated paces to give a comparable metric. Then averaged these paces and heart rates out
over the months to give us comparable time periods. Finally I calculated an efficiency score.

*Further analyses in progress — activity mix by season, and training consistency patterns.*

## Setup

To recreate this database locally:

1. Install PostgreSQL and create a database called `strava`
2. Request a bulk data export from Strava (Settings → My Account → Download or Delete Your Account → Download Request)
3. Run `schema/01_create_tables.sql` to create the tables
4. Update the file paths in `schema/02_load_data.sql` to point to your local export folder
5. Run `schema/02_load_data.sql` to load the data