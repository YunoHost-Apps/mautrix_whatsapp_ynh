<!--
NB: Deze README is automatisch gegenereerd door <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Hij mag NIET handmatig aangepast worden.
-->

# Matrix-WhatsApp bridge voor Yunohost

[![Integratieniveau](https://apps.yunohost.org/badge/integration/mautrix_whatsapp)](https://ci-apps.yunohost.org/ci/apps/mautrix_whatsapp/)
![Mate van functioneren](https://apps.yunohost.org/badge/state/mautrix_whatsapp)
![Onderhoudsstatus](https://apps.yunohost.org/badge/maintained/mautrix_whatsapp)

[![Matrix-WhatsApp bridge met Yunohost installeren](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_whatsapp)

*[Deze README in een andere taal lezen.](./ALL_README.md)*

> *Met dit pakket kun je Matrix-WhatsApp bridge snel en eenvoudig op een YunoHost-server installeren.*  
> *Als je nog geen YunoHost hebt, lees dan [de installatiehandleiding](https://yunohost.org/install), om te zien hoe je 'm installeert.*

## Overzicht

A puppeting bridge between Matrix and WhatsApp packaged as a YunoHost service.
Messages, media and notifications are bridged between a WhatsApp user and a matrix user.
With the RelayBot login option, the matrix user can invite other matrix user in a bridged WhatsApp room, such that even people without a WhatsApp account can participate to WhatsApp group conversations.
The ["Mautrix-WhatsApp"](https://docs.mau.fi/bridges/go/whatsapp/index.html) bridge consists in a synapse app service and relies on postgresql (mysql also available).
Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.

** Attention: always backup and restore the Yunohost matrix_synapse et mautrix_whatsapp apps together!**


**Geleverde versie:** 0.11.2~ynh1
## Documentatie en bronnen

- Officiele website van de app: <https://maunium.net/go/mautrix-whatsapp/>
- Officiele beheerdersdocumentatie: <https://docs.mau.fi/bridges/go/whatsapp/index.html>
- Upstream app codedepot: <https://github.com/mautrix/whatsapp>
- YunoHost-store: <https://apps.yunohost.org/app/mautrix_whatsapp>
- Meld een bug: <https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/issues>

## Ontwikkelaarsinformatie

Stuur je pull request alsjeblieft naar de [`testing`-branch](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing).

Om de `testing`-branch uit te proberen, ga als volgt te werk:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
of
sudo yunohost app upgrade mautrix_whatsapp -u https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
```

**Verdere informatie over app-packaging:** <https://yunohost.org/packaging_apps>
