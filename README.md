# Saving WEEE Waste MacBooks (and a MacMini) from landfill 

I have a YouTube channel where I try to save aging MacBooks from landfill. Mostly this is trouble-free, I am given or sometimes buy an old Apple computer that still looks great but has aged out and Apple are no longer supporting it. I don't want a house full of old Macs (old as in not old enough to be vintage, but old enough to be useless in Apple's eyes), so I usually have an idea for who will receive this item when I'm finished, and as a result I usually either install a Linux distribution or if the hardware is a bit newer and/or the intended recipient is a little less likely to thrive in the Linux world, then I use the fantastic **Open Core Legacy Patcher** to install one of the newer MacOS versions that are tricked into thinking they can run on older hardware. In most cases, I would recommend OCLP to anyone else doing this sort of thing as the tool has matured well and in most cases, makes it very easy to get a new (or the newest) version of MacOS running on an older Mac. 

Find out more about **OCLP** here CLICKY

# Mobile Device Manager

Sometimes, I come across nice looking Macs (so far a couple of portables and even a MacMini once) that have been enrolled in something called **Mobile Device Management**. This is a way for a company to control what you install on a computer, or ensure you use a complicated password, disk encryption, or any other number of things. It should also be noted that **MDM**s are used to secure company assets, there is always a chance that the device has been stolen or lost and the **MDM** can be used to remotely lock the device and even remotely wipe the device. This might not sound too impressive, remote wipe is something available to consumers with laptops signed into iCloud, but this wasn't always the case. 

## Reasons to remove and MDM

I'm making it clear that this is not a guide for getting around stolen MacBooks, further to this, I would recommend you also sign into iCloud on your MacBooks using either a personal or work iCloud account, this will allow you to enable an **Activation Lock** which cannot be bypassed at all, a Laptop in Activation Lock mode is bricked until the Activation Lock is removed by rightful owner. 

It should also be noted that even if you remove MDM, it is not a permanent fix, the next big OS update or you manually restoring the device will likely trigger the MDM enrollment again, this is by design. 

However, there are genuine reasons why you might want to bypass the MDM. 

1. Preventing WEEE Waste
2. Making life a bit harder for your companies IT Manager
3. To fix something on the laptop (sometimes even the IT staff need to bypass MDM without removing it from enrollment)

# What about a T2 locked device? 

Legit reasons for being in recipt of a locked MacBook are basically when companies dispose of unwanted devices, the device is no longer useful to them, they don't want to spend time working on it, especially if they have confidence in that T2 chip preventing any new owners from being able to decrypt the data on the device, so they just throw them. **NB** a T2 locked device isn't necessarily the same as a MDM locked device, these processes can be independent of one another, but I am putting it here because there are occasions where you need to do both in order to rescue an abandonded Mac. 

If your device is T2 locked, and I mean _NOT_ an Activation Lock (that baby is unlockable, except by iCloud owner) then you can still rescue the device, but you need another Mac to do it. 

- You need to connect a USB-C cable to the **second port** on the **left** side of the locked MacBook
- You need to download, install and open **Apple Configurator 2** from the App Store on your working Mac
- Connect the other end of the USB-C cable to the working Mac (doesn't matter which port)
- Hold the power butten on the locked MacBook for about 8 seconds and let go
- The working Mac should say something like 'Allow Thunderbolt Accessory' or something like that, say yes
- You will then see the other device in the centre of the Configurator screen, it will either look like a big padlock or say DFU
- In Actions Menu (Apple COnfigurator on Working Mac) click on **Actions** and **Restore**
- This might seem to take ages, or maybe it does just take ages, and you may not see much visual indication of anything on the Locked MacBook (in fact, expect that screeen to remain off the entire time). Do not disturb the process, else the chances of having a bricked laptop at the end of it are exponential.
- Eventually process finishes and the Locked MacBook will reboot, you will likely see a folder with a question mark on the locked MacBook
- This is not a bad thing... This means that the device is now unlocked and ready for recovery, it just means that the MacBook doesn't know what to do, that's because it no longer has an Operating System and will need a MacOS reinstall to move forward.

THIS IS WORKING DOCUMENT - WILL CONTINUE LATER
