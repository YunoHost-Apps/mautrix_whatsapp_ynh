<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# Matrix-WhatsApp bridge YunoHost-erako

[![Integrazio maila](https://dash.yunohost.org/integration/mautrix_whatsapp.svg)](https://ci-apps.yunohost.org/ci/apps/mautrix_whatsapp/) ![Funtzionamendu egoera](https://ci-apps.yunohost.org/ci/badges/mautrix_whatsapp.status.svg) ![Mantentze egoera](https://ci-apps.yunohost.org/ci/badges/mautrix_whatsapp.maintain.svg)

[![Instalatu Matrix-WhatsApp bridge YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_whatsapp)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek Matrix-WhatsApp bridge YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

A puppeting bridge between Matrix and WhatsApp packaged as a YunoHost service.
Messages, media and notifications are bridged between a WhatsApp user and a matrix user.
With the RelayBot login option, the matrix user can invite other matrix user in a bridged WhatsApp room, such that even people without a WhatsApp account can participate to WhatsApp group conversations.
The ["Mautrix-WhatsApp"](https://docs.mau.fi/bridges/go/whatsapp/index.html) bridge consists in a synapse app service and relies on postgresql (mysql also available).
Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.

** Attention: always backup and restore the Yunohost matrix_synapse et mautrix_whatsapp apps together!**


**Paketatutako bertsioa:** 0.10.9~ynh1
## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://maunium.net/go/mautrix-whatsapp/>
- Administratzaileen dokumentazio ofiziala: <https://docs.mau.fi/bridges/go/whatsapp/index.html>
- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/mautrix/whatsapp>
- YunoHost Denda: <https://apps.yunohost.org/app/mautrix_whatsapp>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
edo
sudo yunohost app upgrade mautrix_whatsapp -u https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
