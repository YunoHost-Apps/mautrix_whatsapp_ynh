# A Matrix-WhatsApp puppeting bridge for YunoHost
[![How components fit togeter](https://camo.githubusercontent.com/857d5c90de07312a60e02ce89efe7f8ece86ab6b/68747470733a2f2f67617a697a6f76612e6e65742f7075622f6d6175747269782d77686174736170702e706e67)](https://github.com/tulir/mautrix-whatsapp/wiki)

[![Integration level](https://dash.yunohost.org/integration/mautrix-whatsapp_ynh.svg)](https://dash.yunohost.org/appci/app/mautrix-whatsapp_ynh)  
[![Install Mautrix-WhatsApp with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=mautrix-whatsapp_ynh)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install Mautrix-WhatsApp quickly and simply on a YunoHost server.  
If you don't have YunoHost, please see [here](https://yunohost.org/#/install) to know how to install and enjoy it.*

## Overview
A puppeting bridge between Matrix and WhatsApp packaged as a YunoHost service. Messages, media and notifications are bridged between a whatsapp user and a matrix user. The matrix user can invite other matrix user in a bridged whatsapp room, such that even people without a whatsapp account can participate to whatsapp group conversations. The ["mautrix-whatsapp"](https://github.com/tulir/mautrix-whatsapp/wiki) bridge consists in a synapse app service and relies on postgresql (mysql also available). Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.

**Shipped version:** 1.0

## Screenshots

![](Link to an screenshot for this app)

## Demo

* [Official demo](Link to a demo site for this app)

## Configuration

How to configure this app: by an admin panel, a plain file with SSH, or any other way.

## Documentation

 * Official documentation: https://github.com/tulir/mautrix-whatsapp/wiki
 * YunoHost documentation: If specific documentation is needed, feel free to contribute.

## YunoHost specific features

#### Multi-users support

Are LDAP and HTTP auth supported?
Can the app be used by multiple users?

#### Supported architectures

* x86-64b - [![Build Status](https://ci-apps.yunohost.org/ci/logs/REPLACEBYYOURAPP%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/REPLACEBYYOURAPP/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/REPLACEBYYOURAPP%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/REPLACEBYYOURAPP/)
* Jessie x86-64b - [![Build Status](https://ci-stretch.nohost.me/ci/logs/REPLACEBYYOURAPP%20%28Apps%29.svg)](https://ci-stretch.nohost.me/ci/apps/REPLACEBYYOURAPP/)

## Limitations

* Audio/Video calls are not bridged yet. It is recommended to install whatsapp on a virtual android running on a server. If whatsapp loses connection, e.g. the phone is set in flight mode, the bot has to be restarted by sending a reconnnect message in the matrix administration room.

## Additional information

* Other information you would add about this application

**More information on the documentation page:**  
https://github.com/tulir/mautrix-whatsapp/wiki

## Links

 * Report a bug: https://github.com/YunoHost-Apps/mautrix-whatsapp_ynh/issues
 * App website: https://github.com/Gredin67/mautrix-whatsapp_ynh
 * Upstream app repository: https://github.com/tulir/mautrix-whatsapp
 * YunoHost website: https://yunohost.org/

---

Developers info
----------------

To test communication between the app service and synapse on a VM, you must install a certificate:
```
echo | openssl s_client -showcerts -servername synapse.vm -connect synapse.vm:443 2>/dev/null | awk '/-----BEGIN CERTIFICATE-----/, /-----END CERTIFICATE-----/' >> /usr/local/share/ca-certificates/synapse.vm.crt
update-ca-certificates
```
