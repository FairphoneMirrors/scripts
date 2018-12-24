#!/bin/bash

declare -A repos=(
   #["githubrepo"]="fp/gerrit/path"
    ["android_bootable_recovery"]="fp2-dev/platform/bootable/recovery"
    ["android_device_fairphone_FP2"]="fp2-dev/device/fairphone_devices/fairphone"
    ["android_device_qcom_common"]="fp2-dev/device/qcom/common"
    ["android_kernel_fairphone_msm8974"]="fp2-dev/kernel/msm"
    ["android_kernel_lk_fairphone_FP2"]="fp2-dev/kernel/lk"
    ["android"]="fp2-dev/manifest"
    ["android_system_core"]="fp2-dev/platform/system/core"
    ["android_packages_apps_FairphoneUpdater"]="fp2-dev/platform/packages/apps/FairphoneUpdater"
    ["android_packages_apps_FairphoneLauncher3"]="fp2-dev/platform/packages/apps/FairphoneLauncher3"
    ["android_packages_apps_MyContactsWidget"]="fp2-dev/platform/packages/apps/MyContactsWidget"
    ["android_packages_apps_ClockWidget"]="fp2-dev/platform/packages/apps/ClockWidget"
    ["android_packages_apps_ProximitySensor"]="fp2-dev/vendor/fairphone/packages/apps/ProximitySensor"
    ["android_packages_apps_CameraSwapInfo"]="fp2-dev/vendor/fairphone/moduledetect/packages/apps/CameraSwapInfo"
    ["android_packages_apps_ModuleDetect"]="fp2-dev/vendor/fairphone/moduledetect/packages/apps/moduledetect"
    ["android_frameworks_base"]="fp2-dev/platform/frameworks/base"
    ["android_vendor_fairphone_FP2"]="fp2-dev/vendor/fairphone/fp2"
    ["android_vendor_fairphone_frameworks_common"]="fp2-dev/vendor/fairphone/frameworks/common"
    ["hiccup-server"]="tools/hiccup/hiccup-server"
    )

for repo in ${!repos[@]}; do
    value="${repos[$repo]}"
    echo "Processing: $repo - $value"
    # Clone
    if [ ! -d $repo ]; then
        git clone --mirror https://code.fairphone.com/gerrit/$value $repo
        git -C $repo remote add github git@github.com:FairphoneMirrors/$repo.git
    fi
done
