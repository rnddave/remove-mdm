# How to unlock a locked T2 equiped device? 

## What is the T2? 

The **Apple T2 chip** is a custom security and controller chip introduced by Apple in **2017**. It serves multiple functions, including **secure boot, encrypted storage, enhanced image processing, and audio management**.  

### **Introduction & Purpose**  
The T2 chip was first introduced with the **iMac Pro (2017)** and later integrated into **MacBook Pro (2018)** and subsequent models. It acts as a co-processor, handling **storage encryption, Touch ID security, and system management tasks** and apparently also improving *FaceTime HD camera* **image processing** and even some **Hey Siri** functionality.  

### **Devices Featuring the T2 Chip**  

The T2 chip was included in a few Intel based Apple devices:  

- **iMac Pro (2017)**  
- **Mac mini (2018)**  
- **MacBook Air (2018-2020)**  
- **MacBook Pro (2018-2020)**  
- **Mac Pro (2019)**  

### **Replacement**  
The T2 chip was effectively **replaced by the Apple Silicon (M1) chip** in **2020**, as Apple’s **M-series** processors integrated the T2 chip’s security and management functions directly into the **SoC** (System on a Chip), eliminating the need for a separate co-processor.  

---

## Why you might need to unlock a T2 locked Mac?

Legit reasons for being in recipt of a **locked** MacBook (or other Apple device) are basically when companies dispose of unwanted devices, the device is no longer useful to them, they don't want to spend time working on it, especially if they have confidence that the T2 chip will prevent any new owners from being able to decrypt the data on the device, so they just throw them. **NB** a T2 locked device isn't necessarily the same as a **MDM** locked device, these processes can be independent of one another. 

**Want to bypass the MDM software? Click** [HERE](README.md). 

If your device is T2 locked, and I mean _NOT_ an **Activation Lock** (that baby is unlockable, except by the rightful iCloud owner as far as I know) then you **can** still rescue the device, but you do need another Mac to do it. 

## Why can't you just use **Recovery** options to wipe the Disk and start again?

I suppose it depends how the device was setup, but I believe that most corporate types will use **Secure Boot** to ensure that no-one can re-install the OS, or bypass their **Mobile Device Management** settings, install a new Operating System, reset passwords for any user using the **terminal** in **Recovery mode** etc. Basically, pre-T2 Macs were quite esy to take control of and remove your employers software configurations etc, the T2 chip made it a lot harder. 

## Steps to reset a T2 Locked Mac:

- You need to connect a USB-C cable to the **second port** on the **left** side of the locked MacBook
- - (I have only looked at MacBooks, I don't know how this works on Desktop based Mac)
- You need to download, install and open **Apple Configurator 2** from the App Store on your working Mac
- Connect the other end of the USB-C cable to the working Mac (doesn't matter which port)
- Hold the power butten on the locked MacBook for about 8 seconds and let go
- The working Mac should say something like 'Allow Thunderbolt Accessory' or something like that, say yes
- You will then see the other device in the centre of the Configurator screen, it will either look like a big padlock or say DFU
- In Actions Menu (Apple Configurator on Working Mac) click on **Actions** and **Restore**
- This might seem to take ages, or maybe it does just take ages, and you may not see much visual indication of anything on the _Locked MacBook_ (in fact, expect that locked iDevice screeen to remain off the entire time).
- Do not disturb the process, else the chances of having a bricked laptop at the end of it are exponential.
- Eventually process finishes and the Locked MacBook will reboot, you will likely see a folder with a **question mark** on the locked MacBook
- This is not a bad thing... This means that the device is now unlocked and ready for recovery, it just means that the MacBook doesn't know what to do, that's because it no longer has an **Operating System** and will need a **MacOS** reinstalled to move forward.

## Why would this work? 

From what I can tell, the T2 chip occasionally needs to have new firmware, it does, afterall, contain 2 different micro-operating-systems, there's a lot going on in there. Unfortunately there is always a risk, when doing any update, that things will go worng, so when that update is for firmware, the disruption can be significant if things go wrong. Apple introduced the ability to recover the firmware on a T2 chip, what we're describing here is the process to recover the T2 chip. Now, **recovery** is a bit of a stretch, because at the end of this process, the device is completely wiped. I mean the data might still be on the storage device, but without the decryption keys stored on the T2, that data cannot be accessed, so the **recovery** here is that you didn't lose your laptop / iDevice, it can be essentially factory reset and you can start again. Luckily, the instances of a corrupt T2 firmware are very few and far between, so the need to do this is not significant. 

The reason it works in the case of a locked T2 iDevice is that the T2 chip doesn't know if it has a corrupt firmware, therefore it can't prevent you from essentially doing the same thing, wiping all the data, resetting to factory and then freshly downloading a recovery OS from Apple directly. 
