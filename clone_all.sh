#!/bin/bash

declare -A repos=(
   #["githubrepo"]="fp/gerrit/path"
    ["android_bootable_recovery"]="platform/bootable/recovery"
    ["android_device_fairphone_fp2"]="device/fairphone_devices/fairphone"
    ["android_device_qcom_common"]="device/qcom/common"
    ["android_kernel_fairphone_fp2"]="kernel/msm"
    ["android_kernel_lk_fairphone_fp2"]="kernel/lk"
    ["android_manifest_fairphone_fp2"]="manifest"
    ["android_system_core"]="platform/system/core"
    ["android_packages_apps_FairphoneUpdater"]="platform/packages/apps/FairphoneUpdater"
    ["android_packages_apps_FairphoneLauncher3"]="platform/packages/apps/FairphoneLauncher3"
    ["android_packages_apps_MyContactsWidget"]="platform/packages/apps/MyContactsWidget"
    ["android_packages_apps_ClockWidget"]="platform/packages/apps/ClockWidget"
    )

for repo in ${!repos[@]}; do
    value="${repos[$repo]}"
    echo "Processing: $repo - $value"
    # Clone
    if [ ! -d $repo ]; then
        git clone --mirror http://code.fairphone.com/gerrit/fp2-dev/$value $repo
        git -C $repo remote add github git@github.com:FairphoneMirrors/$repo.git
    fi
done
