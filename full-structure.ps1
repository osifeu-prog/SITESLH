Write-Host "=== FULL PROJECT STRUCTURE SETUP STARTED ===" -ForegroundColor Cyan

D:\SLHSITE = "D:\SLHSITE"
Set-Location D:\SLHSITE

# 1. מחיקת ריפו ישן אם קיים
if (Test-Path "D:\SLHSITE\.git") {
    Write-Host "Removing old .git..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force "D:\SLHSITE\.git"
}

# 2. יצירת ריפו חדש
Write-Host "Initializing new Git repository..." -ForegroundColor Cyan
git init
git branch -M main
git remote add origin https://github.com/osifeu-prog/SITESLH.git

# 3. יצירת תיקיות
Write-Host "Creating folder structure..." -ForegroundColor Cyan
New-Item -ItemType Directory -Force "D:\SLHSITE\src" | Out-Null
New-Item -ItemType Directory -Force "D:\SLHSITE\prisma" | Out-Null

# 4. יצירת קבצים ריקים
Write-Host "Creating empty project files..." -ForegroundColor Cyan

New-Item -ItemType File -Force "D:\SLHSITE\package.json" | Out-Null
New-Item -ItemType File -Force "D:\SLHSITE\tsconfig.json" | Out-Null
New-Item -ItemType File -Force "D:\SLHSITE\railway.toml" | Out-Null
New-Item -ItemType File -Force "D:\SLHSITE\.gitignore" | Out-Null

New-Item -ItemType File -Force "D:\SLHSITE\prisma\schema.prisma" | Out-Null

New-Item -ItemType File -Force "D:\SLHSITE\src\index.ts" | Out-Null
New-Item -ItemType File -Force "D:\SLHSITE\src\bot.ts" | Out-Null
New-Item -ItemType File -Force "D:\SLHSITE\src\ai.ts" | Out-Null
New-Item -ItemType File -Force "D:\SLHSITE\src\blockchain.ts" | Out-Null
New-Item -ItemType File -Force "D:\SLHSITE\src\config.ts" | Out-Null
New-Item -ItemType File -Force "D:\SLHSITE\src\db.ts" | Out-Null

# 5. הוספת כל הקבצים
Write-Host "Staging files..." -ForegroundColor Cyan
git add -A

# 6. יצירת commit
Write-Host "Creating commit..." -ForegroundColor Cyan
git commit -m "Initial project structure"

# 7. דחיפה בכוח
Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
git push -f origin main

Write-Host "=== FULL PROJECT STRUCTURE SETUP COMPLETED ===" -ForegroundColor Green
