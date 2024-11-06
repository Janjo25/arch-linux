# How to Fix the Clock Desynchronization Issue Between Windows and Linux

If you're dual-booting Linux and Windows and notice the time gets messed up when switching between the two, it's because
they handle the hardware clock differently:

- **Linux** uses the hardware clock (RTC) in **UTC** and adjusts for your time zone.
- **Windows** by default uses the hardware clock as **local time**.
  The solution? Change **Windows** to also use **UTC**.

## Here's what to do:

### 1. Change Windows to use UTC:

1. Press `Win + R`, type **regedit**, and hit Enter to open the Registry Editor.
2. Navigate to: `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation`
3. Right-click on an empty space in the right-hand panel and select **New > DWORD (32-bit) Value**.
4. Name it **RealTimeIsUniversal**.
5. Double-click on **RealTimeIsUniversal** and set its value to **1**.
6. Click **OK** and close the Registry Editor.

### 2. Reboot:

Restart your Windows system, then check if the time stays correct after switching between Windows and Linux.
