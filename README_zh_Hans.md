<!--
注意：此 README 由 <https://github.com/YunoHost/apps/tree/master/tools/readme_generator> 自动生成
请勿手动编辑。
-->

# YunoHost 上的 Matrix-WhatsApp bridge

[![集成程度](https://dash.yunohost.org/integration/mautrix_whatsapp.svg)](https://dash.yunohost.org/appci/app/mautrix_whatsapp) ![工作状态](https://ci-apps.yunohost.org/ci/badges/mautrix_whatsapp.status.svg) ![维护状态](https://ci-apps.yunohost.org/ci/badges/mautrix_whatsapp.maintain.svg)

[![使用 YunoHost 安装 Matrix-WhatsApp bridge](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_whatsapp)

*[阅读此 README 的其它语言版本。](./ALL_README.md)*

> *通过此软件包，您可以在 YunoHost 服务器上快速、简单地安装 Matrix-WhatsApp bridge。*  
> *如果您还没有 YunoHost，请参阅[指南](https://yunohost.org/install)了解如何安装它。*

## 概况

A puppeting bridge between Matrix and WhatsApp packaged as a YunoHost service.
Messages, media and notifications are bridged between a WhatsApp user and a matrix user.
With the RelayBot login option, the matrix user can invite other matrix user in a bridged WhatsApp room, such that even people without a WhatsApp account can participate to WhatsApp group conversations.
The ["Mautrix-WhatsApp"](https://docs.mau.fi/bridges/go/whatsapp/index.html) bridge consists in a synapse app service and relies on postgresql (mysql also available).
Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.

** Attention: always backup and restore the Yunohost matrix_synapse et mautrix_whatsapp apps together!**


**分发版本：** 0.10.8~ynh1
## 文档与资源

- 官方应用网站： <https://maunium.net/go/mautrix-whatsapp/>
- 官方管理文档： <https://docs.mau.fi/bridges/go/whatsapp/index.html>
- 上游应用代码库： <https://github.com/mautrix/whatsapp>
- YunoHost 商店： <https://apps.yunohost.org/app/mautrix_whatsapp>
- 报告 bug： <https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/issues>

## 开发者信息

请向 [`testing` 分支](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing) 发送拉取请求。

如要尝试 `testing` 分支，请这样操作：

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
或
sudo yunohost app upgrade mautrix_whatsapp -u https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
```

**有关应用打包的更多信息：** <https://yunohost.org/packaging_apps>
