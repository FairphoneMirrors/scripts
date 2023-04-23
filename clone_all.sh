#!/bin/bash

declare -A repos=(
   #["githubrepo"]="fp/gerrit/path"
#    ["android_bootable_recovery"]="platform/bootable/recovery"
#    ["android_device_fairphone_FP2"]="device/fairphone_devices/fairphone"
#    ["android_device_qcom_common"]="device/qcom/common"
    ["android_kernel_fairphone_msm8974"]="kernel/msm"
    ["kernel_lk"]="kernel/lk"
    ["kernel_msm-4.9"]="kernel/msm-4.9"
#    ["android"]="manifest"
#    ["android_system_core"]="platform/system/core"
#    ["android_packages_apps_FairphoneUpdater"]="vendor/fairphone/apps/Updater"
#    ["android_packages_apps_FairphoneLauncher3"]="vendor/fairphone/apps/Launcher"
#    ["android_packages_apps_ProximitySensor"]="vendor/fairphone/apps/ProximitySensor"
#    ["android_packages_apps_CameraSwapInfo"]="vendor/fairphone/apps/CameraSwapInfo"
#    ["android_packages_apps_ModuleDetect"]="vendor/fairphone/apps/ModuleDetect"
#    ["android_frameworks_base"]="platform/frameworks/base"
#    ["android_vendor_fairphone_FP2"]="vendor/fairphone/fp2"
#    ["android_vendor_fairphone_frameworks_common"]="vendor/fairphone/frameworks/common"
#    ["hiccup-server"]="tools/hiccup/hiccup-server"
    )

for repo in ${!repos[@]}; do
    value="${repos[$repo]}"
    echo "Processing: $repo - $value"
    # Clone
    if [ ! -d $repo ]; then
        git clone --mirror https://gerrit-public.fairphone.software/$value $repo
        git -C $repo remote add github git@github.com:FairphoneMirrors/$repo.git
    fi
done
