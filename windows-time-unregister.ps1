# Fix Windows 11 Time Sync Issue
# Save this as windows-time.ps1 and run in two parts

Write-Host "Step 1: Restarting Windows Time service..." -ForegroundColor Cyan
Stop-Service w32time -Force -ErrorAction SilentlyContinue

Write-Host "Step 2: Unregistering the time service..." -ForegroundColor Cyan
w32tm /unregister

Write-Host "⚠️ The service is now marked for deletion. Please close PowerShell and run Step 2 script after reopening." -ForegroundColor Yellow
