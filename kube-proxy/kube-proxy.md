# kube-proxy

## 1.设置ipvs模式

k8s整个集群为了访问通；默认是用iptables,性能下（kube-proxy在集群之间同步iptables的内容）

## 2.查看默认kube-proxy 使用的模式

```
kubectl logs -n kube-system kube-proxy-28xv4
```

## 3.需要修改 kube-proxy 的配置文件,修改mode 为ipvs。默认iptables，但是集群大了以后就很慢

```
#cm相当于configMap
kubectl edit cm kube-proxy -n kube-system
修改如下
   ipvs:
      excludeCIDRs: null
      minSyncPeriod: 0s
      scheduler: ""
      strictARP: false
      syncPeriod: 30s
    kind: KubeProxyConfiguration
    metricsBindAddress: 127.0.0.1:10249
    mode: "ipvs"
```

## 4.修改了kube-proxy的配置，为了让重新生效，需要杀掉以前的Kube-proxy

```
 kubectl get pod -A|grep kube-proxy
 kubectl delete pod kube-proxy-pqgnt -n kube-system
 #或者使用三剑客,等同于上面2句有时间再学习下这个
 kubectl get pod -n kube-system | grep kube-proxy |awk '{system("kubectl delete pod "$1" -n kube-system")}'
```

## 5.查看ipvs 代理规则 

```
ipvsadm -Ln
如果没有此命令，可以自行安装centos/ubuntu
yum -y install ipvsadm/apt install -y ipvsadm   
```

