#!/bin/bash

declare -A repos=(
   #["githubrepo"]="fp/gerrit/path"
    ["android_bootable_recovery"]="platform/bootable/recovery"
    ["android_device_fairphone_FP2"]="device/fairphone_devices/fairphone"
    ["android_device_qcom_common"]="device/qcom/common"
    ["android_kernel_fairphone_msm8974"]="kernel/msm"
    ["android_kernel_lk_fairphone_FP2"]="kernel/lk"
    ["android"]="manifest"
    ["android_system_core"]="platform/system/core"
    ["android_packages_apps_FairphoneUpdater"]="platform/packages/apps/FairphoneUpdater"
    ["android_packages_apps_FairphoneLauncher3"]="platform/packages/apps/FairphoneLauncher3"
    ["android_packages_apps_MyContactsWidget"]="platform/packages/apps/MyContactsWidget"
    ["android_packages_apps_ClockWidget"]="platform/packages/apps/ClockWidget"
    ["android_packages_apps_ProximitySensor"]="vendor/fairphone/packages/apps/ProximitySensor"
    ["android_packages_apps_CameraSwapInfo"]="vendor/fairphone/moduledetect/packages/apps/CameraSwapInfo"
    ["android_packages_apps_ModuleDetect"]="vendor/fairphone/moduledetect/packages/apps/moduledetect"
    ["android_frameworks_base"]="platform/frameworks/base"
    ["android_vendor_fairphone_FP2"]="vendor/fairphone/fp2"
    ["android_vendor_fairphone_frameworks_common"]="vendor/fairphone/frameworks/common"
    )

for repo in ${!repos[@]}; do
    value="${repos[$repo]}"
    echo "Processing: $repo - $value"
    # Clone
    if [ ! -d $repo ]; then
        git clone --mirror https://code.fairphone.com/gerrit/fp2-dev/$value $repo
        git -C $repo remote add github git@github.com:FairphoneMirrors/$repo.git
    fi
done
