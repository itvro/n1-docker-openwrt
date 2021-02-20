# N1 Docker版本(修改于[项目](https://github.com/huangqian8/Cloud-N1-OpenWrt))

## 更新日志
- 20210220 修改主题argon，删除网易云音乐解锁，添加京东签到
- 20210219 删除docker，添加adguardhome，netdata等luci


## Armbian安装Docker

使用本项目Release和Dockerfile构建，根据`自制Docker Openwrt镜像及运行镜像.txt`

## Armbian访问容器
需要修改Armbian的文件 /etc/network/interfaces.d/eth0 为以下内容。其中IP和网关等根据自己使用修改
~~~
auto eth0
iface eth0 inet manual
auto macvlan
iface macvlan inet static
        #armbian地址
	      address 10.0.0.5
        broadcast 10.0.0.255
        netmask 255.255.255.0
        #旁路由的ip地址
        gateway 10.0.0.2
        dns-nameservers 127.0.0.1
	      pre-up ip link add macvlan link eth0 type macvlan mode bridge
  	    post-down ip link del macvlan link eth0 type macvlan mode bridge
~~~