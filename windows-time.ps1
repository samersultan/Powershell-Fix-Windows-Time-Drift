# Run as Administrator

Write-Host "Restarting Windows Time service..." -ForegroundColor Cyan
Stop-Service w32time -Force
Start-Service w32time

Write-Host "Re-registering time service..." -ForegroundColor Cyan
w32tm /unregister
w32tm /register
Start-Service w32time

Write-Host "Manually syncing time from NTP server..." -ForegroundColor Cyan
w32tm /config /update /manualpeerlist:"time.windows.com" /syncfromflags:manual /reliable:YES
w32tm /resync /force

Write-Host "Current system time:" -ForegroundColor Green
Get-Date
