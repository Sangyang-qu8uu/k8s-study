# Scoop与nvm

>
>
>scoop——强大的Windows命令行包管理工具 官网：https://scoop.sh/

## 1.打开 PowerShell

设置用户安装路径

```powershell
$env:SCOOP='F:\software\scoop' 
[Environment]::SetEnvironmentVariable('USERSCOOP', $env:SCOOP, 'User')
```

## 2设置允许 PowerShell 执行本地脚本

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 3安装 Scoop

```powershell
irm get.scoop.sh | iex
```

## 4.强制管理员

```powershell
iwr -useb get.scoop.sh -outfile 'install.ps1'
.\install.ps1 -RunAsAdmin
```

## 5.卸载

```powershell
scoop uninstall scoop
```

## 常用命令scoop list查看安装的软件

```powershell
scoop install nodejs nvm
```

