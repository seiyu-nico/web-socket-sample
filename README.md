# WebSocketサンプルリポジトリ

## 初期設定
- Flutter上にはURLがべた書きされているので適宜変更する
  - src-frontend/lib/config/url_config.dart

## エミュレータで実行する場合
- ローカルにDNSサーバを起動してエミュレータのDNSの向き先をそちらに向ける
## Mac
emulator -avd <エミュレータのID> -dns-server <macのIPv4アドレス>
emulator -avd Pixel_6_Pro_API_34 -dns-server 192.168.1.111

## wsl
emulator -avd <エミュレータのID> -dns-server <wslのIPアドレス>
emulator -avd Pixel_6_Pro_API_34 -dns-server 172.22.40.5
