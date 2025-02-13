# How to Unlock a Locked T2-Equipped Device  

## What is the T2 Chip?  

The **Apple T2 chip** is a custom security and controller chip introduced by Apple in **2017**. It serves multiple functions, including **secure boot, encrypted storage, enhanced image processing, and audio management**.  

### **Introduction & Purpose**  
The T2 chip was first introduced with the **iMac Pro (2017)** and later integrated into **MacBook Pro (2018)** and subsequent models. It acts as a co-processor, handling **storage encryption, Touch ID security, and system management tasks**. It also improves **FaceTime HD camera image processing** and enables **Hey Siri** functionality.  

### **Devices Featuring the T2 Chip**  

The T2 chip was included in several Intel-based Apple devices:  

- **iMac Pro (2017)**  
- **Mac mini (2018)**  
- **MacBook Air (2018-2020)**  
- **MacBook Pro (2018-2020)**  
- **Mac Pro (2019)**  

### **Replacement**  
The T2 chip was effectively **replaced by the Apple Silicon (M1) chip** in **2020**, as Apple’s **M-series** processors integrated the T2 chip’s security and management functions directly into the **SoC** (System on a Chip), eliminating the need for a separate co-processor.  

---

## Why Might You Need to Unlock a T2-Locked Mac?  

There are legitimate reasons for receiving a **locked** MacBook (or other Apple device), such as:  
- **Corporate disposal:** Some companies discard old hardware without wiping it properly, assuming the T2 chip will prevent unauthorized access.  
- **Second-hand purchase:** If the device was not properly reset before resale.  

> **Note:** A **T2 lock** is **not** the same as a **MDM (Mobile Device Management) lock**. These processes can be independent of each other.  

### **Activation Lock vs. T2 Lock**  
- **Activation Lock:** This is linked to an Apple ID. It **cannot be bypassed** unless you are the rightful iCloud owner.  
- **T2 Lock:** Prevents unauthorized OS installations but can be reset using another Mac.  

## Why Can't You Just Use Recovery Mode to Wipe the Disk?  

The **T2 chip's Secure Boot** feature ensures that only trusted macOS versions can be installed, preventing:  
- **Unauthorized OS reinstallation**  
- **MDM bypass attempts**  
- **Terminal commands in Recovery Mode**  

Prior to the T2 chip, MacBooks were relatively easy to reset and remove enterprise restrictions. The **T2 chip significantly enhances security**, making unauthorized resets much harder.  

---

## Steps to Reset a T2-Locked Mac  

> **⚠️ WARNING:** This process **completely wipes the Mac**, including all data. There is no way to recover files after this reset.  

### **What You Need:**  
1. **A second working Mac**  
2. **A USB-C cable** (Preferably Apple-certified)  
3. **Apple Configurator 2** (Download from the Mac App Store)  

### **Step-by-Step Guide:**  
1. **Connect the USB-C cable**  
   - Plug one end into the **second port (left side)** of the locked MacBook.  
   - Connect the other end to **any port** on the working Mac.  
   - (For desktop Macs, use a standard USB-C to USB-A cable if needed.)  

2. **Prepare the Locked MacBook**  
   - Hold the **power button** on the locked Mac for **8 seconds**, then release.  

3. **Authorize the Connection**  
   - On the working Mac, a prompt will appear: _"Allow Thunderbolt Accessory?"_  
   - Click **Allow**.  

4. **Use Apple Configurator 2**  
   - Open **Apple Configurator 2** on the working Mac.  
   - You should see the locked Mac in **DFU mode** (Device Firmware Update).  
   - It may display a **padlock icon** or simply say **DFU**.  

5. **Restore the Device**  
   - In **Apple Configurator 2**, click on **Actions → Restore**.  
   - The restore process will begin.  
   - The locked Mac’s screen **will remain off** throughout the process.  

6. **Wait for the Restore to Complete**  
   - The process **takes time** and does not show a progress bar.  
   - **⚠️ Do not unplug the device or interrupt the restore, as this could permanently brick the Mac.**  

7. **After the Restore Finishes**  
   - The locked Mac will **reboot** automatically.  
   - You will likely see a **flashing folder with a question mark** on the screen.  

---

## What Does the Flashing Question Mark Mean?  

This means the **device is now unlocked** but has **no operating system installed**.  

### **Next Steps:**  
- **Reconnect to Wi-Fi**  
- **Use Internet Recovery Mode**:  
  - Turn off the Mac.  
  - Turn it back on while holding **Option + Command + R**.  
  - Follow the on-screen instructions to **reinstall macOS**.  

---

## Why Does This Work?  

The **T2 chip runs its own firmware**, separate from macOS. Occasionally, this firmware needs updates.  
- If a T2 firmware update fails, the Mac may become unresponsive.  
- Apple provides a method to **restore** the firmware using **Apple Configurator 2**.  

### **Important Considerations:**  
- **This process does not bypass Activation Lock.** If the Mac is linked to an Apple ID, it will still require the original credentials after restoration.  
- **All data is lost** because the T2 chip encrypts the SSD. Without the original decryption keys (which are erased during restoration), data cannot be recovered.  

By following this method, you are essentially performing a **factory reset** of the device.  

---

### **Additional Resources**  
- [How to bypass the MDM](README.md)
- [Apple Configurator 2 User Guide](https://support.apple.com/guide/apple-configurator/welcome/mac)  
- [Apple Support: If your Mac doesn't start up](https://support.apple.com/en-us/HT204267)  
