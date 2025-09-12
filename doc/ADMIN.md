## Configuration of the bridge
The bridge is [roughly configured at installation](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/blob/master/conf/config.yaml), e.g. allowed admin and user of the bot.
Finer configuration can be done by using the existing config panel in the Yunohost admin panel or by modifying the
following configuration file with SSH:
```/var/www/mautrix_whatsapp/config.yaml```
and then restarting the mautrix_whatsapp service.

#### User permissions


#### End-to-bridge encryption
The bridge can optionally encrypt messages between Matrix users and the bridge to hide messages from the homeserver. Using Postgres is strongly recommended when using end-to-bridge encryption.

If you want to enable it, go to the config panel section `Privacy -> Portal Rooms & Encryption Settings`. If you enable `Allow Encryption between Matrix Client and Bridge Server?`, the bridge won't enable encryption on its own, but will work in encrypted rooms.
Alternatively two more options will appear, `Force-enable Encryption in all Portal Rooms the Bridge creates?` which will automatically enable encryption in new portals and `Require encryption?` which will enforce encryption on any of the messages that you send (this will make the bridge drop any future unencrypted messages).

There is also the possibity to configure it in the bridge configuration YAML file in the section `bridge: encryption`.