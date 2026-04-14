# --- Configuration ---
$DbName = "coffee_production"
$User = "root"
$Password = "YOUR_PASSWORD" # OR use a login path for security
$BackupFolder = "C:\Users\Lenovo pro\Desktop\Backups"
$Timestamp = Get-Date -Format "yyyy-MM-dd_HHmm"
$OutputFile = "$BackupFolder\${DbName}_$Timestamp.sql"

# Create backup folder if it doesn't exist
if (!(Test-Path $BackupFolder)) { New-Item -ItemType Directory -Path $BackupFolder }

# --- Run mysqldump ---
# Adding --routines and --triggers to ensure full automation is backed up
& "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump.exe" `
    --user=$User `
    --password=$Password `
    --routines `
    --triggers `
    --single-transaction `
    $DbName > $OutputFile

Write-Host "Backup completed: $OutputFile"
