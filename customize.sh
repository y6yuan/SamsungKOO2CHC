##########################################################################################
#
# Magisk
# by topjohnwu
# 
# This is a template zip for developers
#
##########################################################################################
##########################################################################################
# 
# Instructions:
# 
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure the settings in this file (common/config.sh)
# 4. For advanced features, add shell commands into the script files under common:
#    post-fs-data.sh, service.sh
# 5. For changing props, add your additional/modified props into common/system.prop
# 
##########################################################################################

##########################################################################################
# Defines
##########################################################################################

# NOTE: This part has to be adjusted to fit your own needs

# This will be the folder name under /magisk
# This should also be the same as the id in your module.prop to prevent confusion
MODID=samsungkoo2chn

# Set to true if you need to enable Magic Mount
# Most mods would like it to be enabled
AUTOMOUNT=true

# Set to true if you need to load system.prop
PROPFILE=true

# Set to true if you need post-fs-data script
POSTFSDATA=true

# Set to true if you need late_start service script
LATESTARTSERVICE=false

##########################################################################################
# Installation Message
##########################################################################################

# Set what you want to show when installing your mod

print_modname() {
  ui_print "*************************************************************************************************************"
  ui_print "     Decoded CSC Features Files plus some Chinese features for Samsung Galaxy S20/S20+/S20 Ultra Exynos devices        "
  ui_print "*************************************************************************************************************"
}

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# By default Magisk will merge your files with the original system
# Directories listed here however, will be directly mounted to the correspond directory in the system

# You don't need to remove the example below, these values will be overwritten by your own list
# This is an example
REPLACE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
/optics
"

# Construct your own list here, it will overwrite the example
# !DO NOT! remove this if you don't need to replace anything, leave it empty as it is now
REPLACE="
/system/priv-app/Fast
/system/priv-app/SmartCallProvider
/system/priv-app/KT114Provider2
/system/priv-app/KTHiddenMenu
/system/priv-app/KTOneStore
/system/priv-app/KTPushNotiService
/system/priv-app/KTServiceAgent
/system/priv-app/KTServiceMenu
/system/priv-app/LGUGPSnWPS
/system/priv-app/LGUHiddenMenu
/system/priv-app/LGUOZStore
/system/priv-app/OneStoreService
/system/priv-app/SKTHiddenMenu
/system/priv-app/SKTOneStore
/system/priv-app/SmartPush
/system/priv-app/SamsungPass
/system/priv-app/AuthFramework
/system/app/SamsungPassAutofill_v1
/system/app/BlockchainBasicKit
/system/app/KTAuth
/system/app/KTCustomerService
/system/app/LGUMiniCustomerCenter
/system/app/LGUplusTsmProxy
/system/app/LGUSetting
/system/app/SKTFindLostPhone
/system/app/SKTMemberShip
/system/app/SKTUsimService
/system/app/Privacy
/system/app/HiyaService
/system/app/MinusOnePage
"

##########################################################################################
# Permissions
##########################################################################################

# NOTE: This part has to be adjusted to fit your own needs

set_permissions() {
  # Default permissions, don't remove them
  set_perm_recursive  $MODPATH  0  0  0755  0644

  # Only some special files require specific permissions
  # The default permissions should be good enough for most cases

  # Some templates if you have no idea what to do:

  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  #set_perm_recursive  $MODPATH/system/priv-app/AppLock       0       0       0755            0644

  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm  $MODPATH/system/bin/app_process32   0       2000    0755         u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0       2000    0755         u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0       0       0644
}
