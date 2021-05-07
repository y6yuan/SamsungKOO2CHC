#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread
mount --bind $MODDIR/optics_new /optics

mkdir -p $MODDIR/system/vendor/etc
cp -af /vendor/etc/floating_feature.xml $MODDIR/system/vendor/etc

# BixbyTouch
sed -i '/<\/SecFloatingFeatureSet>/i\<SEC_FLOATING_FEATURE_COMMON_SUPPORT_BIXBY_TOUCH>TRUE<\/SEC_FLOATING_FEATURE_COMMON_SUPPORT_BIXBY_TOUCH>' $MODDIR/system/vendor/etc/floating_feature.xml
# Auto Power on and off
sed -i '/<\/SecFloatingFeatureSet>/i\<SEC_FLOATING_FEATURE_SETTINGS_SUPPORT_AUTO_POWER_ON_OFF>TRUE<\/SEC_FLOATING_FEATURE_SETTINGS_SUPPORT_AUTO_POWER_ON_OFF>' $MODDIR/system/vendor/etc/floating_feature.xml

#SmartManager CN
#sed -i '/<SEC_FLOATING_FEATURE_SMARTMANAGER_CONFIG_PACKAGE_NAME>/d' $MODDIR/system/vendor/etc/floating_feature.xml
#sed -i '/<\/SecFloatingFeatureSet>/i\<SEC_FLOATING_FEATURE_SMARTMANAGER_CONFIG_PACKAGE_NAME>com.samsung.android.sm_cn<\/SEC_FLOATING_FEATURE_SMARTMANAGER_CONFIG_PACKAGE_NAME>' $MODDIR/system/vendor/etc/floating_feature.xml

#DeviceMonitor CN
#sed -i '/<SEC_FLOATING_FEATURE_SECURITY_CONFIG_DEVICEMONITOR_PACKAGE_NAME>/d' $MODDIR/system/vendor/etc/floating_feature.xml
#sed -i '/<\/SecFloatingFeatureSet>/i\<SEC_FLOATING_FEATURE_SECURITY_CONFIG_DEVICEMONITOR_PACKAGE_NAME>com.samsung.android.devicesecurity.tcm<\/SEC_FLOATING_FEATURE_SECURITY_CONFIG_DEVICEMONITOR_PACKAGE_NAME>' $MODDIR/system/vendor/etc/floating_feature.xml


prism
mkdir -p $MODDIR/prism_new
cp -afr /prism/etc $MODDIR/prism_new
sed -i '/AppLock.apk/d' $MODDIR/prism_new/etc/carriers/single/KOO/enforceskippingpackages.txt
mount --bind $MODDIR/prism_new/etc /prism/etc
