#!/usr/local/bin/zsh

source /Users/ada/.zshrc

defaults read com.google.Keystone.Agent
RESULT=$?

if [ ${RESULT} -eq 0 ]
then
    defaults write com.google.Keystone.Agent checkInterval 0
fi

if [ -d ~/Library/Google/GoogleSoftwareUpdate ]
then
    ~/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/ksinstall --uninstall
    touch ~/Library/Google/GoogleSoftwareUpdate
    chmod 444 ~/Library/Google/GoogleSoftwareUpdate
else
    sudo /Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/ksinstall --uninstall
    sudo touch /Library/Google/GoogleSoftwareUpdate
    sudo chmod 444 /Library/Google/GoogleSoftwareUpdate
fi

cat <<END
以下檔案不應該存在：

~/Library/Caches/com.google.Keystone.Agent
~/Library/LaunchAgents/com.google.Keystone.agent.plist
~/Library/Preferences/com.google.Keystone.Agent.plist

END