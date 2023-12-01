Linux系统将jar包做成服务

1.**创建 Systemd 服务文件：** 在 `/etc/systemd/system/` 目录下创建一个新的服务文件（假设你的 JAR 文件名为 `yourapp.jar`）。

```sh
sudo nano /etc/systemd/system/gateway.service
```

在编辑器中添加以下内容：

```sh
[Unit]
Description=Your App Description
After=network.target

[Service]
ExecStart=/usr/bin/java -jar /path/to/yourapp.jar
WorkingDirectory=/path/to/your/app
Restart=always
User=youruser
Type=simple

[Install]
WantedBy=multi-user.target

```

请确保替换以下内容：

- `Your App Description`：对你的应用程序的简要描述。
- `/path/to/yourapp.jar`：你的 JAR 文件的完整路径。
- `/path/to/your/app`：你的应用程序的工作目录。
- `youruser`：你希望服务以其身份运行的用户名。

2.**重新加载 Systemd 配置：**

```
sudo systemctl daemon-reload
```

3.**启动服务：**

```
sudo systemctl start yourapp

```

4.**启用服务（开机自启）：**

```
sudo systemctl enable yourapp

```

现在，你的应用程序将作为一个服务在系统中运行。你可以使用 `sudo systemctl status yourapp` 检查服务状态，使用 `sudo systemctl stop yourapp` 停止服务，使用 `sudo systemctl restart yourapp` 重新启动服务。