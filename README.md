# openwrt-packages

建议使用Lean源进行编译。



## 使用方法：

添加 `src-git xiangfeidexiaohuo https://github.com/xiangfeidexiaohuo/openwrt-packages` 到OpenWRT源码根目录feeds.conf.default文件

然后执行

 `./scripts/feeds clean` 

 `./scripts/feeds update -a` 

 `./scripts/feeds install -a`



## 插件说明：

|插件名|功能|
| :----: | :----: |
| OpenAppFilter | app进行管控，应用过滤 |
| ddnsto | 远程设备管理 |
| k3screenctrl | 斐讯K3屏幕套件 |
| k3screenctrl_build | 斐讯K3屏幕套件 |
| luci-app-k3screenctrl | 斐讯K3屏幕控制 |
| linkease | 易有云 |
| luci-app-vssr | 翻墙插件 |
| lua-maxminddb | VSSR的依赖 |
| luci-theme-argon | 漂亮的主题 |
| luci-app-argon-config | argon主题的设置 |
| luci-app-autotimeset | 定时设置(重启、关机等) |
| luci-app-bypass | 一款翻墙插件 |
| luci-app-dnsfilter | 一款去广告插件 |
| luci-app-eqos | 简易QOS |
| luci-app-jd-dailybonus | 京豆签到 |
| luci-app-koolproxy | kp去广告 |
| luci-app-koolproxyR | kpr去广告 |
| luci-app-netdata | 设备监控(已添加中文) |
| luci-app-poweroff | 单独的关机 |
| luci-app-smartdns | smartdns插件 |
| smartdns | smartdns依赖 |
| luci-app-syncdial | 支持ipv6的多拨 |
| luci-app-adguardhome | ADG去广告 |
