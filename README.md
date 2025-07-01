Here’s a `README.md` file suitable for GitHub that explains the purpose and usage of your PowerShell time sync script for Windows 11:

---

````markdown
# Windows 11 Time Sync Fix PowerShell Script

This PowerShell script is designed to **correct the system time on Windows 11** when the clock is incorrect even though it is set to update automatically. It does so by restarting the Windows Time service, re-registering the time configuration, and manually resyncing with a known NTP server.

## 🔧 Features

- Restarts the `w32time` (Windows Time) service
- Re-registers the time service in case it's misconfigured
- Forces synchronization with `time.windows.com`
- Optionally ensures time is synced using NTP automatically

## 🖥️ Requirements

- Windows 11
- Administrator privileges
- Internet access (UDP port 123 must be open)

## 📦 Usage

1. Open PowerShell **as Administrator**.
2. Run the script:
   ```powershell
   .\Fix-TimeSync.ps1
````

3. Wait for the script to complete. It will display the updated system time at the end.

## 📁 Script Contents

```powershell
# Restart Windows Time service
Stop-Service w32time -Force
Start-Service w32time

# Re-register the service
w32tm /unregister
w32tm /register
Start-Service w32time

# Configure sync with external NTP server
w32tm /config /update /manualpeerlist:"time.windows.com" /syncfromflags:manual /reliable:YES
w32tm /resync /force

# Display current time
Get-Date
```

## ⚠️ Notes

* On domain-joined machines, time sync is managed by the domain controller.
* If time issues persist, verify BIOS time and system region settings.

 script and README included.
```
