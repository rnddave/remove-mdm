# Saving WEEE Waste MacBooks (and a Mac Mini) from Landfill

I run a [YouTube channel](https://www.youtube.com/@WhatTheFlash-cx6ox) where I try to rescue aging MacBooks from landfill. Most of the time, this is a smooth process. I either receive or purchase an old Apple computer that still looks great but has aged out of Apple's support cycle. I don’t want a house full of old Macs (not old enough to be vintage, but old enough to be useless in Apple’s eyes), so I usually have an idea of who will receive the device when I’m finished. 

Depending on the recipient, I either install a Linux distribution or, if the hardware is a bit newer and/or the intended user is less likely to thrive in the Linux world, I use the fantastic **Open Core Legacy Patcher** (**OCLP**) to install a newer MacOS version. **OCLP** tricks older hardware into running MacOS versions that Apple no longer officially supports. This tool has matured well and makes it relatively easy to install newer MacOS versions on older Macs.

Find out more about **OCLP** [here](https://dortania.github.io/OpenCore-Legacy-Patcher/).

## Mobile Device Manager

Sometimes, I come across nice-looking Macs (so far, a couple of portables and even a Mac Mini) that have been enrolled in **Mobile Device Management** (**MDM**). This allows companies to control what users install, enforce security policies (e.g., password complexity, disk encryption), and manage remote device access. **MDM** can also be used to remotely lock or wipe a device, which is particularly useful for lost or stolen company assets.

It's important to distinguish **MDM** from **Activation Lock** or a **T2 Locked** device. Click [here](unlocking-a-t2-mac.md) to learn more about bypassing **T2 Locked** devices.

## Reasons to Remove an MDM

Let me be absolutely clear, this is **not** a guide for bypassing security on stolen MacBooks. If that’s what you’re looking for, you’re in the wrong place. 

For legitimate users, however, there are valid reasons to bypass **MDM**, such as:

1. Preventing WEEE Waste.
2. Regaining control over a personally owned or retired work device.
3. Troubleshooting issues (even IT staff sometimes need to bypass **MDM** without permanently removing enrollment).

## How to Remove an MDM

### Prerequisites ⚠️
- **Device language must be set to English. It can be changed afterward.** (at least for _my_ script to work)
- A fresh MacOS installation is **recommended** but not required.

### Steps:
1. **Boot into Recovery Mode**.
2. **Use Disk Utility** to **erase** the current disk.
3. **Rename your new volume** (optional, but "Macintosh HD" is recommended).
4. **Reinstall MacOS** (from Recovery Mode or an external USB installer).

Once installation is complete, the device will restart and present the setup wizard. One of the first steps is the network setup, so join the network and when you see the MDM Enrollment message, then  **DO NOT proceed past this step!** Instead:

5. Turn off the device.
6. Boot **back into Recovery Mode**:
   - **Apple Silicon Macs:** Hold the power button.
   - **Intel Macs:** Hold <kbd>CMD</kbd> + <kbd>R</kbd> during boot.
7. Connect to Wi-Fi.
8. Open **Safari** and navigate to [the script in my GitHub repo](https://github.com/rnddave/remove-mdm/blob/main/README.md).
9. Copy the following command:

    ```zsh
    curl https://github.com/rnddave/remove-mdm/blob/main/mdm-cleaner.sh -o mdm-cleaner.sh && chmod +x ./mdm-cleaner.sh && ./mdm-cleaner.sh
    ```

10. Open **Terminal** (Utilities > Terminal).
11. Paste the command (<kbd>CMD</kbd> + <kbd>V</kbd>) and press **Enter**.
12. Select **1** to run the MDM bypass script.
13. Press **Enter** to accept the default username (**Apple**).
14. Press **Enter** to accept the default password (**12345**).
15. Wait for the script to finish and reboot your Mac.

### After Rebooting
16. Log in with **Username:** Apple | **Password:** 12345.
17. Skip setup steps (Apple ID, Siri, Touch ID, Location Services).
18. Go to **System Settings > Users and Groups** and create your proper user account (probably a good idea to set yourself as an Admin).
19. Log out of the temporary **Apple** account and log into your new account.
20. If your new account is an admin, delete the temporary **Apple** account.

## I Don't Want to Wipe My MacOS Installation—What Can I Do?

This is **not guaranteed** to be trouble-free and depends on the age of your device and how your system administrator has configured it. If **Secure Boot** is enabled (which is common for Macs after 2017), you may need an admin password to access Recovery Mode.

However, if you can access **Recovery Mode** without an admin password, you can try the following:

1. Open **Terminal** (Utilities > Terminal).
2. Type `cd /Volumes/` and then `ls` to list available volumes.
3. Identify the correct system volume (e.g., "Macintosh HD").
4. Run (where **$system_volume** is the name of your volume as per step 3):

    ```shell
    rm -rf /Volumes/"$system_volume"/var/db/ConfigurationProfiles/Settings/.cloudConfigHasActivationRecord
    rm -rf /Volumes/"$system_volume"/var/db/ConfigurationProfiles/Settings/.cloudConfigRecordFound
    touch /Volumes/"$system_volume"/var/db/ConfigurationProfiles/Settings/.cloudConfigProfileInstalled
    touch /Volumes/"$system_volume"/var/db/ConfigurationProfiles/Settings/.cloudConfigRecordNotFound
    ```

5. Block MDM servers:

    ```shell
    echo "0.0.0.0 deviceenrollment.apple.com" >>/Volumes/"$system_volume"/etc/hosts
    echo "0.0.0.0 mdmenrollment.apple.com" >>/Volumes/"$system_volume"/etc/hosts
    echo "0.0.0.0 iprofiles.apple.com" >>/Volumes/"$system_volume"/etc/hosts
    ```

### Final Warning
Tampering with MDM settings—especially on a work-issued device—could have **serious consequences**, including termination of employment. This guide is intended **only for IT professionals** troubleshooting company devices and **System Recyclers**.

_Sometimes fixing things means breaking them a little first…_
