#!/usr/bin/bash
array=( https://extensions.gnome.org/extension/3193/blur-my-shell/
https://extensions.gnome.org/extension/517/caffeine/
https://extensions.gnome.org/extension/5721/clipboard-indicator/
https://extensions.gnome.org/extension/1112/screenshot-tool/
https://extensions.gnome.org/extension/906/sound-output-device-chooser/
https://extensions.gnome.org/extension/3088/extension-list/
https://extensions.gnome.org/extension/1108/add-username-to-top-panel/ 
https://extensions.gnome.org/extension/1162/emoji-selector/
https://extensions.gnome.org/extension/4167/custom-hot-corners-extended/ )

for i in "${array[@]}"
do
    EXTENSION_ID=$(curl -s $i | grep -oP 'data-uuid="\K[^"]+')
    VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=$EXTENSION_ID" | jq '.extensions[0] | .shell_version_map | map(.pk) | max')
    wget -O ${EXTENSION_ID}.zip "https://extensions.gnome.org/download-extension/${EXTENSION_ID}.shell-extension.zip?version_tag=$VERSION_TAG"
    gnome-extensions install --force ${EXTENSION_ID}.zip
    if ! gnome-extensions list | grep --quiet ${EXTENSION_ID}; then
        busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${EXTENSION_ID}
    fi
    gnome-extensions enable ${EXTENSION_ID}
    rm ${EXTENSION_ID}.zip
done
