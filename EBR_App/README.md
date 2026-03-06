# EBR Executive Dashboard — Polaris Bank
### Automated Backend + Executive Frontend

---

## What This Is

A full-stack web application that:
- **Backend (Python/Flask):** Automatically reads and processes your Excel files, extracts all data, and serves it as a live API
- **Frontend (HTML):** Clean executive dashboard that pulls live data from the backend — no manual editing required

---

## Quick Start (Windows)

1. **Install Python 3.9+** from [python.org](https://python.org) if not already installed
2. **Double-click** `START_DASHBOARD.bat`
3. The browser opens automatically at `http://localhost:5000`
4. Click **"Manage Data"** in the top-right → upload your Excel files → click **"Upload All & Refresh"**

## Quick Start (Mac / Linux)

```bash
chmod +x start_dashboard.sh
./start_dashboard.sh
```

---

## Uploading Your Data

| Dataset Label | Expected Excel File |
|---|---|
| OPEX 2024 | OPEX_AND_CAPEX_DEC_2024.xlsx |
| OPEX 2025 | OPEX_AND_CAPEX_DEC_2025.xlsx |
| Properties | Property_Schedule.xlsx |
| Fleet | Power_bi_fleet_data.xlsx |
| Generators | BRANCH_GENERATOR_SCHEDULE.xlsx |
| ATMs | LIST_OF_ACTIVE_ATMS_BANKWIDE.xlsx |
| Contracts | 2025_contract_issued.xlsx |
| ISG Staff | ISGs_Location_Nationwide.xlsx |

**Important notes:**
- You can upload one file at a time or all at once
- Once uploaded, data is saved — you don't re-upload unless there's a new version
- The dashboard refreshes all charts automatically after each upload
- Each file upload is logged with a timestamp in the admin panel

---

## Folder Structure

```
EBR_App/
│
├── START_DASHBOARD.bat       ← Windows: double-click to run
├── start_dashboard.sh        ← Mac/Linux: run in terminal
│
├── backend/
│   ├── app.py                ← Flask server + Excel processors
│   ├── requirements.txt      ← Python dependencies
│   └── data/                 ← Processed data saved here (auto-created)
│
├── frontend/
│   └── dashboard.html        ← Executive dashboard UI
│
└── uploads/                  ← Raw Excel files saved here (auto-created)
```

---

## How the Backend Works

When you upload an Excel file via the **Manage Data** panel:

1. The file is sent to the Flask backend (`POST /api/upload/<dataset>`)
2. The backend reads it using `pandas` and `openpyxl`
3. Data is cleaned, structured, and saved as JSON in `backend/data/`
4. The dashboard fetches the fresh JSON and rebuilds all charts instantly

The backend handles all column detection, sheet selection, and data type conversion automatically.

---

## API Endpoints (for reference)

| Method | Endpoint | Description |
|---|---|---|
| GET | `/` | Opens the dashboard |
| GET | `/api/status` | Shows upload status of all datasets |
| POST | `/api/upload/<dataset>` | Upload + process an Excel file |
| GET | `/api/data/<dataset>` | Fetch processed data for one dataset |
| GET | `/api/data/all` | Fetch all datasets at once |
| GET/POST | `/api/achievements` | Get or save achievements list |

---

## Requirements

- Python 3.9 or higher
- Internet connection (only for first install of dependencies)
- Any modern browser (Chrome, Edge, Firefox)

---

## Troubleshooting

**Server won't start:**
- Make sure Python is installed and in PATH
- Run `pip install flask flask-cors pandas openpyxl` manually

**"Server offline" shown in dashboard:**
- The backend isn't running — run `START_DASHBOARD.bat` first
- Make sure port 5000 is not blocked by your firewall

**File upload fails:**
- Check that the Excel file matches the expected sheet structure
- The backend logs the exact error in the admin panel console

**Data looks wrong after upload:**
- The parser auto-detects columns — if your file has unusual headers, check the console log
- Contact IT to verify the column naming matches the standard format

---

*EBR Dashboard v2.0 — Polaris Bank · January 2026*
