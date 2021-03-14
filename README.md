# openwrt-packages

建议使用Lean源码进行编译。

[Lean源码](https://github.com/coolsnowwolf/lede)


## 使用方法：

### 1.Lean源码自带了某些老版本的插件，建议提前删除
```
rm -rf ./package/lean/k3screenctrl
rm -rf ./package/lean/luci-app-syncdial
rm -rf ./package/lean/luci-lib-docker
rm -rf ./package/lean/luci-app-diskman
rm -rf ./package/lean/luci-app-sfe  #若要用本源的luci-app-sfe(有Nat开关，无DNS加速)

```

### 2.添加本插件库到OpenWRT源码根目录feeds.conf.default文件

```
echo -e "\nsrc-git xiangfeidexiaohuo https://github.com/xiangfeidexiaohuo/openwrt-packages" >> feeds.conf.default

./scripts/feeds clean
./scripts/feeds update -a 
./scripts/feeds install -a
```

### 3.链接丢失的文件(不编译斐讯K3可略过)

```
ln -s -f ../../../feeds/xiangfeidexiaohuo/k3screenctrl package/feeds/xiangfeidexiaohuo/k3screenctrl
```

### 4.docker for openwrt相关套件全部更新了，编译dockerman需要替换默认的老的依赖(不编译docker相关可略过)
```
rm -rf package/feeds/packages/containerd
rm -rf package/feeds/packages/runc
rm -rf package/feeds/packages/tini
rm -rf package/feeds/packages/docker-ce
rm -rf package/feeds/packages/libnetwork
ln -s -f ../../../feeds/xiangfeidexiaohuo/docker-op/containerd package/feeds/xiangfeidexiaohuo/containerd
ln -s -f ../../../feeds/xiangfeidexiaohuo/docker-op/docker-ce package/feeds/xiangfeidexiaohuo/docker-ce
ln -s -f ../../../feeds/xiangfeidexiaohuo/docker-op/runc package/feeds/xiangfeidexiaohuo/runc
ln -s -f ../../../feeds/xiangfeidexiaohuo/docker-op/tini package/feeds/xiangfeidexiaohuo/tini
ln -s -f ../../../feeds/xiangfeidexiaohuo/docker-op/libnetwork package/feeds/xiangfeidexiaohuo/libnetwork
```

### 5.Lean等源码编译bypass前请先执行(不编译bypass可略过)
```
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}
```

### 6.files-补充汉化
```
cp -f ./feeds/xiangfeidexiaohuo/files/udpxy.lua ./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi
cp -f ./feeds/xiangfeidexiaohuo/files/mwan3.po ./feeds/luci/applications/luci-app-mwan3/po/zh-cn
```

### 7.然后开始编译

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
| v2ray | bypass依赖v2ray |
| redsocks2 | bypass依赖redsocks2 |
| luci-app-sfe | Turbo ACC网络加速(有Nat开关，无DNS加速) |



