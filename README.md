# WebSocketサンプルリポジトリ

# エミュレータで実行する場合
- ローカルにDNSサーバを起動してエミュレータのDNSの向き先をそちらに向ける
## Mac
emulator -avd <エミュレータのID> -dns-server <macのIPv4アドレス>
emulator -avd Pixel_6_Pro_API_34 -dns-server 192.168.1.111

## wsl
emulator -avd <エミュレータのID> -dns-server <イーサネット アダプター vEthernet (WSL):のIPアドレス>
emulator -avd Pixel_6_API_33 -dns-server 172.21.144.1
