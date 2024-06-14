关于docker容器cpu核数

**docker 资源配额** 

Docker 通过 cgroup 来控制容器使用的资源限制，可以对 docker 限制的资源包括 CPU、内存、磁盘

查看配置份额的帮助命令

```
docker run --help | grep cpu-shares
```

cpu 配额参数：-c, --cpu-shares int 

```
例 1：给容器实例分配 512 权重的 cpu 使用份额
参数： --cpu-shares 512
docker run -it --cpu-shares 512 centos /bin/bash
```

如何把 cpu 跑满？

stress 命令:

安装：

```
在 Ubuntu 中：
sudo apt update
sudo apt install stress
在 CentOS 中：
sudo yum install epel-release
sudo yum install stress
```

保存这个脚本为 `run_stress.sh`，然后赋予执行权限并运行：

```sh
#!/bin/bash

# 运行 stress，产生两个计算密集型任务
stress --cpu 2 &
# 获取 stress 进程的 PID
STRESS_PID=$!

# 使用 taskset 将 stress 绑定到核心 0 和核心 2
taskset -cp 0,2 $STRESS_PID

# 打印绑定结果
echo "stress 进程绑定到核心 0 和核心 2，PID: $STRESS_PID"

```

这个脚本将会启动 `stress` 工具并将其绑定到第一个和第三个核心，使这两个核心跑满。

```sh
chmod +x run_stress.sh
./run_stress.sh
```

