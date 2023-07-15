# WSL

## Windows 设置

更新 wsl

```powershell
wsl --update
```

创建 vmSwitch 

```powershell
New-VMSwitch -Name "vEthernet" -NetAdapterName Bridge -AllowManagementOS:$true
```

Windows 的 `%USERPROFILE%` 中添加 `.wslconfig` 文件

```text
[wsl2]
networkingMode=bridged
# 上一步创建的 vmSwitch 的 NetAdapterName
vmSwitch=Bridge
dhcp=false
ipv6=true
localhostForwarding=true
macAddress=5c:bb:f6:9e:ee:fa
```

重新启动 wsl

```powershell
wsl --shutdown
wsl
```

## WSL 设置


## WSL 设置


## WSL 设置

修改 wsl 配置，`/etc/wsl.conf`

```text
[boot]
systemd=true
[network]
generateResolvConf=false
```

修改网络配置， `/lib/systemd/network/wsl_external.network`

```text
[Match]
Name=eth0
[Network]
Description=Bridge
DHCP=false
Address=192.168.31.209/24
Gateway=192.168.31.1
DNS=192.168.31.1
```

设置开机启动

```bash
systemctl restart systemd-networkd
systemctl restart systemd-resolved
systemctl enable systemd-networkd
systemctl enable systemd-resolved
```

修改 /etc/resolv.conf

```bash
rm /etc/resolv.conf
ln -sf /run/systemd/resolve/resolv.conf
```
