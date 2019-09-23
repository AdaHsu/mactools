# 自動切換網路位置

1. 將 auto_switch_location.sh 複製到 ~/tools 下並設為可執行，若要更換目錄則必須修改 tw.adahsu.checkWifiSSID.plist 內的路徑 
    ```bash
    cp auto_switch_location.sh ~/tools
    chmod +x ~/tools/auto_switch_location.sh
    ```
2. 將 tw.adahsu.checkWifiSSID.plist 複製到 ~/Library/LaunchAgents
    ```bash
    cp tw.adahsu.checkWifiSSID.plist ~/Library/LaunchAgents
    ```
3. 載入 tw.adahsu.checkWifiSSID.plist
    ```bash
    launchctl load ~/Library/LaunchAgents/tw.adahsu.checkWifiSSID.plist
    ```
4. 檢查設定是否正確，狀態欄位必須為 0
    ```bash
    launchctl list | grep tw
    ```
5. 啟用 tw.adahsu.checkWifiSSID.plist
    ```bash
    launchctl start tw.adahsu.checkWifiSSID
    ```
6. 停用 tw.adahsu.checkWifiSSID.plist
    ```bash
    launchctl stop tw.adahsu.checkWifiSSID
    ```
7. 卸載 tw.adahsu.checkWifiSSID.plist
    ```bash
    launchctl unload ~/Library/LaunchAgents/tw.adahsu.checkWifiSSID.plist
    ```