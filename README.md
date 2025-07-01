# Fix Windows Time PowerShell Script


````markdown
# 🕒 Windows 11 Time Sync Fix (PowerShell Script)

This repository contains PowerShell scripts to fix incorrect system time issues on Windows 11 systems—even when "Set time automatically" is enabled. This often happens when the Windows Time (`w32time`) service becomes misconfigured or corrupted.

---

## 📄 Overview

The fix is done in **two steps**:

1. **Unregister** the time service (`w32tm /unregister`) – this marks the service for deletion.
2. **Restart PowerShell**, then **re-register and reconfigure** the service to sync with an NTP server.

---

## 🛠️ Files Included

- `windows-time-unregister.ps1` – Stops and unregisters the Windows Time service.
- `windows-time-register.ps1` – Re-registers, starts, and syncs time using `time.windows.com`.

---

## ⚙️ How to Use

### 🔹 Step 1: Unregister the Time Service

1. Open **PowerShell as Administrator**.
2. Run:

   ```powershell
   .\windows-time-unregister.ps1
````

3. You will see a message:
   *"⚠️ The service is now marked for deletion. Please close PowerShell and run Step 2 script after reopening."*

---

### 🔹 Step 2: Re-register and Sync Time

1. Close PowerShell completely.

2. Reopen **a new PowerShell session as Administrator**.

3. Run:

   ```powershell
   .\windows-time-register.ps1
   ```

4. The script will:

   * Re-register the Windows Time service
   * Start the service
   * Configure it to use `time.windows.com` for sync
   * Force an immediate sync
   * Show the current system time

---

## 💡 Troubleshooting

* **Still wrong time?**

  * Check if you're on a **domain** – time may sync from the domain controller.
  * Ensure **Internet access** and UDP port **123** is not blocked.
  * Try rebooting after both steps.

---

## 🧪 Tested On

* Windows 11 Pro (23H2)
* Windows 10 Pro (as fallback)

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙏 Credits

Created to simplify Windows Time troubleshooting for admins and users alike.

```

---

Would you like me to generate all three files (`README.md`, `windows-time-unregister.ps1`, and `windows-time-register.ps1`) in a downloadable `.zip`?
```
