<!--
N.B.: This README was automatically generated by <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
It shall NOT be edited by hand.
-->

# Matrix-WhatsApp bridge for YunoHost

[![Integration level](https://dash.yunohost.org/integration/mautrix_whatsapp.svg)](https://ci-apps.yunohost.org/ci/apps/mautrix_whatsapp/) ![Working status](https://ci-apps.yunohost.org/ci/badges/mautrix_whatsapp.status.svg) ![Maintenance status](https://ci-apps.yunohost.org/ci/badges/mautrix_whatsapp.maintain.svg)

[![Install Matrix-WhatsApp bridge with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_whatsapp)

*[Read this README in other languages.](./ALL_README.md)*

> *This package allows you to install Matrix-WhatsApp bridge quickly and simply on a YunoHost server.*  
> *If you don't have YunoHost, please consult [the guide](https://yunohost.org/install) to learn how to install it.*

## Overview

A puppeting bridge between Matrix and WhatsApp packaged as a YunoHost service.
Messages, media and notifications are bridged between a WhatsApp user and a matrix user.
With the RelayBot login option, the matrix user can invite other matrix user in a bridged WhatsApp room, such that even people without a WhatsApp account can participate to WhatsApp group conversations.
The ["Mautrix-WhatsApp"](https://docs.mau.fi/bridges/go/whatsapp/index.html) bridge consists in a synapse app service and relies on postgresql (mysql also available).
Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.

** Attention: always backup and restore the Yunohost matrix_synapse et mautrix_whatsapp apps together!**


**Shipped version:** 0.10.7~ynh1
## Documentation and resources

- Official app website: <https://maunium.net/go/mautrix-whatsapp/>
- Official admin documentation: <https://docs.mau.fi/bridges/go/whatsapp/index.html>
- Upstream app code repository: <https://github.com/mautrix/whatsapp>
- YunoHost Store: <https://apps.yunohost.org/app/mautrix_whatsapp>
- Report a bug: <https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/issues>

## Developer info

Please send your pull request to the [`testing` branch](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing).

To try the `testing` branch, please proceed like that:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
or
sudo yunohost app upgrade mautrix_whatsapp -u https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
```

**More info regarding app packaging:** <https://yunohost.org/packaging_apps>
