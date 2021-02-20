#!/bin/bash
cd openwrt
# wireless
#rm -rf files/etc/config/wireless
#rm -rf files/etc/modules.d/wireless_enable
# Add luci-app-openclash
echo "clone openclash"
git clone https://github.com/vernesong/OpenClash.git package-temp
mv -f package-temp/luci-app-openclash package/lean/
rm -rf package-temp
# Add luci-app-adguardhome
echo "clone adguard home"
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package-temp
mv -f package-temp/ package/lean/luci-app-adguardhome
rm -rf package-temp
# Add luci-theme-opentomcat

git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  theme-temp/luci-theme-argon
rm -rf theme-temp/luci-theme-argon/LICENSE
rm -rf theme-temp/luci-theme-argon/README.md
rm -rf package/lean/luci-theme-argon
mv -f theme-temp/luci-theme-argon package/lean/
rm -rf theme-temp
default_theme='argon'
sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci
