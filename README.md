# openwrt-packages

建议使用Lean源码进行编译。

[Lean源码](https://github.com/coolsnowwolf/lede)


## 插件说明：

|插件名|功能|
| :----: | :----: |
| docker-op | openwrt的docker全套 |
| k3screenctrl | 斐讯K3屏幕套件 |
| k3screenctrl_build | 斐讯K3屏幕套件 |
| luci-app-k3screenctrl | 斐讯K3屏幕控制 |
| luci-app-autotimeset | 定时设置(重启、关机等) |
| luci-app-koolproxy | kp去广告 |
| luci-app-koolproxyR | kpr去广告 |
| luci-app-poweroff | 单独的关机 |
| luci-app-smartdns | smartdns插件 |
| smartdns | smartdns依赖 |
| luci-app-syncdial | 支持ipv6的多拨 |
| luci-app-adguardhome | ADG去广告 |
| luci-app-homeconnect | IPSecVPN客户端 |
| luci-app-homeredirect | 端口转发工具 |
| luci-app-diskman | 磁盘管理 |
| luci-app-eqos | eqos简单IP限速控制服务 |
| luci-app-advanced | 高级设置，可直接修改某些配置 |
| luci-app-serverchan | Server酱微信/Telegram 推送的插件 |



## 提醒：

### 1.Lean源码自带了某些老版本的插件，建议提前删除

package/lean/k3screenctrl、luci-app-syncdial、luci-app-diskman、luci-lib-docker

feeds/packages/net/smartdns

### 2.files-补充汉化

udpxy.lua替换到feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi

mwan3.po替换到feeds/luci/applications/luci-app-mwan3/po/zh-cn

