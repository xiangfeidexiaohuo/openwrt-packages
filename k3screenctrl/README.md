## 简介

在 [zxlhhyccc/Hill-98-k3screenctrl](https://github.com/zxlhhyccc/Hill-98-k3screenctrl) 已经给K3屏幕开启了7屏的基础上，使用 [K3 openwrt18.06.02](https://www.right.com.cn/forum/thread-466672-1-1.html) 固件中的```/lib/k3screenctrl/```下的sh文件做了替换，并基于[lwz322/k3screenctrl](https://github.com/lwz322/k3screenctrl) 进行修改，意在修复睡死问题。
搭配的 luci-app 是根据固件的LuCi文件修改的 [likanchen/luci-app-k3screenctrl](https://github.com/likanchen/luci-app-k3screenctrl)

最后使用修改自 [lean/lede](https://github.com/lean/lede) 中的编译文件 [k3screenctrl_build](https://github.com/likanchen/k3screenctrl_build) 编译

我个人认为屏幕睡死的主要原因还是单片机本身性能问题，因此只保留了最常用的CPU温度显示，删除显示CPU负载、内存占用百分比和运行时间的功能。

## 屏幕界面

- 第一屏：升级界面
- 第二屏：型号(硬件版本型号H/W全部显示为A1)，MAC，软件版本
- 第三屏：USB与网口接入情况
- 第四屏：网速以及2.4G和5G WiFi的接入客户端数量
- 第五屏：天气，时间
- 第六屏：WiFi信息：SSID和密码（可选隐藏）
- 第七屏：已接入终端和网速（只统计IPv4转发）

## 已知问题

- 部分设备的屏幕在使用本软件后无法正常显示界面，可能是屏幕本身的固件版本较低，可以通过刷较新版本的官方/官改固件对屏幕固件升级
- 睡死问题正在进行测试
- 依靠IP定位偶尔可能无法定位到准确的城市，进而无法自动查询天气，建议关闭IP定位，手动指定城市
- 在开启硬件转发加速（HWNAT或者offload）的情况下，iptable无法统计流量

## SDK编译
因为在k3screenctrl的Makefile文件中有对机型的要求的倚赖，所以使用SDK单独编译k3screenctrl时，k3screenctrl不会被编译

具体也就是k3screenctrl_build文件中的DEPENDS：
```makefile
define Package/k3screenctrl
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=@TARGET_bcm53xx_DEVICE_phicomm-k3 +@KERNEL_DEVMEM +coreutils +coreutils-od +bash +curl
  TITLE:=LCD screen controller on PHICOMM K3
  URL:=https://github.com/likanchen/k3screenctrl.git
endef
```
解决办法：去掉depends中的```=@TARGET_bcm53xx_DEVICE_phicomm-k3 +@KERNEL_DEVMEM ```

## 鸣谢

Hill-98 & lwz322

## En

This is a Github page which contains Phicomm K3 screen controller source code.  

## Screen Interface

1. Update
2. Model, Version, CPU Temp, MAC
3. Port
4. Speed, WiFi (2.4G/5G client) Assicated
5. Weather, Date and Time
6. WiFi Info:SSID & Password (suppressible)
7. Client speed (IPv4 Forward only)
