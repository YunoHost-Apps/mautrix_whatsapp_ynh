# A Matrix-WhatsApp puppeting bridge for YunoHost
[![How components fit togeter](https://camo.githubusercontent.com/857d5c90de07312a60e02ce89efe7f8ece86ab6b/68747470733a2f2f67617a697a6f76612e6e65742f7075622f6d6175747269782d77686174736170702e706e67)](https://docs.mau.fi/bridges/go/whatsapp/index.html)

[![Integration level](https://dash.yunohost.org/integration/mautrix_whatsapp.svg)](https://dash.yunohost.org/appci/app/mautrix_whatsapp)  
[![Install Mautrix-WhatsApp with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=mautrix_whatsapp)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install a Mautrix-WhatsApp bridge quickly and simply on a YunoHost server alongside Matrix-Synapse.  
If you don't have YunoHost, please see [here](https://yunohost.org/#/install) to know how to install and enjoy it.*

## Overview
A puppeting bridge between Matrix and WhatsApp packaged as a YunoHost service. Messages, media and notifications are bridged between a WhatsApp user and a matrix user. With the RelayBot login option, the matrix user can invite other matrix user in a bridged WhatsApp room, such that even people without a WhatsApp account can participate to WhatsApp group conversations. The ["Mautrix-WhatsApp"](https://docs.mau.fi/bridges/go/whatsapp/index.html) bridge consists in a synapse app service and relies on postgresql (mysql also available). Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.

** Attention: always backup and restore the Yunohost matrix_synapse et mautrix_whatsapp apps together!**

**Shipped version:** 0.1.6

## Screenshots

![](Link to an screenshot for this app)

## List of known public services

* Ask on one of the following rooms: #mautrix_yunohost:matrix.fdn.fr or #whatsapp:maunium.net

## Bridging usage
** Note that several WhatsApp and Matrix users can be bridged, each WhatsApp account has its own bot administration room. If they are in a same WhatsApp group, only one matrix room will be created. **

### Bridge a WhatsApp user and a Matrix user
* First your matrix user or server has to be authorized in the bridge configuration (see below)
* Then, invite the bot (default @whatsappbot:yoursynapse.domain) 
* The room with the Mautrix-WhatsApp bot is called "administration room".
* Type ``login``
* Capture the QR code with the camera in the whatsapp of your VM or smartphone (WhatsApp Web)
* Send ``help`` to the bot in the created room to know how to control the bot.
See also [upstream wiki Authentication page](https://docs.mau.fi/bridges/go/whatsapp/authentication.html)



### Relaybot: Bridge a group for several Matrix and several WhatsApp users to chat together
* First Relaybot option should be enabled in the bridge configuration (default=disabled, see below) and room ID of the relaybot administration room added.
* Once the bot administration room is setup, you can also bridge all messages between a Matrix room and a WhatsApp room/group. 
In WhatsApp all messages will be sent by the account who is logged in with a prefix for the source matrix user. On the matrix side the bridge will still create matrix users corresponding to the WhatsApp users when they send a message.
See also [upstream wiki Relaybot page](https://docs.mau.fi/bridges/go/whatsapp/relaybot.html)

## Configuration of the bridge

The bridge is [roughly configured at installation](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/blob/master/conf/config.yaml), e.g. allowed admin and user of the bot. Finer configuration can be done by modifying the
following configuration file with SSH: 
```/opt/yunohost/mautrix_whatsapp/config.yaml```
and then restarting the mautrix_whatsapp service.

## Documentation

 * Official "Mautrix-WhatsApp" documentation: https://docs.mau.fi/bridges/go/whatsapp/index.html
 * Matrix room (matrix bridges in Yunohost): #mautrix_yunohost:matrix.fdn.fr
 * Matrix room (upstream app): #whatsapp:maunium.net
In case you need to upload your logs somewhere, be aware that they contain your contacts' and your phone numbers. Strip them out with 
``| sed -r 's/[0-9]{10,}/📞/g' ``
 * "Mautrix-WhatsApp" bridge is based on the [Rhymen/go-whatsapp](https://github.com/Rhymen/go-whatsapp) implementation of the [sigalor/whatsapp-web-reveng](https://github.com/sigalor/whatsapp-web-reveng) project.
 * YunoHost documentation: If more specific documentation is needed, feel free to contribute.

## YunoHost specific features

#### Multi-users support

* Bot users are not related to Yunohost users. Any Matrix account or Synapse server autorized in the configuration of the bridge can invite/use the bot. 
* The WhatsApp bot is a local Matrix-Synapse user, but accessible through federation (synapse public or private).
* Several Signal and Matrix users can be bridged with one bridge, each user has its own bot administration room. 
* If several bot users are in a same WhatsApp group, only one Matrix room will be created by the bridge.
* See https://github.com/YunoHost-Apps/synapse_ynh#multi-users-support

#### Multi-instance support

* Multi-instance installation should work. Several bridge instances could be installed for one Matrix-Synapse instance so that one Matrix user can bridge several WhatsApp accounts. 
* Several bridge instances could be installed for each Matrix-Synapse instance to benefit from it. But one bridge can be used by users from several Matrix-Synapse instances.

#### Supported architectures

* Tested on ARMv7 in April 2020
* x86-64b - [![Build Status](https://ci-apps.yunohost.org/ci/logs/mautrix_whatsapp%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/mautrix_whatsapp/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/mautrix_whatsapp%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/mautrix_whatsapp/)

## Limitations

* Audio/Video calls are not bridged yet. 
* If WhatsApp loses connection, e.g. the phone is set in flight mode or push notifications are deactivated, the bot has sometimes to be restarted manually by sending a reconnnect message in the matrix administration room.

## Additional information

* It is recommended to install WhatsApp on a virtual android running on a server, see [upstream wiki Android-VM-Setup page](https://docs.mau.fi/bridges/go/whatsapp/android-vm-setup.html) 

**More information on the documentation page:**  
https://docs.mau.fi/bridges/go/whatsapp/index.html

## Links

 * Report a bug: https://github.com/YunoHost-Apps/mautrix-whatsapp_ynh/issues
 * App website: https://github.com/YunoHost-Apps/mautrix-whatsapp_ynh
 * Upstream app documentation: https://docs.mau.fi/bridges/go/whatsapp/index.html
 * Upstream app repository: https://github.com/tulir/mautrix-whatsapp
 * Up-Upstream repository: https://github.com/Rhymen/go-whatsapp
 * Up-Up-Upstream repository: https://github.com/sigalor/whatsapp-web-reveng
 * YunoHost website: https://yunohost.org/

---

## Developer info

Please do your pull request to the testing branch.
To try the testing branch, please proceed like that:
```
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
or
sudo yunohost app upgrade synapse -u https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
```

To test communication between the App Service and Matrix-Synapse on a VM (e.g. with domain name: synapse.vm), you must install a certificate:
```
echo | openssl s_client -showcerts -servername synapse.vm -connect synapse.vm:443 2>/dev/null | awk '/-----BEGIN CERTIFICATE-----/, /-----END CERTIFICATE-----/' >> /usr/local/share/ca-certificates/synapse.vm.crt
update-ca-certificates
```
