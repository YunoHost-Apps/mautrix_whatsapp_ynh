<!--
N.B.: Questo README è stato automaticamente generato da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON DEVE essere modificato manualmente.
-->

# Matrix-WhatsApp bridge per YunoHost

[![Livello di integrazione](https://dash.yunohost.org/integration/mautrix_whatsapp.svg)](https://dash.yunohost.org/appci/app/mautrix_whatsapp) ![Stato di funzionamento](https://ci-apps.yunohost.org/ci/badges/mautrix_whatsapp.status.svg) ![Stato di manutenzione](https://ci-apps.yunohost.org/ci/badges/mautrix_whatsapp.maintain.svg)

[![Installa Matrix-WhatsApp bridge con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_whatsapp)

*[Leggi questo README in altre lingue.](./ALL_README.md)*

> *Questo pacchetto ti permette di installare Matrix-WhatsApp bridge su un server YunoHost in modo semplice e veloce.*  
> *Se non hai YunoHost, consulta [la guida](https://yunohost.org/install) per imparare a installarlo.*

## Panoramica

A puppeting bridge between Matrix and WhatsApp packaged as a YunoHost service.
Messages, media and notifications are bridged between a WhatsApp user and a matrix user.
With the RelayBot login option, the matrix user can invite other matrix user in a bridged WhatsApp room, such that even people without a WhatsApp account can participate to WhatsApp group conversations.
The ["Mautrix-WhatsApp"](https://docs.mau.fi/bridges/go/whatsapp/index.html) bridge consists in a synapse app service and relies on postgresql (mysql also available).
Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.

** Attention: always backup and restore the Yunohost matrix_synapse et mautrix_whatsapp apps together!**


**Versione pubblicata:** 0.10.6~ynh1
## Documentazione e risorse

- Sito web ufficiale dell’app: <https://maunium.net/go/mautrix-whatsapp/>
- Documentazione ufficiale per gli amministratori: <https://docs.mau.fi/bridges/go/whatsapp/index.html>
- Repository upstream del codice dell’app: <https://github.com/mautrix/whatsapp>
- Store di YunoHost: <https://apps.yunohost.org/app/mautrix_whatsapp>
- Segnala un problema: <https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/issues>

## Informazioni per sviluppatori

Si prega di inviare la tua pull request alla [branch di `testing`](https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing).

Per provare la branch di `testing`, si prega di procedere in questo modo:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
o
sudo yunohost app upgrade mautrix_whatsapp -u https://github.com/YunoHost-Apps/mautrix_whatsapp_ynh/tree/testing --debug
```

**Maggiori informazioni riguardo il pacchetto di quest’app:** <https://yunohost.org/packaging_apps>
