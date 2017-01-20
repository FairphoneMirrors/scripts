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
    ["FairphoneUpdater"]="platform/packages/apps/FairphoneUpdater"
    )

for repo in ${!repos[@]}; do
    value="${repos[$repo]}"
    ssh=${repo//_}
    echo "Processing: $repo - $value"
    # Clone
    if [ ! -d $repo ]; then
        git clone --mirror http://code.fairphone.com/gerrit/fp2-dev/$value $repo
        git remote add github git@$ssh.github.com:FairphoneMirrors/$repo.git
    fi
    # SSH entry
    if ! grep -q $ssh.github.com ~/.ssh/config; then
        echo "Host $ssh.github.com" >> ~/.ssh/config
        echo "	HostName github.com" >> ~/.ssh/config
        echo "	IdentityFile ~/.ssh/github_$ssh" >> ~/.ssh/config
        echo >> ~/.ssh/config
	echo "WARNING: Added SSH entry to ~/.ssh/config"
    fi
    # SSH key
    if [ ! -f ~/.ssh/github_$ssh ]; then
        echo "WARNING: SSH file doesn't exist!"
        echo "WARNING: Run \"ssh-keygen -f $HOME/.ssh/github_$ssh\"."
        echo "WARNING: Afterwards, create the github repository \"$repo\" and add a deploy key with push access."
    fi
done
