# openwrt-packages

建议使用Lean源码进行编译。

[Lean源码](https://github.com/coolsnowwolf/lede)


## 使用方法：

添加 `src-git xiangfeidexiaohuo https://github.com/xiangfeidexiaohuo/openwrt-packages` 到OpenWRT源码根目录feeds.conf.default文件

然后执行
```
./scripts/feeds clean

./scripts/feeds update -a 

./scripts/feeds install -a
```

## 提醒

### Lean源码自带了某些老版本的插件，建议提前删除
```
rm -rf ./package/lean/k3screenctrl

rm -rf ./package/lean/luci-app-syncdial

rm -rf ./package/lean/luci-lib-docker

rm -rf ./package/lean/luci-theme-argon

rm -rf ./package/lean/luci-app-jd-dailybonus

rm -rf ./package/lean/luci-app-diskman
```

然后拉取我的源码，`./scripts/feeds install -a`完成后再进行如下操作:
```
ln -s -f ../../../feeds/xiangfeidexiaohuo/k3screenctrl package/feeds/xiangfeidexiaohuo/k3screenctrl
```

### Lean等源码编译bypass前请先执行
```
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}

find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}
```

### files-补充汉化
```
cp -f ./feeds/xiangfeidexiaohuo/files/udpxy.lua ./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi

cp -f ./feeds/xiangfeidexiaohuo/files/mwan3.po ./feeds/luci/applications/luci-app-mwan3/po/zh-cn
```

## 插件说明：

|插件名|功能|
| :----: | :----: |
| openwrt-passwall | xiaorouji的passwall翻墙插件全套 |
| helloworld/luci-app-ssr-plus | 大雕的ssr-plus翻墙插件(所需依赖passwall已包含) |
| OpenClash/luci-app-openclash | OpenClash翻墙插件 |
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
| luci-app-jd-dailybonus | 京豆签到 |
| luci-app-koolproxy | kp去广告 |
| luci-app-koolproxyR | kpr去广告 |
| luci-app-poweroff | 单独的关机 |
| luci-app-smartdns | smartdns插件 |
| smartdns | smartdns依赖 |
| luci-app-syncdial | 支持ipv6的多拨 |
| luci-app-adguardhome | ADG去广告 |
| luci-app-dockerman | Docker管理 |
| luci-app-homeconnect | IPSecVPN客户端 |
| luci-app-homeredirect | 端口转发工具 |
| luci-app-serverchan | Server酱微信/Telegram 推送 |
| luci-app-diskman | 磁盘管理 |
| luci-app-eqos | eqos简单IP限速控制服务 |
| v2ray | 某些翻墙插件的依赖v2ray控件 |

## 致谢

https://github.com/fw876/helloworld

https://github.com/xiaorouji/openwrt-passwall

https://github.com/garypang13/luci-app-bypass

https://github.com/vernesong/OpenClash

https://github.com/garypang13/luci-app-dnsfilter

https://github.com/tty228/luci-app-serverchan

https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng

https://github.com/jerrykuku/openwrt-package

https://github.com/sirpdboy/sirpdboy-package

https://github.com/rufengsuixing/luci-app-syncdial

...等等


