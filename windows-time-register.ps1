Write-Host "Re-registering Windows Time service..." -ForegroundColor Cyan
w32tm /register

Start-Service w32time

Write-Host "Configuring time sync with NTP server..." -ForegroundColor Cyan
w32tm /config /update /manualpeerlist:"time.windows.com" /syncfromflags:manual /reliable:YES

Write-Host "Forcing time sync..." -ForegroundColor Cyan
w32tm /resync /force

Write-Host "✅ Current system time:" -ForegroundColor Green
Get-Date
