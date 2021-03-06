ifconfig eno1 down                  # 先关闭eno1接口
brctl addbr br0                     # 增加一个虚拟网桥br0
brctl addif br0 eno1                # 在br0中添加一个接口eno1
brctl stp br0 off                   # 只有一个网桥，所以关闭生成树协议
brctl setfd br0 1                   # 设置br0的转发延迟
brctl sethello br0 1                # 设置br0的hello时间
ifconfig br0 0.0.0.0 promisc up     # 打开br0接口
ifconfig eno1 0.0.0.0 promisc up    # 打开eno1接口
dhclient br0                        # 从dhcp服务器获得br0的IP地址
brctl show br0                      # 查看虚拟网桥列表
brctl showstp br0                   # 查看br0的各接口信息
